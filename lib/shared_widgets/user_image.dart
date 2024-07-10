import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../themes.dart';


class UserImage extends StatefulWidget {
  const UserImage({super.key, required this.onPickImage});


  final void Function(File pickedImage) onPickImage;

  @override
  State<UserImage> createState() => _UserImageState();
}

class _UserImageState extends State<UserImage> {

  File? pickedImageFile;
  
  Future pickImage() async
  {
    final XFile? pickedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        maxWidth: 150
    );
    if (pickedImage == null) {
      return;
    }
    setState(() {
      pickedImageFile = File(pickedImage.path);
    });
  }
  @override
  Widget build(BuildContext context) {

    return Stack(
          children: [
            CircleAvatar(
              radius: 42,
              backgroundColor: primaryColor,
              child: CircleAvatar(
                backgroundColor: Colors.white70.withOpacity(.95),
                foregroundImage: pickedImageFile == null ? null: FileImage(pickedImageFile!),
                radius: 40,
                child: Image.asset('assets/profile.png'),
              ),
            ),
            TextButton.icon(
              onPressed: () async{
                await pickImage();
                if (pickedImageFile != null) {
                  widget.onPickImage(pickedImageFile!);
                }
              },
              icon: Container(
                  margin: EdgeInsets.only(top: 50, left: 50),
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: primaryColor,
                  ),
                  child: const Icon(Icons.add, color: Colors.white,size: 17,)),
                    label: const Text(''),
            ),
          ],
    );
  }
}
