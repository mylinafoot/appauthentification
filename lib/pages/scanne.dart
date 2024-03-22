import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:linafoot_auth/pages/login/login_controller.dart';
import 'package:linafoot_auth/utils/loader.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';

class Scanne extends StatelessWidget {
  //
  var box = GetStorage();
  Map u = {};
  Scanne() {
    //
    u = box.read("agent") ?? {};
  }
  //
  LoginController loginController = Get.find();
  //
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: QRCodeDartScanView(
        scanInvertedQRCode: true,
        typeScan: TypeScan.live,
        onCapture: (Result result) {
          //
          print("Result: ${result.text}");
          //
          Get.back();
          Loader.loading();
          Map e = {
            "idAgent": u['id'],
            "qrcode": result.text,
          };
          loginController.check(e);
        },
        child: Center(
          child: Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.red.shade900, width: 2)),
          ),
        ),
      ),
    );
  }
  //
}
