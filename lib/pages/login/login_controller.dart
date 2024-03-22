import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:linafoot_auth/pages/accueil.dart';
import '../../utils/requete.dart';

class LoginController extends GetxController {
  //
  Requete requete = Requete();
  //
  var box = GetStorage();
  //
  Future<void> login(Map e) async {
    //http://localhost:8080/agent/login?telephone=0815381693&mdp=527406480
    print(
        "${Requete.url}/agent/login?telephone=${e['telephone']}&mdp=${e['mdp']}"); //
    //
    Response? rep;
    //
    rep = await requete.getE(
        "agent/login?telephone=${e['telephone']}&mdp=${e['mdp']}"); //&profil=agent

    //
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      //
      print(rep.statusCode);
      print(rep.body);
      Map e = rep.body;
      //
      Get.back();
      Get.snackbar(
        "Authentification",
        "Authentification reussi!t",
        backgroundColor: Colors.teal,
        colorText: Colors.white,
      );
      box.write("agent", e);
      Get.to(Accueil());
      //
    } else {
      //
      Get.back();
      Get.snackbar("Erreur", "Un problème lors de l'authentification");
    }
  }

  Future<void> check(Map e) async {
    print("e: $e");
    //http://localhost:8080/agent/login?telephone=0815381693&mdp=527406480
    print(
        "${Requete.url}billet/check?idAgent=${e['idAgent']}&qrcode=${e['qrcode']}"); //
    //
    Response? rep;
    //
    rep = await requete.getE(
        "billet/check?idAgent=${e['idAgent']}&qrcode=${e['qrcode']}"); //&profil=agent

    //
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      //
      print(rep.statusCode);
      print(rep.body);
      //String e = rep.body;
      //
      Get.back();
      Get.snackbar(
        "Authentification",
        "Authentification reussi!t",
        backgroundColor: Colors.teal,
        colorText: Colors.white,
      );
      //box.write("agent", e);
      Get.dialog(
        Center(
          child: Card(
            elevation: 1,
            child: Container(
              padding: EdgeInsets.all(10),
              height: 200,
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      rep.body,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      //
                      Get.back();
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
                            "Ok",
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
                ],
              ),
            ),
          ),
        ),
      );
      //
    } else {
      //
      Get.back();
      Get.snackbar(
        "Erreur",
        "${rep.body}",
        backgroundColor: Colors.red.shade700,
        colorText: Colors.white,
        duration: const Duration(seconds: 5),
      );
      Get.dialog(
        Center(
          child: Card(
            elevation: 1,
            child: Container(
              padding: EdgeInsets.all(10),
              height: 200,
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "${rep.body}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      //
                      Get.back();
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
                            "Ok",
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
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  //

  //
}
