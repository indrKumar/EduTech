import 'package:bulleted_list/bulleted_list.dart';
import 'package:camera/camera.dart';
import 'package:edushalaacademy/View/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/kyc2_controllers/kyc_status_controller.dart';
import 'VideoPreview.dart';

class RecordMain extends StatefulWidget {
  var id;
  var index;
   RecordMain({Key? key,this.index,this.id}) : super(key: key);

  @override
  State<RecordMain> createState() => _RecordMainState();
}

CurrentRemainingTime(
    {int? days,
      int? hours,
      int? min,
      int? sec,
      Animation<double>? milliseconds}) {
  // TODO: implement CurrentRemainingTime
  throw UnimplementedError();
}
final Kyc2StatusController kycOneController = Get.put(Kyc2StatusController());


class _RecordMainState extends State<RecordMain> {
  get myIcon => null;
  // bool _isObscure = true;
  final globalKey = GlobalKey<ScaffoldState>();

  int ellipseState = 0;
  bool _isVisible_recPopup = false;
  bool _isVisible_recordTime = false;
  bool _isVisible_beforeRec = true;
  bool _isVisible_ellipse = true;
  bool _isVisible_endEllipse = false;

  String? filePath;
  bool _isRecording = false;
  bool _isFrontCamera = true;
  List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image; //for caputred image

  @override
  void initState() {
    // isSelected = [true, false, false];
    kycOneController.getQuestion(id:widget.id.toString());
    loadCamera().then((value) {
      _showFirstInstructionPopup(context).then((value) {

      });
    });
    // AppData.storeData('giftCardVideo', "");
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

 Future loadCamera() async {
    cameras = await availableCameras();
    if (cameras != null) {
      if (_isFrontCamera) {
        controller = CameraController(cameras![1], ResolutionPreset.low);
      } else {
        controller = CameraController(cameras![0], ResolutionPreset.low);
      }
      //cameras[0] = first camera, change to 1 to another camera

      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    } else {
      print("NO any camera found");
    }
  }

  _stopVideoRecording() async {
    if (_isRecording) {
      final file = await controller?.stopVideoRecording();
      filePath = file?.path;
      print(file?.path);
      // AppData.storeData('giftCardVideo', filePath);
      setState(() => _isRecording = false);
      final route = MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => VideoPreview(filePath: filePath.toString(),id:widget.id),
      );
      Navigator.push(context, route);
    }
  }

