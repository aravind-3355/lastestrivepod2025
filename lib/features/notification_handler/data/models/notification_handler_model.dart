// NotificationHandler Model
// Data model for the notification_handler feature

import '../../domain/entities/notification_handler_entity.dart';

class NotificationHandlerModel extends NotificationHandlerEntity {
  const NotificationHandlerModel({
    required String id,
    // Add other fields here
  }) : super(id: id);

  factory NotificationHandlerModel.fromJson(Map<String, dynamic> json) {
    return NotificationHandlerModel(
      id: json['id'] as String,
      // Map other fields here
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      // Add other fields here
    };
  }
}
