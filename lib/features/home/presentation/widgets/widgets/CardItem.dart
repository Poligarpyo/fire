import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../router/app_router.dart';
 
class CardItem extends StatelessWidget {
  final String title;

  const CardItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
      ),
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          switch (title) {
            case 'Reports':
              context.go(SGRoute.reports.route); 
              break;
            case 'Others':
              context.go(SGRoute.trails.route);
              break; 
          }
        },
      ),
    );
  }
}
