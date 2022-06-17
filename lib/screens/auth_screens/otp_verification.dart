import 'package:flutter/material.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/hyperlink_text.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/page_title.dart';
import 'package:kudibooks_app/screens/background.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({Key? key}) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification>
    with TickerProviderStateMixin {
  late AnimationController controller;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return ' ${count.inHours}${(count.inMinutes % 60).toString()}:${count.inSeconds}';
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 60));
  }

  @override
  Widget build(BuildContext context) {
    controller.reverse(from: controller.value == 0 ? 1.0 : controller.value);
    return BackgroundScreen(
      screens: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.symmetric(vertical: 40),
                alignment: Alignment.center,
                child: Image.asset('assets/images/categories/otplock.png')),
            const PageTitle(title: 'OTP Code'),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Please enter the OTP code we sent to your phone number',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              child: PinCodeTextField(
                keyboardType: TextInputType.number,
                appContext: context,
                length: 4,
                onChanged: (value) => {},
                onSubmitted: (pin) => {},
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: 70,
                    activeColor: Colors.grey,
                    selectedColor: Colors.blueAccent,
                    inactiveColor: Colors.grey),
              ),
            ),
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) => Text(
                countText,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const HyperLinkText(directingText: 'Resend the code ?')
          ],
        ),
      ),
      paddingSize: 150,
    );
  }
}
