// Get NotificationHandler By ID Use Case
// Business logic for retrieving a specific notificationHandler entity

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/notification_handler_entity.dart';
import '../repositories/notification_handler_repository.dart';

class GetNotificationHandlerById implements UseCase<NotificationHandlerEntity, NotificationHandlerParams> {
  final NotificationHandlerRepository repository;
  
  GetNotificationHandlerById(this.repository);
  
  @override
  Future<Either<Failure, NotificationHandlerEntity>> call(NotificationHandlerParams params) {
    return repository.getNotificationHandlerById(params.id);
  }
}

class NotificationHandlerParams extends Equatable {
  final String id;
  
  const NotificationHandlerParams({required this.id});
  
  @override
  List<Object> get props => [id];
}
