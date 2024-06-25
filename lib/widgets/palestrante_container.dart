import 'package:flutter/material.dart';
import 'package:semanaacademica2024/model/palestrantes_model.dart';
import 'package:semanaacademica2024/utils/utils.dart';

class PalestranteContainer extends StatefulWidget {
  final Palestrante palestrante;
  const PalestranteContainer({super.key, required this.palestrante});

  @override
  State<PalestranteContainer> createState() => PalestranteContainerState();
}

class PalestranteContainerState extends State<PalestranteContainer> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Utils.isMobile(context) ? mobile(screenSize) : desktop(screenSize);
  }

  mobile(Size screenSize) {
    return Expanded(
      child: Container(
        width: screenSize.width * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: const LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF4D86F4),
              Color(0xFF9980D9),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF8F07FC),
                      Color(0xFFE15C32),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: CircleAvatar(
                  radius: screenSize.width * 0.1,
                  backgroundImage: AssetImage(widget.palestrante.assetImage),
                ),
              ),
            ),
            Text(
              widget.palestrante.nome,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenSize.width * 0.040,
                fontFamily: 'Jura',
              ),
            ),
            Text(
              widget.palestrante.tema,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenSize.width * 0.027,
                fontFamily: 'Jura',
              ),
            ),
            Text(
              widget.palestrante.horarios,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenSize.width * 0.023,
                fontFamily: 'Jura',
              ),
            ),
          ],
        ),
      ),
    );
  }

  desktop(Size screenSize) {
    return Container(
      width: screenSize.width * 0.2,
      height: screenSize.width * 0.28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFF4D86F4), Color(0xFF9980D9)],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF8F07FC),
                    Color(0xFFE15C32),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: CircleAvatar(
                radius: screenSize.width * 0.050,
                backgroundImage: AssetImage(widget.palestrante.assetImage),
              ),
            ),
          ),
          Text(
            widget.palestrante.nome,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenSize.width * 0.020,
              fontFamily: 'Jura',
            ),
          ),
          Text(
            widget.palestrante.tema,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenSize.width * 0.015,
              fontFamily: 'Jura',
            ),
          ),
          Text(
            widget.palestrante.horarios,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenSize.width * 0.013,
              fontFamily: 'Jura',
            ),
          ),
        ],
      ),
    );
  }
}
