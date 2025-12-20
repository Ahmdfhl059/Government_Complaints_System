import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future showImagePickerSheet(BuildContext context) async {
  return await showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "اختر طريقة إضافة الصور",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            ListTile(
              leading: Icon(Icons.camera_alt, size: 30, color: Colors.blue),
              title: Text("التقاط صورة", style: TextStyle(fontSize: 16)),
              onTap: () async {
                final picker = ImagePicker();
                final XFile? photo =
                await picker.pickImage(source: ImageSource.camera);

                Navigator.pop(context, photo);
              },
            ),

            ListTile(
              leading: Icon(Icons.photo_library, size: 30, color: Colors.green),
              title: Text("اختيار من المعرض", style: TextStyle(fontSize: 16)),
              onTap: () async {
                final picker = ImagePicker();
                final List<XFile> photos = await picker.pickMultiImage();

                Navigator.pop(context, photos);
              },
            ),

            SizedBox(height: 10),
          ],
        ),
      );
    },
  );
}

class ImagesPreview extends StatelessWidget {
  final List<XFile> images;
  final Function(int) onDelete;

  const ImagesPreview({
    super.key,
    required this.images,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return Center(
        child: Text(
          "لم يتم اختيار صور بعد",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: images.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  File(images[index].path),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),

            Positioned(
              top: 5,
              right: 5,
              child: InkWell(
                onTap: () => onDelete(index),
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withValues(alpha: 0.6),
                  ),
                  child: Icon(Icons.close, color: Colors.white, size: 18),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
