// NotificationHandler Entity
// Core business entity for notification_handler

import 'package:equatable/equatable.dart';

class NotificationHandlerEntity extends Equatable {
  final String id;
  // Add other properties here

  const NotificationHandlerEntity({
    required this.id,
    // Add other required parameters here
  });

  @override
  List<Object> get props => [id]; // Add other properties to props
}
