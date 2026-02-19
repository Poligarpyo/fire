import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/offline_sms/presentation/providers/offline_sms_providers.dart';
import 'connectivity_provider.dart';

final autoSyncProvider = Provider<void>((ref) {
  ref.listen<AsyncValue<bool>>(connectivityStatusProvider, (
    previous,
    next,
  ) async {
    final isConnected = next?.value ?? false; // Add null check for `next`

    if (isConnected) {
      final repository = ref.read(offlineSmsRepositoryProvider);
      try {
        print("Internet restored — starting sync");
        await repository.syncPendingReports();
        print("All pending reports synced successfully");
      } catch (e) {
        print("Sync error: $e");
      }
    }
  });
});
