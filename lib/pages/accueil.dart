import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:linafoot_auth/pages/scanne.dart';
import 'package:linafoot_auth/utils/loader.dart';

class Accueil extends StatelessWidget {
  var box = GetStorage();
  Map u = {};
  Accueil() {
    //
    u = box.read("agent") ?? {};
  }
  @override
  Widget build(BuildContext context) {
    //
    u = box.read("agent") ?? {};
    //
    return Scaffold(
      backgroundColor: Loader.backgroundColor,
      //appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: const DecorationImage(
                  image: ExactAssetImage("assets/mylinafoot.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Agent",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "${u['nom']} ${u['postnom']} ${u['prenom']}",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                //
                Get.to(Scanne());
                //
              },
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(
                  const Size(
                    double.maxFinite,
                    45,
                  ),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: Container(
                alignment: Alignment.center,
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Scanner",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.qr_code)
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
