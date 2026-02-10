import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../router/app_router.dart';
import '../../../../../utils/context_extensions.dart';
import '../../domain/entities/Audit.dart';
import '../providers/audit_providers.dart';
import '../widgets/card.dart';

class AuditScreen extends ConsumerStatefulWidget {
  const AuditScreen({super.key});

  @override
  ConsumerState<AuditScreen> createState() => _AuditScreenState();
}

class _AuditScreenState extends ConsumerState<AuditScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  bool _isWaitingToLoadMore = false;

  Timer? _loadMoreTimer;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        if (_isWaitingToLoadMore) return;
        if (_loadMoreTimer?.isActive ?? false) return;

        _loadMoreTimer = Timer(const Duration(seconds: 2), () { 
          ref
              .read(auditProvider.notifier)
              .loadMore(search: _searchController.text);
        });
      }
    }); 
  }

  @override
  void dispose() {
    _loadMoreTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    _loadMoreTimer?.cancel(); 
    _loadMoreTimer = Timer(const Duration(seconds: 2), () {
      ref.read(auditProvider.notifier).loadMore(search: value);
      ref.read(auditProvider.notifier).loadInitial(search: value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(auditProvider);
    final notifier = ref.watch(auditProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Audit Trail'),
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: context.colorScheme.primary),
          onPressed: () {
            context.go(SGRoute.home.route);
          },
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await notifier.refresh();
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Audit List',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    Text(
                      '${state.audit.length}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                TextField(
                  onChanged: _onSearchChanged,
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search Audit Trail',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.deepPurple.shade50,
                  ),
                ),
                const SizedBox(height: 12),
                // 🔹 Scrollable list
                Expanded(
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    controller: _scrollController,
                    itemCount:
                        state.audit.length + (state.isLoading ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == state.audit.length) {
                        return const Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      } 
                      final audit = state.audit[index];
                      return AuditCard(
                        audit: audit,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
