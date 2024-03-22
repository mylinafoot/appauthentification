import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linafoot_auth/utils/loader.dart';
import '../login/login_controller.dart';

class LoginUtilisateur extends StatelessWidget {
  //
  //
  final formKey = GlobalKey<FormState>();
  final telephone = TextEditingController();
  final noms = TextEditingController();
  final mdp = TextEditingController();
  final mdp2 = TextEditingController();
  //
  String codePays = "+243";
  //
  RxBool vue = true.obs;

  LoginController loginController = Get.find();
  //
  RxBool masquer = true.obs;

  @override
  Widget build(BuildContext context) {
    //
    return Container(
      color: Colors.black, // Status bar color
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: Loader.backgroundColor,
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Connexion",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            elevation: 0,
            backgroundColor: Loader.backgroundColor,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
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
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Téléphone",
                          style: textStyle,
                        ),
                      ),
                      //
                      TextFormField(
                        controller: telephone,
                        //textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        //autofocus: true,
                        //focusNode: FocusNode(skipTraversal: true),
                        validator: (e) {
                          if (e!.isEmpty) {
                            return "Veuilliez inserer votre numéro de téléphone";
                          } else if (e!.length >= 10) {
                            return "Le numéro n'est pas correct !";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          // prefix: Text(
                          //   "",
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 20,
                          //   ),
                          // ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                                BorderSide(color: Colors.black, width: 2),
                          ),
                          prefixIcon: Icon(
                            Icons.phone_android,
                            color: Colors.white,
                          ),
                          // prefixIcon: CountryCodePicker(
                          //   onChanged: (countryCode) {
                          //     codePays = countryCode.dialCode!;
                          //     if (kDebugMode) {
                          //       print(codePays);
                          //     }
                          //   },
                          //   // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          //   initialSelection: 'CD',
                          //   favorite: ['+243', 'CD'],
                          //   // optional. Shows only country name and flag
                          //   showCountryOnly: true,
                          //   // optional. Shows only country name and flag when popup is closed.
                          //   showOnlyCountryWhenClosed: false,
                          //   // optional. aligns the flag and the Text left
                          //   alignLeft: false,
                          //   //showFlag: false,
                          // ),
                          //hintText: "Téléphone",
                          // hintStyle: TextStyle(
                          //   fontSize: 15,
                          // ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Mot de passe",
                          style: textStyle,
                        ),
                      ),
                      TextFormField(
                        controller: mdp,
                        //textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        //autofocus: true,
                        //focusNode: FocusNode(skipTraversal: true),
                        validator: (e) {
                          if (e!.isEmpty) {
                            return "Votre mot de passe";
                          } else if (e.length >= 10) {
                            return "Votre mot de passe";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          // prefix: Text(
                          //   "00243 ",
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 20,
                          //   ),
                          // ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          prefixIcon: Icon(
                            Icons.password,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          //
                          Loader.loading();
                          Map e = {
                            "telephone": telephone.text,
                            "mdp": mdp.text,
                          };
                          loginController.login(e);
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
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          child: const Text(
                            "Envoyer",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  //)
                ),
              ),
            ),
          ),

          // RichText(
          //   textAlign: TextAlign.center,
          //   text: TextSpan(
          //     text: "Power by\n",
          //     style: const TextStyle(
          //       color: Colors.black,
          //       fontWeight: FontWeight.bold,
          //     ),
          //     children: [
          //       TextSpan(
          //         text: "SkyTechnologie",
          //         style: TextStyle(
          //           color: Colors.grey.shade700,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }

  //
  TextStyle textStyle =
      TextStyle(fontWeight: FontWeight.bold, color: Colors.white);
  //
}
