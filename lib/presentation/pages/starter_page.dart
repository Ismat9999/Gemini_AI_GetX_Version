import 'package:flutter/material.dart';
import 'package:geminigetx/presentation/pages/home_page.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../controller/starter_controller.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({super.key});

  @override
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> {
  var controller =Get.find<StarterController>();

  @override
  void initState() {
    super.initState();
    controller.initVideoplayer();
  }

  @override
  void dispose(){
    super.dispose();
    controller.exitVideoPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
    body: GetBuilder<StarterController>(
      builder: (_){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Column(
            children: [
              Container(
                width: 150,
                child: Image(
                  image: AssetImage("assets/images/gemini_logo.png"),
                  fit:BoxFit.cover,
                ),
              ),
              Expanded(
                child: controller.videoPlayerController.value.isInitialized
                    ? VideoPlayer(controller.videoPlayerController)
                    : Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.off(HomePage());
                    },
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          Text("Chat with Gemini",style: TextStyle(color: Colors.grey[400]),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    ),
    );
  }
}
