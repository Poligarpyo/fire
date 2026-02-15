import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; 
import '../../../../common/logout_confimation.dart';  
import '../providers/account_providers.dart';
import '../widgets/AccountError.dart';
import '../widgets/AccountHeader.dart';
import '../widgets/AccountLoading.dart';
import '../widgets/BooleanCard.dart';
import '../widgets/DetailsCard.dart';
import '../widgets/StatsGrid.dart';

class AccountScreen extends ConsumerStatefulWidget {
  const AccountScreen({super.key});

  @override
  ConsumerState<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends ConsumerState<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = ref.watch(accountProvider);
    final lastFourState = ref.watch(lastFourNotifierProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text(
          'Account',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: state.when(
        loading: () => const AccountLoading(),
        error: (error, _) => AccountError(error.toString()),
        data: (account) => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AccountHeader(account: account),
              const SizedBox(height: 16),
              StatsGrid(account: account),
              const SizedBox(height: 24),
              Text(
                'Account Details',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              // Last 4 digits card
              lastFourState.when(
                loading: () => const CircularProgressIndicator(),
                error: (e, _) => Text('Error: $e'),
                data: (lastFour) => Card(
                  color: Colors.white,
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Last 4 Digits: $lastFour',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),
              DetailsCard(account: account),
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Account Flags',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  BooleanCard(
                    title: 'Swap Free',
                    value: account.isSwapFree,
                  ),
                  const SizedBox(height: 12),
                  BooleanCard(
                    title: 'Has Open Trades',
                    value: account.isAnyOpenTrades,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.red),
                    title: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.red),
                    ),
                    onTap: () {
                      showLogoutDialog(context, ref);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
