// UserProfile Entity
// Core business entity for user_profile

import 'package:equatable/equatable.dart';

class UserProfileEntity extends Equatable {
  final String id;
  // Add other properties here

  const UserProfileEntity({
    required this.id,
    // Add other required parameters here
  });

  @override
  List<Object> get props => [id]; // Add other properties to props
}
