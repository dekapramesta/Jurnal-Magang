import 'package:animations/animations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_magang/dialogs/policy_dialog.dart';

class TermsOfUse extends StatelessWidget {
  const TermsOfUse({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "Dengan Membuat Akun Anda Menyetujui \n",
          style: Theme.of(context).textTheme.bodyText1,
          children: [
            TextSpan(
              text: "Syarat & Kebijakan Kami ",
              style: TextStyle(fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  showModal(
                    context: context,
                    configuration: FadeScaleTransitionConfiguration(),
                    builder: (context) {
                      return PolicyDialog(
                        mdFileName: 'privacy_policy.md',
                      );
                    },
                  );
                },
            ),
            // TextSpan(text: "and "),
            // TextSpan(
            //   text: "Privacy Policy! ",
            //   style: TextStyle(fontWeight: FontWeight.bold),
            //   recognizer: TapGestureRecognizer()
            //     ..onTap = () {
            //       showDialog(
            //         context: context,
            //         builder: (context) {
            //           return PolicyDialog(
            //             mdFileName: 'privacy_policy.md',
            //           );
            //         },
            //       );
            //     },
            // ),
          ],
        ),
      ),
    );
  }
}
