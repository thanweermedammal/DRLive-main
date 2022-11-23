import 'dart:io';

import 'package:active_ecommerce_flutter/data_handler/doctors_data_fetch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

class AddDoctorStory extends StatefulWidget {
  const AddDoctorStory({Key key}) : super(key: key);

  @override
  State<AddDoctorStory> createState() => _AddDoctorStoryState();
}

class _AddDoctorStoryState extends State<AddDoctorStory> {
  TextEditingController nameController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String imagePath = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                child: TextFormField(
                  // validator: phoneValidator,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.green,
                  controller: nameController,
                  onChanged: (text) {
                    // mobileNumber = value;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    focusColor: Colors.greenAccent,
                    // labelStyle: ktext14,
                    labelText: "Name",
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                child: TextFormField(
                  // validator: phoneValidator,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.green,
                  controller: linkController,
                  onChanged: (text) {
                    // mobileNumber = value;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    focusColor: Colors.greenAccent,
                    // labelStyle: ktext14,
                    labelText: "Link",
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () async {
                  final XFile image =
                      await _picker.pickImage(source: ImageSource.gallery);
                  print(image.path);
                  setState(() {
                    imagePath = image.path;
                  });
                },
                child: Container(
                  height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey,
                  ),
                  child: imagePath.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Image.file(
                            new File(imagePath),
                            fit: BoxFit.cover,
                          ),
                        )
                      : Text('Pick Image'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 40,
                width: 120,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ElevatedButton(
                    onPressed: () async {
                      // final bytes = await images.first.readAsBytes();
                      // final img.Image imag = img.decodeImage(bytes);
                      // print(imag.data);

                      DoctorsData().addStory2(nameController.text, imagePath,
                          linkController.text, context);
                      // DoctorsData().addStory(
                      //     name: nameController.text,
                      //     image: imagePath,
                      //     link: linkController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: HexColor('33BEA3'),
                    ),
                    child: Text(
                      "Add",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffffffff),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
