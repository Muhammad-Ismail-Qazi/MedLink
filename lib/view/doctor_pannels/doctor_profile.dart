import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../../Constants/space_values.dart';
import '../../constants/text_style.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({Key? key}) : super(key: key);

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  final ImagePicker _imagePicker = ImagePicker();
  PickedFile? _imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 90.w,
              height: 50.h,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.topLeft,
                  colors: [Colors.lightBlue.shade100, Colors.white],
                  radius: 1.0,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 80.w,
              height: 50.h,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.bottomRight,
                  colors: [Colors.green.shade100, Colors.white],
                  radius: 1.0,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: SizedBox(
              width: 90.w,
              height: 98.h,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Spaces.y4,
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 3.w,
                                top: 0.7.h,
                                bottom: 0.7.h,
                                right: 1.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Colors.white,
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Spaces.x4,
                        Text(
                          "My Profile",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Spaces.y3,
                    Card(
                      elevation: 3,
                      surfaceTintColor: Colors.white,
                      child: ListTile(
                        minVerticalPadding: 2.h,
                        contentPadding:
                            EdgeInsets.all(1.w), // Adjust padding as needed
                        leading: Stack(
                          children: [
                            CircleAvatar(
                              radius: 6.w,
                              backgroundImage: const NetworkImage(
                                'https://images.unsplash.com/photo-1580489944761-15a19d654956?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGdpcmwlMjAlMjBkb2N0b3IlMjBwcm9maWxlJTIwcGljdHVyZXxlbnwwfHwwfHx8MA%3D%3D',
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 3.w,
                                backgroundColor: Colors.lightBlueAccent,
                                child: IconButton(
                                  icon: const Center(
                                    child: Icon(Icons.camera_alt,
                                        color: Colors.white),
                                  ),
                                  onPressed: () {
                                    _showModalBottomSheet(context);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        title: Text(
                          'Dr. Nigar',
                          style: CustomFontStyle.font12ClrBlk,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Kardioloq',
                              style: CustomFontStyle.font10ClrGRY,
                            ),
                            Spaces.y1,
                          ],
                        ),
                      ),
                    ),
                    Spaces.y2,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.email_outlined,
                                  color: Colors.lightBlueAccent),
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                            ),
                          ),
                          Spaces.y2,
                          TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.phone,
                                  color: Colors.lightBlueAccent),
                              labelText: 'phone',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                            ),
                          ),
                          Spaces.y2,
                          TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.shopping_bag_outlined,
                                  color: Colors.lightBlueAccent),
                              labelText: 'bag to change',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                            ),
                          ),
                          Spaces.y1,
                          TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.currency_bitcoin_rounded,
                                  color: Colors.lightBlueAccent),
                              labelText: '',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                            ),
                          ),
                          Spaces.y2,
                          ListTile(
                            title: Text('Alı təhsil',
                                style: CustomFontStyle.font12ClrFntWtBldBlk),
                            subtitle: Text(
                                'Azərbaycan Tibb universiteti \n Medipol universiteti',
                                style: CustomFontStyle.font10ClrGRY),
                            trailing: const Icon(
                              Icons.edit,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                          Spaces.y1,
                          const Divider(
                            color: Colors.grey,
                          ),
                          ListTile(
                            title: Text('Alı təhsil',
                                style: CustomFontStyle.font12ClrFntWtBldBlk),
                            subtitle: Text(
                                'Azərbaycan Tibb universiteti \n Medipol universiteti',
                                style: CustomFontStyle.font10ClrGRY),
                            trailing: const Icon(
                              Icons.edit,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                          Spaces.y1,
                          const Divider(
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(14.0),
          decoration: const BoxDecoration(
            color: Color.fromARGB(247, 84, 74, 158),
          ),
          height: MediaQuery.of(context).size.height * 0.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Choose profile photo',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      takePhoto(ImageSource.camera);
                      Navigator.pop(context);
                    },
                    child: const Column(
                      children: [
                        Icon(Icons.camera_alt, color: Colors.white),
                        SizedBox(height: 10.0),
                        Text('Camera', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 40.0),
                  InkWell(
                    onTap: () {
                      takePhoto(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                    child: const Column(
                      children: [
                        Icon(
                          Icons.photo_library,
                          color: Colors.white,
                        ),
                        SizedBox(height: 10.0),
                        Text('Gallery', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // take photo
  void takePhoto(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);
    setState(() {
      _imageFile = pickedFile as PickedFile?;
    });
  }
}
