import 'dart:io';
import 'package:arch_image/core/helper/extensions/assetss_widgets.dart';
import 'package:arch_image/core/helper/extensions/context_size.dart';
import 'package:arch_image/core/helper/extensions/validations.dart';
import 'package:arch_image/providers/x_provider.dart';
import 'package:arch_image/views/widgets/main_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../../../core/ys_localizations/ys_localizations_provider.dart';
import '../../../providers/x_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    //videoController= VideoPlayerController.file(videoName!)..initialize();
    //videoController?.initialize().then((value) => null);
    Future.delayed(Duration.zero,()async{
      await Provider.of<XProvider>(context, listen: false).getData;
    });
  }

  File? fileName;
  File? videoName;
  VideoPlayerController? videoController;
  File? anyFile;



  Future selectPhotoFromCamera() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickImage(source: ImageSource.camera);
    //XFile image= imagePicker.pickImage(source: ImageSource.camera );
    if (image != null) {
      setState(() {
        fileName = File(image.path);
      });
    }
  }

  Future selectPhotoFromGallery() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        fileName = File(image.path);
      });
    }
  }

  Future selectVideoFrom() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickVideo(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        videoName = File(image.path);
        videoController= VideoPlayerController.file(videoName!)..initialize();
      }
      );
      videoController?.play();
    }
  }


  Future selectFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.any);
    if(result !=null && result.files.single.path != null){
      anyFile=File(result.files.single.path!);
      setState(() {
        print(anyFile);
        //print(result.files.single.t)
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    print("lll@gmail.com".isValidEmail);
    final xProvider = Provider.of<XProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(height: 10), //=
            // 10.hSize,
            // Padding(
            //   padding: const EdgeInsets.all(8.0), //padding: 8.aEdge,
            //   child: Text("${nameOfProvider.count}"),
            // ),
            // Container(
            //   width: context.width,
            //   height: context.height,
            // ),
            // Text(
            //   "kkk",
            //   style: TextStyle(
            //     color: Colors.amber,
            //   ),
            // ),
            // MainText("jjjj", color: Colors.cyan),
            // MainText.pageTitle(
            //   "jjjj",
            //   color: Colors.cyan,
            //   fontSize: 32,
            // ),


            if(anyFile !=null)...{
              SizedBox(
                height: 100,
                width: 100,
                child: VideoPlayer(videoController!),
              )
            },

            if(videoName !=null)...{
              SizedBox(
                height: 100,
                width: 100,
                child: VideoPlayer(videoController!),
              )
            },

            if(fileName !=null)...{
              SizedBox(
                height: 100,
                width: 100,
                child: Image.file(fileName!),
              )
            },
            ElevatedButton(onPressed: () async {
              await selectPhotoFromCamera();
            }, child: Text("image upload from camera")),

            ElevatedButton(onPressed: () async{
              await selectPhotoFromGallery();
            }, child: Text("image upload from Gallery")),

            ElevatedButton(onPressed: () async{
              if(fileName != null)
                {
                  await xProvider.signUp(fileName!);
                }
            }, child: Text("image upload to api")),


            ElevatedButton(onPressed: () async{
                await selectVideoFrom();
            }, child: Text(" upload video")),

            ElevatedButton(onPressed: () async{
              if(videoName != null)
              {
                await xProvider.signUp(videoName!);
              }
            }, child: Text(" upload video from api")),

            ElevatedButton(
            onPressed: ()async{
              await selectFiles();
            },
                child:Text("any file"))


          ],
        ),
      ),
    );
  }
}
