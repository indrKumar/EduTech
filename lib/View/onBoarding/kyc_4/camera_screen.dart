import 'dart:io';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:edushalaacademy/View/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  var index;
   CameraPage({Key? key,this.index});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  void initState() {
    _showFirstInstructionPopup(context);
    // TODO: implement initState
    super.initState();
  }
  File? videoPath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: CameraAwesomeBuilder.awesome(
          saveConfig: SaveConfig.video(
            videoOptions: VideoOptions(
              enableAudio: true,
              ios: CupertinoVideoOptions(
                fps: 10,
              ),
              android: AndroidVideoOptions(
                bitrate: 6000000,
                fallbackStrategy: QualityFallbackStrategy.lower,
              ),
            ),
          ),

          sensorConfig: SensorConfig.single(
            sensor: Sensor.position(SensorPosition.back),
            flashMode: FlashMode.auto,
            aspectRatio: CameraAspectRatios.ratio_4_3,
            zoom: 0.0,
          ),
          enablePhysicalButton: true,
          previewAlignment: Alignment.center,
          previewFit: CameraPreviewFit.contain,
          onMediaTap: (mediaCapture) {
            print("FILLLLLLS");
            mediaCapture.captureRequest.when(
              single: (single) {
                debugPrint('single: ${single.file?.path}');
                single.file;
              },
                multiple: (multiple) {
                multiple.fileBySensor.forEach((key, value) {
                  debugPrint('multiple file taken: $key ${value?.path}');
                  value;
                });
              },
            );
          },
        ),
      ),
    );
  }

  void _showFirstInstructionPopup(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Show first instruction popup
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content:  Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Part ${widget.index}. Now we will ask you a question',style: TextStyle(fontSize: 20,color: Theme.of(context).primaryColor),),
                const SizedBox(height: 10,),
                const Text('. Take your time to understand and answer the question.',style: TextStyle(fontSize: 18,),),
              const SizedBox(height: 10,),
                const Text('. Please adjust your camera and make sure your notebook clearly visible.',style: TextStyle(fontSize: 18,),),
                const SizedBox(height: 25,),
                CustomElevatedButton(text: "Understood",
                onPressed: () {
                  Navigator.of(context).pop();
                  // After closing the first popup, show the question popup
                  _showQuestionPopup(context);
                },
                )
              ],
            ),
          );
        },
      );
    });
  }


  void _showQuestionPopup(BuildContext context) {
    // Show question popup
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Question Popup'),
          content: Text('This is the question popup.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Perform any action after closing the question popup
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
