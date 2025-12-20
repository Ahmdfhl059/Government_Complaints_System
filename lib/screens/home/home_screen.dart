import 'package:flutter/material.dart';

import 'build_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 1,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (BuildContext context, int index) => buildItems(context),
      itemCount: 4,
    );
  }
}


