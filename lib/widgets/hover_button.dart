import 'package:flutter/material.dart';
import 'package:semanaacademica2024/utils/utils.dart';

// ignore: must_be_immutable
class HoverButton extends StatefulWidget {
  final List<Color>? cores;
  final String texto;
  String? fonte;
  bool? bold;
  Color? shadowColor;
  Function? onPressed;

  HoverButton(
      {super.key,
      this.fonte,
      this.bold,
      this.shadowColor,
      required this.cores,
      required this.texto,
      required this.onPressed});

  @override
  HoverButtonState createState() => HoverButtonState();
}

class HoverButtonState extends State<HoverButton> {
  bool isHovered = false;

  void _onEnter(PointerEvent details) {
    setState(() {
      isHovered = true;
    });
  }

  void _onExit(PointerEvent details) {
    setState(() {
      isHovered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;

    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: GestureDetector(
        onTap: () {
          widget.onPressed!();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 300,
          height: 50,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: widget.cores!,
            ),
            color: Colors.grey,
            borderRadius: BorderRadius.circular(7),
            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color:
                          widget.shadowColor ?? Colors.white.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ]
                : [],
          ),
          alignment: Alignment.center,
          child: Text(
            widget.texto,
            style: TextStyle(
              color: Colors.white,
              fontSize: Utils.getResponsiveFontSize(screenSize),
              fontFamily: widget.fonte,
              fontWeight:
                  widget.bold != null ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
