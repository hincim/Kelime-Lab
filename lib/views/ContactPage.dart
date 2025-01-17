import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/TrueFalseController.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Consumer<DroppedController>(
      builder: (context, controller, child) {
        return Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: screenWidth / 2,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/kelime_lab.png",
                        width: screenWidth / 3),
                    SizedBox(
                      height: 40,
                    ),
                    Visibility(
                      visible: !controller.isDropped,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 3,
                          padding: EdgeInsets.symmetric(
                              vertical: 14, horizontal: 25),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(35),
                          ),
                        ),
                        child: Text(
                          "ÇIKIŞ YAP",
                          style: TextStyle(fontSize: 15, color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: screenWidth,
                  height: controller.isDropped
                      ? screenHeight / 10
                      : screenHeight / 5,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.lightBlue,
                        Colors.blueAccent,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                  ),
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              controller.toggleVisibility();
                            },
                            icon: Icon(
                              Icons.menu,
                              color: Colors.black,
                              size: 30,
                            )),
                        controller.isDropped
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: Container(
                                  child: Text(
                                    "Görüş ve öneri için",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            : Expanded(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Görüş ve öneri için",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenHeight / 60,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "sdsds@gmail.com",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
