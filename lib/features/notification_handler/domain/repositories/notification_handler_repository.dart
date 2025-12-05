// NotificationHandler Repository Interface
// Defines data operations for notification_handler

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/notification_handler_entity.dart';

abstract class NotificationHandlerRepository {
  /// Gets all notificationHandler entities
  Future<Either<Failure, List<NotificationHandlerEntity>>> getAllNotificationHandlers();
  
  /// Gets a specific notificationHandler entity by ID
  Future<Either<Failure, NotificationHandlerEntity>> getNotificationHandlerById(String id);
}
