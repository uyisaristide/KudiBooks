import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kudibooks_app/providers/all_providers_list.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/hyperlink_text.dart';
import 'package:kudibooks_app/screens/auth_screens/widgets/page_title.dart';
import 'package:kudibooks_app/screens/background.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../dashboard/classes/snack_bars.dart';

class OtpVerification extends ConsumerStatefulWidget {
  String phoneNumber;

  OtpVerification({required this.phoneNumber, Key? key}) : super(key: key);

  @override
  ConsumerState<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends ConsumerState<OtpVerification>
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
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("This is the number ${widget.phoneNumber}");
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
                onCompleted: ((value) async {
                  var response = await ref
                      .read(authProvider.notifier)
                      .verifyOTP(value, widget.phoneNumber);
                  if (response == "success") {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBars.snackBars(
                            'Verfied successfully', Colors.green.shade400));
                    context.goNamed("signin");
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBars.snackBars('Wrong OTP', Colors.red.shade400));
                  }
                }),
                keyboardType: TextInputType.number,
                appContext: context,
                length: 4,
                onChanged: (value) => {debugPrint(value)},
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
            HyperLinkText(
              directingText: 'Resend the code ?',
              actions: (){
                context.goNamed('forget');
              },
            )
          ],
        ),
      ),
      paddingSize: 150,
    );
  }
}
