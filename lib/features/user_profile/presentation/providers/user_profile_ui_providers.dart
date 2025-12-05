// UserProfile UI Providers
// Riverpod providers specific to UI state

import 'package:flutter_riverpod/flutter_riverpod.dart';

// UI state providers
final userProfileFilterProvider = StateProvider<String>((ref) => '');

final userProfileSortOrderProvider = StateProvider<SortOrder>((ref) => SortOrder.asc);

enum SortOrder { asc, desc }
