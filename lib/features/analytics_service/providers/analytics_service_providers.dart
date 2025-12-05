// AnalyticsService Providers
// Riverpod providers for the analytics_service feature

import 'package:flutter_riverpod/flutter_riverpod.dart';

// Simple providers for service-only feature
final analyticsServiceStateProvider = StateProvider<String>((ref) => 'initial');
