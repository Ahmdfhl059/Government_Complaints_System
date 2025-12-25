import 'package:flutter/material.dart';
import 'package:government_complaints_system/data/models/agencies.dart';

import '../../shared/components/components.dart';
import '../submit_complaint/submit_comlaint.dart';


Widget buildItems(BuildContext context ,Agency agency) {
  String image=
    'http://192.168.1.6:8000/storage/${agency.logo}';
  return InkWell(
    borderRadius: BorderRadius.circular(5),
    onTap: () {
      navigateTo(context, SubmitComlaint(agency: agency.id,));
    },
    child: Card(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5,),
          DefaultText(
            text: agency.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
    ),
  );
}