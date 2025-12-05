// NotificationHandler Providers
// Riverpod providers for the notification_handler feature

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/network_info.dart';
import '../../../../core/usecases/usecase.dart';
import '../data/datasources/notification_handler_local_datasource.dart';
import '../data/datasources/notification_handler_remote_datasource.dart';
import '../data/repositories/notification_handler_repository_impl.dart';
import '../domain/entities/notification_handler_entity.dart';
import '../domain/repositories/notification_handler_repository.dart';
import '../domain/usecases/get_all_notification_handlers.dart';
import '../domain/usecases/get_notification_handler_by_id.dart';

// Data sources
final notificationHandlerRemoteDataSourceProvider = Provider<NotificationHandlerRemoteDataSource>(
  (ref) => NotificationHandlerRemoteDataSourceImpl(),
);

final notificationHandlerLocalDataSourceProvider = Provider<NotificationHandlerLocalDataSource>(
  (ref) => NotificationHandlerLocalDataSourceImpl(),
);

// Repository
final notificationHandlerRepositoryProvider = Provider<NotificationHandlerRepository>(
  (ref) => NotificationHandlerRepositoryImpl(
    remoteDataSource: ref.read(notificationHandlerRemoteDataSourceProvider),
    localDataSource: ref.read(notificationHandlerLocalDataSourceProvider),
    networkInfo: ref.read(networkInfoProvider),
  ),
);

// Use cases
final getAllNotificationHandlersProvider = Provider<GetAllNotificationHandlers>(
  (ref) => GetAllNotificationHandlers(ref.read(notificationHandlerRepositoryProvider)),
);

final getNotificationHandlerByIdProvider = Provider<GetNotificationHandlerById>(
  (ref) => GetNotificationHandlerById(ref.read(notificationHandlerRepositoryProvider)),
);

// State providers
final notificationHandlerListProvider = FutureProvider<List<NotificationHandlerEntity>>(
  (ref) async {
    final usecase = ref.read(getAllNotificationHandlersProvider);
    final result = await usecase(NoParams());
    
    return result.fold(
      (failure) => throw Exception(failure.toString()),
      (notificationHandlers) => notificationHandlers,
    );
  },
);

final selectedNotificationHandlerIdProvider = StateProvider<String?>((ref) => null);

final selectedNotificationHandlerProvider = FutureProvider<NotificationHandlerEntity?>((ref) async {
  final id = ref.watch(selectedNotificationHandlerIdProvider);
  if (id == null) return null;
  
  final usecase = ref.read(getNotificationHandlerByIdProvider);
  final result = await usecase(NotificationHandlerParams(id: id));
  
  return result.fold(
    (failure) => throw Exception(failure.toString()),
    (notificationHandler) => notificationHandler,
  );
});
