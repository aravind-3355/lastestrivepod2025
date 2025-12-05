// Get UserProfile By ID Use Case
// Business logic for retrieving a specific userProfile entity

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user_profile_entity.dart';
import '../repositories/user_profile_repository.dart';

class GetUserProfileById implements UseCase<UserProfileEntity, UserProfileParams> {
  final UserProfileRepository repository;
  
  GetUserProfileById(this.repository);
  
  @override
  Future<Either<Failure, UserProfileEntity>> call(UserProfileParams params) {
    return repository.getUserProfileById(params.id);
  }
}

class UserProfileParams extends Equatable {
  final String id;
  
  const UserProfileParams({required this.id});
  
  @override
  List<Object> get props => [id];
}
