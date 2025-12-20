import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../submit_complaint/submit_comlaint.dart';

Widget buildItems(BuildContext context) {
  return InkWell(
    borderRadius: BorderRadius.circular(5),
    onTap: () {
      navigateTo(context, SubmitComlaint());
    },
    child: Card(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5), // صح هيك
      ),
      child: Column(
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/images/وزارة_المياة.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5,),
          DefaultText(
            text: 'وزارة المياه',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
    ),
  );
}