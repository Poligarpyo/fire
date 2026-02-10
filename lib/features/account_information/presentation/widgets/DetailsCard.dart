import 'package:flutter/material.dart';

import '../../domain/entities/Account.dart';

class DetailsCard extends StatelessWidget {
  final Account account;

  const DetailsCard({required this.account});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _DetailRow('Phone', account.phone),
          _DetailRow('Address', account.address),
          _DetailRow('City', account.city),
          _DetailRow('Country', account.country),
          _DetailRow('ZIP Code', account.zipCode),
          _DetailRow(
            'Type',
            account.type.toString(),
          ),
          _DetailRow(
            'Verification Level',
            account.verificationLevel.toString(),
          ),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _DetailRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.grey),
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
