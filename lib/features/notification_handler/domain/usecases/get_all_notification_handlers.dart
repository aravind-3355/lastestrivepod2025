// Get All NotificationHandlers Use Case
// Business logic for retrieving all notificationHandler entities

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/notification_handler_entity.dart';
import '../repositories/notification_handler_repository.dart';

class GetAllNotificationHandlers implements UseCase<List<NotificationHandlerEntity>, NoParams> {
  final NotificationHandlerRepository repository;
  
  GetAllNotificationHandlers(this.repository);
  
  @override
  Future<Either<Failure, List<NotificationHandlerEntity>>> call(NoParams params) {
    return repository.getAllNotificationHandlers();
  }
}
