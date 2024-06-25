import 'package:flutter/material.dart';
import 'package:semanaacademica2024/utils/utils.dart';

class PatrocinadoresContainer extends StatefulWidget {
  final String asset;
  const PatrocinadoresContainer({
    super.key,
    required this.asset,
  });

  @override
  State<PatrocinadoresContainer> createState() =>
      PatrocinadoresContainerState();
}

class PatrocinadoresContainerState extends State<PatrocinadoresContainer> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Utils.isMobile(context) ? mobile(screenSize) : desktop(screenSize);
  }

  mobile(Size screenSize) {
    return Expanded(
      child: Container(
        width: screenSize.width * 0.45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF8F07FC),
              Color(0xFF4FECFF),
            ],
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              spreadRadius: 4,
              blurRadius: 4,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.asset),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  desktop(Size screenSize) {
    return Container(
      width: screenSize.width * 0.18,
      height: screenSize.height * 0.32,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF8F07FC),
            Color(0xFF4FECFF),
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            spreadRadius: 4,
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.asset),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
