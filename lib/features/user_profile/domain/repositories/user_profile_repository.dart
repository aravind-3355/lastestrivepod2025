// UserProfile Repository Interface
// Defines data operations for user_profile

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_profile_entity.dart';

abstract class UserProfileRepository {
  /// Gets all userProfile entities
  Future<Either<Failure, List<UserProfileEntity>>> getAllUserProfiles();
  
  /// Gets a specific userProfile entity by ID
  Future<Either<Failure, UserProfileEntity>> getUserProfileById(String id);
}
