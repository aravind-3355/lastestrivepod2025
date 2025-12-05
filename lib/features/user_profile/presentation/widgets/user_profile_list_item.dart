// UserProfile List Item
// Widget that displays a single userProfile in a list

import 'package:flutter/material.dart';

class UserProfileListItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  
  const UserProfileListItem({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
