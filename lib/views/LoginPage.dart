import 'package:flutter/material.dart';
import 'package:kelime_lab/controller/IndicatorController.dart';
import 'package:kelime_lab/controller/TrueFalseController.dart';
import 'package:kelime_lab/model/IndicatorModel.dart';
import 'package:kelime_lab/util/Toast.dart';
import 'package:kelime_lab/views/MainPage.dart';
import 'package:provider/provider.dart';
import 'SignInPage.dart';

class Loginpage extends StatelessWidget {
  Loginpage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passsordController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<IndicatorController>(
      builder: (context, controller, child) {
        return Scaffold(
          key: _scaffoldKey,
          body: controller.isIndicatorVisible
              ? Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.lightBlue,
                  Colors.blueAccent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          )
              : Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.lightBlue,
                  Colors.blueAccent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Başlık
                  Text(
                    "Kelime Lab",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 40),

                  // Email Alanı
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      floatingLabelBehavior:
                      FloatingLabelBehavior.never,
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.all(20),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Şifre Alanı
                  Consumer<PasswordControllerLoginPage>(
                    builder: (context, controller, child) {
                      return TextField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passsordController,
                        obscureText: controller.isPasswordVisible,
                        // Şifre görünürlüğü
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          floatingLabelBehavior:
                          FloatingLabelBehavior.never,
                          labelText: "Şifre",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(controller.isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              // Görünürlüğü değiştirme
                              controller.toggleVisibility();
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 30),

                  // Oturum Aç Butonu
                  SizedBox(
                    width: double.infinity,
                    child: Consumer<IndicatorController>(
                      builder: (context, controller, child) {
                        return ElevatedButton(
                          onPressed: () {
                            if (_emailController.text.isNotEmpty &&
                                _passsordController.text.isNotEmpty) {
                              controller.visible();
                              Future.delayed(Duration(seconds: 1),
                                      () {
                                    if (_emailController.text ==
                                        "hakan@gmail.com" &&
                                        _passsordController.text ==
                                            "123456") {
                                      Navigator.pushReplacement(
                                        _scaffoldKey.currentContext!,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Mainpage(),
                                        ),
                                      );
                                      controller.invisible();
                                    } else {
                                      controller.invisible();
                                      showToast(
                                          "Email veya şifre hatalı");
                                    }
                                  });
                            } else {
                              controller.invisible();
                              showToast(
                                  "Email ve şifre alanları boş bırakılamaz");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 14, horizontal: 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            "GİRİŞ YAP",
                            style: TextStyle(
                                fontSize: 18, color: Colors.black),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),

                  // Kaydol Linki
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInPage(),
                        ),
                      );
                    },
                    child: Text(
                      "KAYDOL",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
