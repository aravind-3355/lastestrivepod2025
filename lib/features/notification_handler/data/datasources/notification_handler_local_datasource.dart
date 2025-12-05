// NotificationHandler Local Data Source
// Handles local storage for notification_handler data

import '../models/notification_handler_model.dart';

abstract class NotificationHandlerLocalDataSource {
  /// Gets cached notificationHandlers from local storage
  Future<List<NotificationHandlerModel>> getCachedNotificationHandlers();
  
  /// Caches notificationHandlers to local storage
  Future<void> cacheNotificationHandlers(List<NotificationHandlerModel> notificationHandlers);
}

class NotificationHandlerLocalDataSourceImpl implements NotificationHandlerLocalDataSource {
  // Add local storage dependency here
  
  @override
  Future<List<NotificationHandlerModel>> getCachedNotificationHandlers() async {
    // TODO: Implement local storage retrieval
    throw UnimplementedError();
  }
  
  @override
  Future<void> cacheNotificationHandlers(List<NotificationHandlerModel> notificationHandlers) async {
    // TODO: Implement local storage caching
    throw UnimplementedError();
  }
}
