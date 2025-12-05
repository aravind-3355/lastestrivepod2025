// UserProfile List Screen
// Screen that displays a list of userProfile items

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/user_profile_providers.dart';
import '../widgets/user_profile_list_item.dart';

class UserProfileListScreen extends ConsumerWidget {
  const UserProfileListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UserProfiles'),
      ),
      body: const Center(
        child: Text('UserProfile List Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new userProfile action
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
