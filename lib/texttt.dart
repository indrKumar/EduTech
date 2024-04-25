// import 'package:flutter/material.dart';
// import 'package:camerawesome/camerawesome_plugin.dart';
// import 'package:camerawesome/pigeon.dart';
// import 'package:path_provider/path_provider.dart';
//
// class CameraPage extends StatefulWidget {
//   const CameraPage({Key? key});
//
//   @override
//   State<CameraPage> createState() => _CameraPageState();
// }
//
// class _CameraPageState extends State<CameraPage> {
//   @override
//   void initState() {
//
//     // TODO: implement initState
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.white,
//         child: CameraAwesomeBuilder.awesome(
//           saveConfig: SaveConfig.video(
//             videoOptions: VideoOptions(
//               enableAudio: true,
//               ios: CupertinoVideoOptions(
//                 fps: 10,
//               ),
//               android: AndroidVideoOptions(
//                 bitrate: 6000000,
//                 fallbackStrategy: QualityFallbackStrategy.lower,
//               ),
//             ),
//           ),
//
//           sensorConfig: SensorConfig.single(
//             sensor: Sensor.position(SensorPosition.back),
//             flashMode: FlashMode.auto,
//             aspectRatio: CameraAspectRatios.ratio_4_3,
//             zoom: 0.0,
//           ),
//           enablePhysicalButton: true,
//           previewAlignment: Alignment.center,
//           previewFit: CameraPreviewFit.contain,
//           onMediaTap: (mediaCapture) {
//             mediaCapture.captureRequest.when(
//               single: (single) {
//                 debugPrint('single: ${single.file?.path}');
//                 single.file;
//               },
//               multiple: (multiple) {
//                 multiple.fileBySensor.forEach((key, value) {
//                   debugPrint('multiple file taken: $key ${value?.path}');
//                   value;
//                 });
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   Future _showFirstInstructionPopup(BuildContext context) async{
//     // Show first instruction popup
//    await showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('First Instruction'),
//           content: Text('No one can record until this popup closes.'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 // After closing the first popup, show the question popup
//               },
//               child: Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _showQuestionPopup(BuildContext context) {
//     // Show question popup
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Question Popup'),
//           content: Text('This is the question popup.'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 // Perform any action after closing the question popup
//               },
//               child: Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
