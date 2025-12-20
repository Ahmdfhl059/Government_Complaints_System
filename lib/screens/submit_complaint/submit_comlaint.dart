import 'package:flutter/material.dart';
import 'package:government_complaints_system/screens/submit_complaint/show_Image_picker_sheet.dart';
import 'package:government_complaints_system/shared/components/components.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/constants.dart';

class SubmitComlaint extends StatefulWidget {
  const SubmitComlaint({super.key});

  @override
  State<SubmitComlaint> createState() => _SubmitComlaintState();
}

class _SubmitComlaintState extends State<SubmitComlaint> {
  List<XFile> images = [];

  void pickImages(BuildContext context) async {
    final result = await showImagePickerSheet(context);

    if (result == null) return;

    setState(() {
      if (result is XFile) {
        images.add(result);
      } else if (result is List<XFile>) {
        images.addAll(result);
      }
    });

    print("عدد الصور: ${images.length}");
  }

  @override
  Widget build(BuildContext context) {
    var descriptionController = TextEditingController();

    List<String> governorates = [
      "دمشق",
      "ريف دمشق",
      "حلب",
      "حمص",
      "حماة",
      "اللاذقية",
      "طرطوس",
      "إدلب",
      "دير الزور",
      "الرقة",
      "الحسكة",
      "السويداء",
      "القنيطرة",
      "درعا",
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: defaultColor,
        title: Text(
          'تقديم شكوى',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        titleSpacing: 0,
        leading: DefaultIconButton(
          onPressed: () {
            navigatePop(context, true);
          },
          icon: Icon(Icons.arrow_back_outlined),
          size: 30,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              DefDropdownButton(
                hintText: 'اختر المحافظة',
                governorates: governorates,
              ),
              SizedBox(height: 20),
              DefDropdownButton(
                hintText: 'اختر الحي',
                governorates: governorates,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                    'اضف وصف',
                    style: TextStyle(
                      color: secondaryColor.withValues(alpha: 0.6),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: defaultColor),
                  ),
                  alignLabelWithHint: true,
                ),
                cursorColor: defaultColor,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
              ),
              SizedBox(height: 15),
              DefaultButton(
                background: defaultColor,
                text: 'إضافة صور',
                onPress: () {
                  pickImages(context);
                },
              ),
              SizedBox(height: 20),

              ImagesPreview(
                images: images,
                onDelete: (index) {
                  setState(() {
                    images.removeAt(index);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