  _recordVideo() async {
    if (_isRecording) {
      final file = await controller?.stopVideoRecording();
      filePath = file?.path;
      print(file?.path);
      // AppData.storeData('giftCardVideo', filePath);
      setState(() => _isRecording = false);
      final route = MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => VideoPreview(filePath: filePath.toString()),
      );
      Navigator.push(context, route);
    } else {
      await controller?.prepareForVideoRecording();
      await controller?.startVideoRecording();
      setState(() => _isRecording = true);
    }
  }

  void onEnd() {
    print("object");
  }

  void showReadyState_Active() {
    setState(() {
      print('starting...');
      _isVisible_beforeRec = false;
      _isVisible_recPopup = true;
      _isVisible_recordTime = false;
      _isVisible_ellipse = false;
      _isVisible_endEllipse = true;
    });
  }

  void State_RecordingEnd() {
    setState(() {
      _isVisible_recordTime = false;
      _isVisible_ellipse = true;
      _isVisible_endEllipse = false;
    });
    _stopVideoRecording();
    print('Video Ended');
  }

  void showReadyState_inActive() {
    setState(() {
      _isVisible_recPopup = false;
      _isVisible_recordTime = true;
      _isVisible_ellipse = false;
      _isVisible_endEllipse = true;
      ellipseState = 1;
    });
    _recordVideo();
    print('recording...');
  }

  void recording_Stop() {
    setState(() {
      _isVisible_recordTime = false;
      _isVisible_ellipse = false;
    });
    _stopVideoRecording();
    print('End recording...');
  }

  @override
  Widget build(BuildContext context) {
    kycOneController.getQuestion(id:widget.id.toString());
    print(kycOneController.question);
    var inputLabelStyle = const TextStyle(
      fontSize: 10,
      height: 0,
      color: const Color(0xff202020),
    );
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    int readyRecordingState = 0;
    int a = 0;

    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
    int readyRecording = DateTime.now().millisecondsSinceEpoch + 1000 * 4;

    return Scaffold(
      key: globalKey,
      backgroundColor: const Color(0xffffffff),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(0),
          child: Container(
            width: screenWidth,
            height: screenHeight,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    controller == null
                        ? Center(child: Text("Loading Camera..."))

                        : !controller!.value.isInitialized
                        ? const Center(
                      child: CircularProgressIndicator(),
                    )
                        : Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: screenHeight,
                        width: screenWidth,
                        child: CameraPreview(controller!),
                      ),
                    ),

                    //Image.asset('assets/images/imageLg.png',height:screenHeight,fit: BoxFit.cover,),
                    Visibility(
                      visible: _isVisible_beforeRec,
                      child: Positioned(
                        left: 10,
                        top: 40,
                        child: Align(
                          // alignment: Alignment.topLeft,
                          child: SizedBox(
                            width: 70,
                            height: 70,
                            child: IconButton(
                              onPressed: () async {
                                Get.back();
                                // var data = await AppData.getStoredData('giftRecipients');
                                // var pageData = jsonDecode(data);
                                // List recipients = [];
                                // for(var recipient in pageData){
                                //   recipients.add({
                                //     "srno" : recipient['srno'],
                                //     "name" : recipient['name'],
                                //     "email" : recipient['email'],
                                //     "phone" : recipient['phone']
                                //   });
                              },
                              // String amount = await AppData.getStoredData('giftAmount'),
                              icon: const CircleAvatar(
                                  child: Icon(Icons.close)),
                              // int selectedAmount = int.parse(amount);

                              // var dataR = await AppData.getStoredData('giftDressUp');
                              // pageData = jsonDecode(dataR);
                              // List dressUps = [];
                              // for(var item in pageData){
                              //   dressUps.add({
                              //     "id": item["id"],
                              //     "name": item['name'],
                              //     "price": item['amount']
                              //   });
                              // }

                              // List DeliverTo = [];
                              // var dataA = await AppData.getStoredData('giftDeliverTo');
                              // if(dataA.toString() == '[{}]'){
                              //   DeliverTo.add({
                              //     "name": "",
                              //     "address": "",
                              //     "city": "",
                              //     "state": "",
                              //     "zip": ""
                              //   });
                              // }else {
                              //   pageData = jsonDecode(dataA);
                              //   for (var item in pageData) {
                              //     DeliverTo.add({
                              //       "name": item['name'],
                              //       "address": item['address'],
                              //       "city": item['city'],
                              //       "state": item['state'],
                              //       "zip": item['zip']
                              //     });
                              //   }
                              // }

                              // DateTime? _selectedDay;
                              // var thisSelectedDate = await AppData.getStoredData('giftDate');
                              // _selectedDay = DateTime.parse(thisSelectedDate);

                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) =>
                              //           RecordPVM(
                              //               Recipients: recipients,
                              //               SelectedAmount: selectedAmount,
                              //               DressUpStatus: dressUps,
                              //               DeliverTo: DeliverTo,
                              //               SelectedDay: _selectedDay),
                              //     ));
                              // },
                              // icon: Image.asset('assets/images/closeLg.png',),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Ellipse icon
                    Visibility(
                      visible: _isVisible_ellipse,
                      child: Positioned.fill(
                        bottom: 60,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            child: IconButton(
                              onPressed: () {
                                showReadyState_Active();
                              },
                              icon: const CircleAvatar(
                                radius: 35,
                                child: CircleAvatar(
                                  backgroundColor: Colors.redAccent,
                                  radius: 25,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Ellipse icon
                    Visibility(
                      visible: _isVisible_endEllipse,
                      child: Positioned.fill(
                        bottom: 60,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            child: IconButton(
                              onPressed: () {
                                State_RecordingEnd();
                                // recording_Stop();
                              },
                              icon:  const CircleAvatar(
                                radius: 35,
                                child: Icon(Icons.stop_circle_rounded,size: 60,color: Colors.redAccent)
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Center Timer
                    Visibility(
                      visible: _isVisible_recPopup,
                      child: Positioned(
                        child: Container(
                          width: screenWidth,
                          height: screenHeight,
                          color: Color(0x99202020),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: screenWidth / 2.8,
                                  height: screenWidth / 2.8,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(300),
                                    color: Color(0x79202020),
                                  ),
                                  child: Center(
                                    child: CountdownTimer(
                                      onEnd: showReadyState_inActive,
                                      endTime: readyRecording,
                                      widgetBuilder: (_, time) {
                                        return Text(
                                          '${time?.sec}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: screenWidth / 7),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),

                    //Recording Timer
                    Visibility(
                      visible: _isVisible_recordTime,
                      child: Positioned.fill(
                        bottom: 20,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: 90,
                            decoration: BoxDecoration(
                                color: Color(0x60000000),
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 0),
                              child: CountdownTimer(
                                onEnd: recording_Stop,
                                endTime: endTime,
                                widgetBuilder: (_, time) {
                                  if (time == null) {
                                    _recordVideo();
                                  }
                                  return Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Text(
                                        // '${time.min} : ' if time is more than 1minute
                                        '00',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                        textAlign: TextAlign.center,
                                      ),
                                      const Text(
                                        ':',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        '${time?.sec}',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Visibility(
                      visible: _isVisible_beforeRec,
                      child: Positioned(
                        right: 20,
                        top: 50,
                        child: Align(
                          // alignment: Alignment.topRight,
                          child: SizedBox(
                            width: 55,
                            height: 55,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0x20051C48),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child:  Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                 // IconButton(
                                 //      onPressed: () {
                                 //        Navigator.pushReplacementNamed(
                                 //            context, 'record-video/filters');
                                 //      },
                                 //      icon: Image.asset('assets/images/ios-color-filter.png',),
                                 //    ),
                                    // IconButton(
                                    //   onPressed: () {},
                                    //   icon: Image.asset('assets/images/subtraction.png',),
                                    // ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _isFrontCamera = !_isFrontCamera;
                                          loadCamera();
                                        });

                                        print('change camera');
                                      },
                                      icon: Icon(Icons.flip_camera_android,color: Colors.white70,),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _showFirstInstructionPopup(BuildContext context) async{
    // Show first instruction popup
   await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text('First Instruction'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Part ${widget.index} : Now we will ask you a question",style: TextStyle(color: Color(0xFF5580e2),fontSize: 18),),
              const BulletedList(
                style: TextStyle(fontSize: 18),
                bullet: Icon(
                  Icons.circle,
                  color: Colors.black38,
                  size: 10,
                ),
                listItems: [
                  'Take your time to underStand and answer the question.',
                  'Please adjust your camera and make sure your note book is clearly visible',
                ],
              ),
              10.h. verticalSpace,
              CustomElevatedButton(text:"Understood",
                  onPressed: () {
                Navigator.of(context).pop();
                // After closing the first popup, show the question popup
                _showQuestionPopup(context);
              },)
            ],
          ),
        );
      },
    );
  }

  void _showQuestionPopup(BuildContext context) {
    // Show question popup
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content:  Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Question ',style: TextStyle(color: Color(0xFF5580e2),fontSize: 18),),
              Text(kycOneController.question.value??"Question not assigned",style: const TextStyle(fontSize: 18),),
            ],
          )),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Perform any action after closing the question popup
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
