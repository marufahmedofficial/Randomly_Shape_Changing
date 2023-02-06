import 'package:flutter/material.dart';
import 'dart:math';
class StateManagement extends StatefulWidget {
  const StateManagement({Key? key}) : super(key: key);

  @override
  State<StateManagement> createState() => _StateManagementState();
}

class _StateManagementState extends State<StateManagement> {
  double _width = 100;
  double _height = 100;
  final random = Random.secure();
  int a = 150, r = 200, g = 200, b = 200;
  double topleft = 10;
  double topright = 10;
  double buttomleft = 10;
  double buttomright = 10;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(

        title: const Text('Changing Shapes'),
        flexibleSpace:
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple,Colors.redAccent],
                begin: Alignment.bottomRight,
                end : Alignment.topLeft,
              ),
                  borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)
          )

          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular((40))),
        ),

      ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
       floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.indigoAccent,
        splashColor: Colors.purple,
        hoverColor: Colors.orange,

        onPressed: _changeContainer,
        label : const Text('Change'),
        icon: const Icon(Icons.change_circle) ,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(topleft),
                topRight: Radius.circular(topright),
                bottomLeft: Radius.circular(buttomleft),
                bottomRight: Radius.circular(buttomright),
              ),
              color: Color.fromARGB(a, r, g, b),
            ),
          ),
        ),
      ),
    );
  }


  void _changeContainer() {
    setState(() {
      _width = random.nextInt(251)+50.toDouble();
      _height = random.nextInt(251)+50.toDouble();
      topleft = random.nextInt(251)+50.toDouble();
      topright = random.nextInt(251)+50.toDouble();
      buttomleft = random.nextInt(251)+50.toDouble();
      buttomright = random.nextInt(251)+50.toDouble();
      a = random.nextInt(255);
      r = random.nextInt(255);
      g = random.nextInt(255);
      b = random.nextInt(255);

    });
  }
}
