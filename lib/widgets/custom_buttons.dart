import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomButton1 extends StatelessWidget {
  final Widget text;
  final Color? backgroundColor;
  final Color? overlayColor;
  final VoidCallback onPressed;
  final double height;
  final double width;
  final bool border;
  final double borderRadius;

  const CustomButton1(
      {Key? key,
      required this.text,
      this.backgroundColor,
      this.overlayColor,
      required this.onPressed,
      this.height = 45,
      this.borderRadius = 10,
      this.border = false,
      this.width = double.infinity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          overlayColor: (overlayColor == null)
              ? null
              : MaterialStateProperty.all(overlayColor),
          backgroundColor: (backgroundColor == null)
              ? null
              : MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          side: border == false
              ? null
              : MaterialStateProperty.all(
                  const BorderSide(
                    color: Color(0xFF162342),
                  ),
                ),
        ),
        child: text,
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  final Widget text;
  final Color buttonColor;
  final VoidCallback onPressed;
  final double height;
  final double width;

  const CustomButton2({Key? key, required this.text,
    required this.buttonColor,
    required this.onPressed,
    this.height = 45,
    this.width = double.infinity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ), backgroundColor: buttonColor,
        ),
        onPressed: onPressed,
        child: text,
      ),
    );
  }
}
class SocialButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? overlayColor;
  final VoidCallback onPressed;
  final double height;
  final double width;
  final double borderRadius;
  final IconData icon;

  const SocialButton(
      {Key? key,
      required this.text,
      required this.icon,
      required this.backgroundColor,
      this.overlayColor,
      required this.onPressed,
      this.height = 45,
      this.borderRadius = 6,
      this.width = double.infinity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(borderRadius),
      color: backgroundColor,
      child: InkWell(
        hoverColor: Colors.grey.shade50,
        onTap: onPressed,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(
            children: [
              Container(
                height: double.infinity,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(borderRadius),
                    bottomLeft: Radius.circular(borderRadius),
                  ),
                  color: Colors.white.withOpacity(0.3),
                ),
                child: FaIcon(
                  icon,
                  color: Colors.white,
                  size: 15,
                ),
              ),
              Expanded(
                child: Container(
                  height: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 13.5,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
