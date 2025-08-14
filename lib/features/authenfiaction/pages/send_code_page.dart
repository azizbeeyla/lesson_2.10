import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lesson2_10/core/utils/app_colors.dart';
import 'package:lesson2_10/features/authenfiaction/widgets/send_code_formfield.dart';
import 'package:lesson2_10/features/authenfiaction/widgets/forgot_password_detail.dart';

class SendCodePage extends StatefulWidget {
  final int otpLength = 6;

  const SendCodePage({super.key});

  @override
  State<SendCodePage> createState() => _SendCodePageState();
}

class _SendCodePageState extends State<SendCodePage> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;
  late int timeSeconder;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(
      widget.otpLength,
      (_) => TextEditingController(),
    );
    focusNodes = List.generate(widget.otpLength, (_) => FocusNode());

    _startTimer();
  }

  void _startTimer() {
    timeSeconder = 60;
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (timeSeconder > 0) {
        setState(() {
          timeSeconder--;
        });
      } else {
        t.cancel();
      }
    });
  }

  @override
  void dispose() {
    for (var i in controllers) {
      i.dispose();
    }
    for (var i in focusNodes) {
      i.dispose();
    }
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baige,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Forgot Your Password",
          style: TextStyle(
            color: AppColors.mainpink,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: AppColors.baige,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 37.0, right: 37, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ForgotPasswordDetail(
              textmain: "You’ve got mail",
              textdetail:
                  "We will send you the verification code to your email address, check your email and put the code right below.",
            ),
            SizedBox(height: 53.h),
            Row(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.otpLength, (index) {
                return SendCodeFormField(
                  controller: controllers[index],
                  focusNode: focusNodes[index],
                  onChanged: (value) {
                    if (value.isNotEmpty && index < widget.otpLength - 1) {
                      FocusScope.of(
                        context,
                      ).requestFocus(focusNodes[index + 1]);
                    }
                    if (value.isEmpty && index > 0) {
                      FocusScope.of(
                        context,
                      ).requestFocus(focusNodes[index - 1]);
                    }
                  },
                );
              }),
            ),
            SizedBox(height: 75.h),
            Center(
              child: timeSeconder > 0
                  ? SizedBox(
                      width: 176.w,
                      child: Text(
                        textAlign: TextAlign.center,
                        "Didn’t receive the mail? You can resend it in $timeSeconder sec",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  : TextButton(
                      onPressed: _startTimer,
                      child: Text(
                        "Resend Code",
                        style: TextStyle(color: AppColors.mainpink),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
