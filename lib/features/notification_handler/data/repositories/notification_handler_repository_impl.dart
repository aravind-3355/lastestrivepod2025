// NotificationHandler Repository Implementation
// Implements the repository interface for notification_handler

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/notification_handler_entity.dart';
import '../../domain/repositories/notification_handler_repository.dart';
import '../datasources/notification_handler_local_datasource.dart';
import '../datasources/notification_handler_remote_datasource.dart';

class NotificationHandlerRepositoryImpl implements NotificationHandlerRepository {
  final NotificationHandlerRemoteDataSource remoteDataSource;
  final NotificationHandlerLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  NotificationHandlerRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<NotificationHandlerEntity>>> getAllNotificationHandlers() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteNotificationHandlers = await remoteDataSource.getAllNotificationHandlers();
        localDataSource.cacheNotificationHandlers(remoteNotificationHandlers);
        return Right(remoteNotificationHandlers);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localNotificationHandlers = await localDataSource.getCachedNotificationHandlers();
        return Right(localNotificationHandlers);
      } catch (e) {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, NotificationHandlerEntity>> getNotificationHandlerById(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final notificationHandler = await remoteDataSource.getNotificationHandlerById(id);
        return Right(notificationHandler);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
