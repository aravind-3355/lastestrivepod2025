// NotificationHandler Remote Data Source
// Handles API calls for notification_handler data

import '../models/notification_handler_model.dart';

abstract class NotificationHandlerRemoteDataSource {
  /// Gets all notificationHandlers from the API
  Future<List<NotificationHandlerModel>> getAllNotificationHandlers();
  
  /// Gets a specific notificationHandler by ID from the API
  Future<NotificationHandlerModel> getNotificationHandlerById(String id);
}

class NotificationHandlerRemoteDataSourceImpl implements NotificationHandlerRemoteDataSource {
  // Add HTTP client dependency here
  
  @override
  Future<List<NotificationHandlerModel>> getAllNotificationHandlers() async {
    // TODO: Implement API call
    throw UnimplementedError();
  }
  
  @override
  Future<NotificationHandlerModel> getNotificationHandlerById(String id) async {
    // TODO: Implement API call
    throw UnimplementedError();
  }
}
