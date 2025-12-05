// UserProfile Providers
// Riverpod providers for the user_profile feature

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/network_info.dart';
import '../../../../core/usecases/usecase.dart';
import '../data/datasources/user_profile_local_datasource.dart';
import '../data/datasources/user_profile_remote_datasource.dart';
import '../data/repositories/user_profile_repository_impl.dart';
import '../domain/entities/user_profile_entity.dart';
import '../domain/repositories/user_profile_repository.dart';
import '../domain/usecases/get_all_user_profiles.dart';
import '../domain/usecases/get_user_profile_by_id.dart';

// Data sources
final userProfileRemoteDataSourceProvider = Provider<UserProfileRemoteDataSource>(
  (ref) => UserProfileRemoteDataSourceImpl(),
);

final userProfileLocalDataSourceProvider = Provider<UserProfileLocalDataSource>(
  (ref) => UserProfileLocalDataSourceImpl(),
);

// Repository
final userProfileRepositoryProvider = Provider<UserProfileRepository>(
  (ref) => UserProfileRepositoryImpl(
    remoteDataSource: ref.read(userProfileRemoteDataSourceProvider),
    localDataSource: ref.read(userProfileLocalDataSourceProvider),
    networkInfo: ref.read(networkInfoProvider),
  ),
);

// Use cases
final getAllUserProfilesProvider = Provider<GetAllUserProfiles>(
  (ref) => GetAllUserProfiles(ref.read(userProfileRepositoryProvider)),
);

final getUserProfileByIdProvider = Provider<GetUserProfileById>(
  (ref) => GetUserProfileById(ref.read(userProfileRepositoryProvider)),
);

// State providers
final userProfileListProvider = FutureProvider<List<UserProfileEntity>>(
  (ref) async {
    final usecase = ref.read(getAllUserProfilesProvider);
    final result = await usecase(NoParams());
    
    return result.fold(
      (failure) => throw Exception(failure.toString()),
      (userProfiles) => userProfiles,
    );
  },
);

final selectedUserProfileIdProvider = StateProvider<String?>((ref) => null);

final selectedUserProfileProvider = FutureProvider<UserProfileEntity?>((ref) async {
  final id = ref.watch(selectedUserProfileIdProvider);
  if (id == null) return null;
  
  final usecase = ref.read(getUserProfileByIdProvider);
  final result = await usecase(UserProfileParams(id: id));
  
  return result.fold(
    (failure) => throw Exception(failure.toString()),
    (userProfile) => userProfile,
  );
});
