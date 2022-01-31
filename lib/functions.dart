import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

late Size screenSize;
double doubleHeight(double value, {double height = 0}) {
  if (height == 0) height = screenSize.height;
  return (height * value) / 100;
}

double doubleWidth(double value, {double width = 0}) {
  if (width == 0) width = screenSize.width;
  return (width * value) / 100;
}

statusSet({Color? statusBar, bool? statusBarIconIsWhite, Color? navigationBar, bool? navigationBarLineIsWhite}) async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: statusBar,
      statusBarBrightness:
      (statusBarIconIsWhite != null) ? (statusBarIconIsWhite ? Brightness.light : Brightness.dark) : null,
      statusBarIconBrightness:
          (statusBarIconIsWhite != null) ? (statusBarIconIsWhite ? Brightness.light : Brightness.dark) : null,
      systemNavigationBarColor: navigationBar,
      systemNavigationBarDividerColor: navigationBar,
      systemNavigationBarIconBrightness:
          (navigationBarLineIsWhite != null) ? (navigationBarLineIsWhite ? Brightness.light : Brightness.dark) : null,
    ));
  } on PlatformException catch (e) {
    debugPrint(e.toString());
  }
}

//for navigate between screens

class GestureDetectorVertical extends StatefulWidget {
  final Function? onDown;
  final Function? onTop;
  final Function? onTap;
  final Widget? child;
  const GestureDetectorVertical({Key? key, this.onDown, this.onTop, this.child, this.onTap}) : super(key: key);

  @override
  _GestureDetectorVerticalState createState() => _GestureDetectorVerticalState();
}

class _GestureDetectorVerticalState extends State<GestureDetectorVertical> {
  late double ds;

  double? de;

  bool doIt = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (DragUpdateDetails e) {
        de = e.globalPosition.dy;
        if (ds > de! && doIt == false) {
          //top
          doIt = true;
          if (widget.onTop != null) {
            widget.onTop!();
          }
        } else if (ds < de! && doIt == false) {
          //down
          doIt = true;
          if (widget.onDown != null) {
            widget.onDown!();
          }
        }
      },
      onVerticalDragEnd: (e) async {
        doIt = false;
        de = null;
      },
      onVerticalDragStart: (DragStartDetails e) {
        ds = e.globalPosition.dy;
      },
      onTap: widget.onTap != null
          ? () {
              widget.onTap!();
            }
          : null,
      child: widget.child,
    );
  }
}

class GestureDetectorHorizontal extends StatefulWidget {
  final Function? onRight;
  final Function? onLeft;
  final Widget? child;
  const GestureDetectorHorizontal({Key? key, this.onRight, this.onLeft, this.child}) : super(key: key);
  @override
  _GestureDetectorHorizontalState createState() => _GestureDetectorHorizontalState();
}

class _GestureDetectorHorizontalState extends State<GestureDetectorHorizontal> {
  late double ds;
  late double de;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (DragUpdateDetails e) {
        de = e.globalPosition.dx;
      },
      onHorizontalDragEnd: (e) async {
        if (ds > de) {
          //left
          if (widget.onLeft != null) {
            widget.onLeft!();
          }
        } else {
          if (widget.onRight != null) {
            widget.onRight!();
          }
        }
      },
      onHorizontalDragStart: (DragStartDetails e) {
        ds = e.globalPosition.dx;
      },
      child: widget.child,
    );
  }
}
