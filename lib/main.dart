import 'package:clay_container/images.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFFC41A3B),
        primaryColorLight: Color(0xFFFBE0E6),
        accentColor: Color(0xFF1B1F32),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  String title = 'Clay Container';

  Color _lightbaseColor = Color(0xFFFBE0E6);
  Color _redBaseColor = Color(0xFFC41A3B);
  Color _blackBaseColor = Color(0xFF1B1F32);
  Color _baseColor = Color(0xFF795548);
  Color _baseColor1 = Color(0xFFf2f2f2);

  double _firstDepth = 50.0;
  double _secondDepth = 50.0;
  double _thirdDepth = 50.0;
  double _fourthDepth = 50.0;

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
      _animationController.forward();
  }

  @override
  void dispose() { 
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _stag(_value, _progress, _delay) {
      _progress = _progress - (1 - _delay);
      if (_progress < 0) _progress = 0;
      return _value * (_progress / _delay);
    }

    double _depthFirst = _stag(_firstDepth, _animationController.value, 0.25);
    double _depthSecond = _stag(_secondDepth, _animationController.value, 0.5);
    double _depthThird = _stag(_thirdDepth, _animationController.value, 0.75);
    double _depthFourth = _stag(_fourthDepth, _animationController.value, 1);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 230.0,
              color: _lightbaseColor,
              child: Center(
                child: ClayContainer(
                  color: _lightbaseColor,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ClayText(
                      'The Tech Designer',
                      size: 36.0,
                      emboss: true,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  height: 230.0,
                  width: MediaQuery.of(context).size.width / 2,
                  color: _redBaseColor,
                  child: Center(
                    child: ClayContainer(
                      color: _redBaseColor,
                      height: 170.0,
                      width: 170.0,
                      child: Image(
                        image: AssetImage(logo),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 230.0,
                  color: _redBaseColor,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Center(
                    child: ClayContainer(
                      color: _redBaseColor,
                      height: 170.0,
                      width: 170.0,
                      customBorderRadius: BorderRadius.only(
                        topRight: Radius.elliptical(150.0, 150.0),
                        bottomLeft: Radius.circular(50.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  color: _blackBaseColor,
                  height: 235.0,
                  width: MediaQuery.of(context).size.width / 3,
                  child: Center(
                    child: ClayContainer(
                      color: _blackBaseColor,
                      height: 100.0,
                      width: 100.0,
                      borderRadius: 50.0,
                    ),
                  ),
                ),
                Container(
                  color: _blackBaseColor,
                  height: 235.0,
                  width: MediaQuery.of(context).size.width / 3,
                  child: Center(
                    child: ClayContainer(
                      color: _blackBaseColor,
                      height: 100.0,
                      width: 100.0,
                      borderRadius: 50.0,
                      emboss: true,
                    ),
                  ),
                ),
                Container(
                  color: _blackBaseColor,
                  height: 235.0,
                  width: MediaQuery.of(context).size.width / 3,
                  child: Center(
                    child: ClayContainer(
                      color: _blackBaseColor,
                      height: 100.0,
                      width: 100.0,
                      borderRadius: 50.0,
                      depth: 40,
                      spread: 16.0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: Text(
                          'TD',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 48.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  height: 350.0,
                  width: MediaQuery.of(context).size.width / 3,
                  color: _baseColor,
                  child: Center(
                    child: ClayContainer(
                      color: _baseColor,
                      height: 100.0,
                      width: 100.0,
                      borderRadius: 50.0,
                      curveType: CurveType.concave,
                    ),
                  ),
                ),
                Container(
                  height: 350.0,
                  width: MediaQuery.of(context).size.width / 3,
                  color: _baseColor,
                  child: Center(
                    child: ClayContainer(
                      color: _baseColor,
                      height: 100.0,
                      width: 100.0,
                      borderRadius: 50.0,
                      curveType: CurveType.none,
                    ),
                  ),
                ),
                Container(
                  height: 350.0,
                  width: MediaQuery.of(context).size.width / 3,
                  color: _baseColor,
                  child: Center(
                    child: ClayContainer(
                      color: _baseColor,
                      height: 100.0,
                      width: 100.0,
                      borderRadius: 50.0,
                      curveType: CurveType.convex,
                      child: Icon(
                        Icons.add,
                        size: 64.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 350.0,
              child: Center(
                child: ClayContainer(
                  color: _baseColor1,
                  height: 240.0,
                  width: 240.0,
                  borderRadius: 120.0,
                  curveType: CurveType.concave,
                  depth: _depthFirst.toInt(),
                  child: Center(
                    child: ClayContainer(
                      color: _baseColor1,
                      height: 200.0,
                      width: 200.0,
                      borderRadius: 100.0,
                      curveType: CurveType.convex,
                      depth: _depthSecond.toInt(),
                      child: Center(
                        child: ClayContainer(
                          color: _baseColor1,
                          height: 160.0,
                          width: 160.0,
                          borderRadius: 80.0,
                          curveType: CurveType.concave,
                          depth: _depthThird.toInt(),
                          child: Center(
                            child: ClayContainer(
                              color: _baseColor1,
                              height: 120.0,
                              width: 120.0,
                              borderRadius: 60.0,
                              curveType: CurveType.convex,
                              depth: _depthFourth.toInt(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
