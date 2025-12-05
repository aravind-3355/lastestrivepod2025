// UserProfile Detail Screen
// Screen that displays details of a specific userProfile

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/user_profile_providers.dart';

class UserProfileDetailScreen extends ConsumerWidget {
  const UserProfileDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserProfile Details'),
      ),
      body: const Center(
        child: Text('UserProfile Detail Screen'),
      ),
    );
  }
}
