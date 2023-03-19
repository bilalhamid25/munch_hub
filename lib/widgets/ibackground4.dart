import 'package:flutter/material.dart';

class IBackground4 extends StatelessWidget {
  final double width;
  final List<Color> colorsGradient;
  final String? heroTag;
  final double borderRadius;
  final Widget? child;

  const IBackground4(
      {Key? key,
      this.width = 300,
      required this.colorsGradient,
      this.heroTag,
      this.borderRadius = 0,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child = Container();
    child = child;
    String heroTag = UniqueKey().toString();
    heroTag = heroTag;

    // var _colorsGradient = theme.colorsGradient;//[Color.fromARGB(255, 33, 206, 186), Color.fromARGB(255, 172, 229, 184), Color.fromARGB(255, 172, 229, 184)];
    // if (colorsGradient != null)
    //   _colorsGradient = colorsGradient;

    return Hero(
        tag: heroTag,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: colorsGradient,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(3, 3),
                  ),
                ],
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                      // right bottom circle
                      width: width * 0.8,
                      height: width * 0.8,
                      bottom: -width * 0.4,
                      right: -width * 0.4,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0x20FFFFFF),
                          shape: BoxShape.circle,
                        ),
                      )),
                  Positioned(
                      // left bottom circle
                      width: width * 0.3,
                      height: width * 0.3,
                      bottom: width * 0.5,
                      left: -width * 0.1,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0x0AFFFFFF),
                          shape: BoxShape.circle,
                        ),
                      )),
                  Positioned(
                      // left bottom circle
                      width: width * 0.2,
                      height: width * 0.2,
                      bottom: width * 0.2,
                      left: width * 0.1,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0x10FFFFFF),
                          shape: BoxShape.circle,
                        ),
                      )),
                  Positioned(
                      width: width * 0.8,
                      height: width * 0.8,
                      top: -width * 0.4,
                      left: -width * 0.4,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0x20FFFFFF),
                          shape: BoxShape.circle,
                        ),
                      )),
                  Positioned(
                    top: 70,
                    left: 10,
                    child: UnconstrainedBox(
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: Image.asset(
                          "assets/images/star.png",
                          fit: BoxFit.contain,
                          color: Colors.white.withAlpha(80),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 20,
                      left: width * 0.2,
                      child: UnconstrainedBox(
                          child: SizedBox(
                              height: 20,
                              width: 20,
                              child: Image.asset(
                                "assets/images/star.png",
                                fit: BoxFit.contain,
                                color: Colors.white.withAlpha(80),
                              )))),
                  Positioned(
                      bottom: 10,
                      left: width * 0.7,
                      child: UnconstrainedBox(
                          child: SizedBox(
                              height: 20,
                              width: 20,
                              child: Image.asset(
                                "assets/images/star.png",
                                fit: BoxFit.contain,
                                color: Colors.white.withAlpha(80),
                              )))),
                  Positioned(
                      top: 20,
                      left: width * 0.5,
                      child: UnconstrainedBox(
                          child: SizedBox(
                              height: 20,
                              width: 20,
                              child: Image.asset(
                                "assets/images/star.png",
                                fit: BoxFit.contain,
                                color: Colors.white.withAlpha(80),
                              )))),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: child,
                      )),
                ],
              )),
        ));
  }
}
