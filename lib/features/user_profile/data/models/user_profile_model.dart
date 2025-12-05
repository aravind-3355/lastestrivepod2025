// UserProfile Model
// Data model for the user_profile feature

import '../../domain/entities/user_profile_entity.dart';

class UserProfileModel extends UserProfileEntity {
  const UserProfileModel({
    required String id,
    // Add other fields here
  }) : super(id: id);

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
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
