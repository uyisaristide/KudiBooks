import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/splash_screen/widgets/left_side_stack.dart';

class GreenSplashScreen extends StatelessWidget {
  const GreenSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0Xff157253),
      body: Column(
        children: [
          Flexible(
            child: Container(
              height: 100,
              width: double.infinity,
              color: Colors.amber,
            ),
          ),
          Flexible(
            child: Container(
              // height: 150,
              width: double.infinity,
              // color: Colors.white,
              child: LeftHandStack(
                innerShapeColor: '',
                outerShapeColor: '',
              ),
            ),
          ),
          const SizedBox(
            height: 400,
            width: double.infinity,
            child: Center(
              child: Image(
                image: AssetImage('assets/images/kudibooks-WHITE-PNG-LOGO.png'),
                width: 351,
                height: 351,
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: 100,
              width: double.infinity,
              color: Colors.white,
            ),
          )

          // // LeftHandStack(innerShapeColor: '', outerShapeColor: ''),
          // const Center(
          //   // color: const Color(0Xff157253),
          //   child: Center(
          //     child: Image(
          //       image: AssetImage('assets/images/kudibooks-WHITE-PNG-LOGO.png'),
          //       width: 351,
          //       height: 351,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
