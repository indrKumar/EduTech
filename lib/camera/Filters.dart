import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';



class Filters extends StatefulWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  State<Filters> createState() => _FiltersState();
}

CurrentRemainingTime({int? days, int? hours, int? min, int? sec, Animation<double>? milliseconds}) {
  // TODO: implement CurrentRemainingTime
  throw UnimplementedError();
}


class _FiltersState extends State<Filters> {
  get myIcon => null;
  final globalKey = GlobalKey<ScaffoldState>();

  bool _original = true;
  bool _sunny = false;
  bool _cool = false;
  bool _tropical = false;



  @override
  void initState() {
    // isSelected = [true, false, false];
    super.initState();
  }

  void originalState(){
    setState(() {
      _original = true;
      _sunny = false;
      _cool = false;
      _tropical = false;
    });
    print(_original);
  }

  void sunnyState(){
    setState(() {
      _original = false;
      _sunny = true;
      _cool = false;
      _tropical = false;
    });
  }

  void coolState(){
    setState(() {
      _original = false;
      _sunny = false;
      _cool = true;
      _tropical = false;
    });
  }

  void tropicalState(){
    setState(() {
      _original = false;
      _sunny = false;
      _cool = false;
      _tropical = true;
    });
  }

  double _value = 0;
  @override
  Widget build(BuildContext context) {

    // var inputLabelStyle = const TextStyle(fontSize: 10,height: 0,color: const Color(0xff202020),);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // SfRangeValues _values = SfRangeValues(40.0, 80.0);



    return Scaffold(
      key: globalKey,
      backgroundColor: const Color(0xffffffff),
      resizeToAvoidBottomInset : false,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(0),
          child: Container(
            width: screenWidth,
            height: screenHeight,
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset('assets/images/imageLg.png',height:screenHeight,fit: BoxFit.cover,),
                    Positioned(
                      left: 20,
                      top: 40,
                      child: Align(
                        // alignment: Alignment.topLeft,
                        child: SizedBox(
                          width: 70,
                          height: 70,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, 'record-video/main');
                            },
                            icon: Image.asset('assets/images/back.png',),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                        left: 0,
                        child: Container(
                          width: screenWidth,
                          height: screenHeight/7,
                          color: Color(0x80000000),
                          child: Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: screenWidth,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 3),
                                  child: Stack(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8),
                                            child: Column(
                                              children: [
                                                
                                                IconButton(
                                                  onPressed: originalState,
                                                  icon: Container(
                                                      decoration: BoxDecoration(
                                                          border: _original == true ? Border.all(color: Color(0xff3779EF),width: 4) : Border.all(),
                                                          borderRadius: BorderRadius.circular(200)
                                                      ),
                                                      child: Image.asset(
                                                        'assets/images/original.png',
                                                      ),
                                                    ),
                                                  iconSize: 40,
                                                ),
                                                Text("Original",style: TextStyle(
                                                    color: _original == true ? Color(0xff3779EF) : Colors.white,
                                                    fontSize: 11),textAlign: TextAlign.center,)
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8),
                                            child: Column(
                                              children: [
                                                IconButton(
                                                  onPressed: sunnyState,
                                                  icon: Container(
                                                    decoration: BoxDecoration(
                                                        border: _sunny == true ? Border.all(color: Color(0xff3779EF),width: 3) : Border.all(),
                                                        borderRadius: BorderRadius.circular(200)
                                                    ),
                                                    child: Image.asset(
                                                      'assets/images/sunny.png',
                                                    ),
                                                  ),
                                                  iconSize: 40,
                                                ),
                                                Text("Sunny",style: TextStyle(
                                                    color: _sunny == true ? Color(0xff3779EF) : Colors.white,
                                                    fontSize: 11),textAlign: TextAlign.center,)
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8),
                                            child: Column(
                                              children: [
                                                IconButton(
                                                  onPressed: coolState,
                                                  icon: Container(
                                                    decoration: BoxDecoration(
                                                        border: _cool == true ? Border.all(color: Color(0xff3779EF),width: 3) : Border.all(),
                                                        borderRadius: BorderRadius.circular(200)
                                                    ),
                                                    child: Image.asset(
                                                      'assets/images/cool.png',
                                                    ),
                                                  ),
                                                  iconSize: 40,
                                                ),
                                                Text("Cool",style: TextStyle(
                                                    color: _cool == true ? Color(0xff3779EF) : Colors.white,fontSize: 11),textAlign: TextAlign.center,)
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8),
                                            child: Column(
                                              children: [
                                                IconButton(
                                                  onPressed: tropicalState,
                                                  icon: Container(
                                                    decoration: BoxDecoration(
                                                        border: _tropical == true ? Border.all(color: Color(0xff3779EF),width: 3) : Border.all(),
                                                        borderRadius: BorderRadius.circular(200)
                                                    ),
                                                    child: Image.asset(
                                                      'assets/images/tropical.png',
                                                    ),
                                                  ),
                                                  iconSize: 40,
                                                ),
                                                Text("Tropical",style: TextStyle(
                                                    color: _tropical == true ? Color(0xff3779EF) : Colors.white,fontSize: 11),textAlign: TextAlign.center,)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ),

                    Positioned(
                      bottom: screenHeight/6,
                      child: Container(
                        width: screenWidth,
                        child: SliderTheme(
                              data: SliderThemeData(
                              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20)),
                              child: SfSlider(
                                value: _value,
                                min: 0.0,
                                max: 10.0,
                                enableTooltip: true,
                                showTicks: true,
                                activeColor: Color(0xff3779EF),
                                inactiveColor: Colors.white,
                                onChanged: (dynamic newValue){
                                  setState(() {
                                    _value = newValue;
                                  });
                                },
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
}