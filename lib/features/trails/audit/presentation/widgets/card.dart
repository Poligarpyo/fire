import 'package:flutter/material.dart';
import '../../domain/entities/Audit.dart';
import 'MetaItem.dart';
import 'inrow.dart';

class AuditCard extends StatelessWidget {
  final Audit audit;

  const AuditCard({
    super.key,
    required this.audit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 🔹 ACTIVITY + ACTION
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    audit.activity,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    audit.actionDisplay,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            /// 🔹 EMPLOYEE NAME
            Row(
              children: [
                const Icon(Icons.person_outline, size: 18, color: Colors.grey),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '${audit.empLname}, ${audit.empFname} ${audit.empMname}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),
            const Divider(),

            /// 🔹 METADATA ROW
            Row(
              children: [
                MetaItem(
                  icon: Icons.calendar_today_outlined,
                  value: '${audit.month} ${audit.dayOnly}, ${audit.year}',
                ),
                const SizedBox(width: 16),
                MetaItem(
                  icon: Icons.apartment_outlined,
                  value: audit.deptName,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
