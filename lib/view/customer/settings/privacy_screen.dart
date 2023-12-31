import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../Constants/space_values.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
          // Circular gradient on bottom right
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 80.w,
              height: 40.h,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.bottomRight,
                  colors: [
                    Colors.green.shade200,
                    Colors.green.shade100,
                    Colors.white
                  ],
                  radius: 1.0,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: 90.w,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Spaces.y5,
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
                        Text("Pasient Malumatlari",
                            style: TextStyle(
                                fontSize: 13.sp, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Spaces.y2,
                    const Text(
                      "Medlink proqramı məxfilik siyasəti",
                      style: TextStyle(
                        // fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spaces.y2,
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 0.8.h,
                          backgroundColor: Colors.lightBlueAccent,
                        ),
                        Spaces.x2,
                        const Text("Giriş"),
                      ],
                    ),
                    Spaces.y2,
                    Flexible(
                        child: Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: const Text(
                          "Həkim görüşünün sifarişi xidmətimizdən (“Xidmət”) istifadə etdiyiniz üçün təşəkkür edirik. Məxfiliyiniz və şəxsi məlumatlarınızın təhlükəsizliyi bizim üçün vacibdir. Bu Məxfilik Siyasəti siz bizim Xidmətimizdən istifadə etdiyiniz zaman şəxsi məlumatlarınızı necə toplayacağımızı, istifadə etdiyimizi, açıqlayacağımızı və qoruduğumuzu təsvir edir."),
                    )),
                    // Topladığımız məlumat
                    Spaces.y4,
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 0.8.h,
                          backgroundColor: Colors.lightBlueAccent,
                        ),
                        Spaces.x2,
                        const Text("Topladığımız məlumat"),
                      ],
                    ),
                    Spaces.y2,
                    Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: const Text(
                          "Biz aşağıdakı məlumat növlərini toplaya bilərik:"),
                    ),
                    Spaces.y2,
                    Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: const Text(
                          "2.1. Şəxsi məlumat:ad \nƏlaqə məlumatları (e-poçt ünvanı, telefon nömrəsi) Doğum tarixi Cins Sağlamlıq Sığortası Məlumatı Tibbi tarix (əgər təqdim olunarsa) Təqdim etməyi seçdiyiniz hər hansı əlavə məlumat."),
                    ),
                    Spaces.y1,
                    Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: const Text("2.2. İstifadə Məlumatı"))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
