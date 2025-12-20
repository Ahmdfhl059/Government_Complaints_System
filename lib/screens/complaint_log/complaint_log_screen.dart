import 'package:flutter/material.dart';
import 'package:government_complaints_system/shared/components/components.dart';

class ComplaintLogScreen extends StatelessWidget {
  const ComplaintLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            DefaultListTile(textTitle: 'شكوى لوزارة المياه',textSubTitle: 'sssss' ,trailing: Text('1/1/2025'),)
          ],
        ),
      ),
    );
  }
}
