// UserProfile Repository Implementation
// Implements the repository interface for user_profile

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/user_profile_entity.dart';
import '../../domain/repositories/user_profile_repository.dart';
import '../datasources/user_profile_local_datasource.dart';
import '../datasources/user_profile_remote_datasource.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  final UserProfileRemoteDataSource remoteDataSource;
  final UserProfileLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UserProfileRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<UserProfileEntity>>> getAllUserProfiles() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUserProfiles = await remoteDataSource.getAllUserProfiles();
        localDataSource.cacheUserProfiles(remoteUserProfiles);
        return Right(remoteUserProfiles);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localUserProfiles = await localDataSource.getCachedUserProfiles();
        return Right(localUserProfiles);
      } catch (e) {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, UserProfileEntity>> getUserProfileById(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final userProfile = await remoteDataSource.getUserProfileById(id);
        return Right(userProfile);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
