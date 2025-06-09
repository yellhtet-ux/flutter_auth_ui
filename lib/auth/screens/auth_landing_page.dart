import 'package:flutter/material.dart';
import 'package:flutter_keyword_highlighter/flutter_keyword_highlighter.dart';

class AuthLandingPage extends StatefulWidget {
  const AuthLandingPage({super.key});

  @override
  State<AuthLandingPage> createState() => _AuthLandingPageState();
}

class _AuthLandingPageState extends State<AuthLandingPage> {
  void _gmailButtonGotPressed() {
    setState(() {
      print('Gmail button got pressed');
    });
  }

  void _facebookButtonGotPressed() {
    setState(() {
      print('Facebook button got pressed');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 50.0,
          children: [
            //! Welcome Label
            HighlightedText(
              content: "Welcome to Todyapp",
              defaultTextStyle: const TextStyle(fontSize: 30.0),
              highlightedTextStyles: [
                HighlightedTextStyle(
                  highlightedText: "Todyapp",
                  customStyle: TextStyle(color: Colors.blue),
                ),
              ],
            ),
            //! Welcom Image
            Image(
              image: AssetImage('assets/images/onboard_img.png'),
              height: 300.0,
              width: double.infinity,
              fit: BoxFit.fitHeight,
            ),
            //! Gmail Button
            ElevatedButton.icon(
              onPressed: _gmailButtonGotPressed,
              icon: Image(image: AssetImage('assets/images/littledrop.png')),
              label: Text('Continue with Gmail'),
            ),

            //! Divider
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10.0,
              children: [
                Container(width: 100.0, height: 1.0, color: Colors.grey),
                Text('or continue with'),
                Container(width: 100.0, height: 1.0, color: Colors.grey),
              ],
            ),

            //! Custom Auth Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20.0,
              children: [
                buildCustomAuthButton(onPressed: _facebookButtonGotPressed, label: "Facebook",icon: Image.asset('assets/images/facebook.png')),
                buildCustomAuthButton(onPressed: _gmailButtonGotPressed, label: "Gmail",icon: Image.asset('assets/images/gmail.png'))
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget buildCustomAuthButton({
  required VoidCallback? onPressed,
  required String label,
  Widget? icon,
  Color? color,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(8.0),
      ),
    ),
    child: SizedBox(
      width: 120.0,
      height: 30.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[icon, const SizedBox(width: 10.0)],
          Text(
            label,
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    ),
  );
}
