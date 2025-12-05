// UserProfile Remote Data Source
// Handles API calls for user_profile data

import '../models/user_profile_model.dart';

abstract class UserProfileRemoteDataSource {
  /// Gets all userProfiles from the API
  Future<List<UserProfileModel>> getAllUserProfiles();
  
  /// Gets a specific userProfile by ID from the API
  Future<UserProfileModel> getUserProfileById(String id);
}

class UserProfileRemoteDataSourceImpl implements UserProfileRemoteDataSource {
  // Add HTTP client dependency here
  
  @override
  Future<List<UserProfileModel>> getAllUserProfiles() async {
    // TODO: Implement API call
    throw UnimplementedError();
  }
  
  @override
  Future<UserProfileModel> getUserProfileById(String id) async {
    // TODO: Implement API call
    throw UnimplementedError();
  }
}
