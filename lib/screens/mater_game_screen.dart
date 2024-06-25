import 'package:flutter/material.dart';
import 'package:semanaacademica2024/utils/utils.dart';
import 'package:semanaacademica2024/widgets/hover_button.dart';

class QrCodeContainer extends StatefulWidget {
  const QrCodeContainer({super.key});

  @override
  State<QrCodeContainer> createState() => QrCodeContainerState();
}

class QrCodeContainerState extends State<QrCodeContainer> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Utils.isMobile(context) ? mobile(screenSize) : desktop(screenSize);
  }

  mobile(Size screenSize) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF5AC7EE),
            Colors.white,
            Colors.white,
            Color(0xFF5AC7EE)
          ],
          stops: [0.0, 0.20, 0.85, 1],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              './lib/assets/competicao.png',
              height: screenSize.height * 0.2,
              width: screenSize.width * 0.8,
            ),
            SizedBox(
              width: double.infinity,
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned.fill(
                      child: Opacity(
                        opacity: 0.2,
                        child: Image.asset(
                          './lib/assets/Componentes-Banner-MaterCode.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          'Durante a semana, vai rolar uma competição para ver quem encontra mais MaterCodes espalhados pelo ambiente do evento. Os ganhadores vão receber seus prêmios ao final da semana.',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Jura',
                          ),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.035,
                        ),
                        Text(
                          'Se encontrar um, não perca sua chance: pegue seu telefone e se garanta no placar!',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Jura',
                          ),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.040,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Detalhes:',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.04,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Jura',
                              ),
                            ),
                            SizedBox(
                              height: screenSize.height * 0.020,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.circle,
                                  size: 8,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: screenSize.width * 0.020,
                                ),
                                Text(
                                  'Locais',
                                  style: TextStyle(
                                      fontSize: screenSize.width * 0.035,
                                      color: Colors.black,
                                      fontFamily: 'Jura',
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.circle,
                                  size: 8,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: screenSize.width * 0.020,
                                ),
                                Text(
                                  'Horário de inicio',
                                  style: TextStyle(
                                      fontSize: screenSize.width * 0.035,
                                      color: Colors.black,
                                      fontFamily: 'Jura',
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenSize.height * 0.040,
                        ),
                        SizedBox(
                          width: screenSize.width * 0.65,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              HoverButton(
                                texto: 'Ler MaterCode',
                                cores: const [
                                  Color(0xFF4CC9F0),
                                  Color(0xFF5458FE),
                                  Color(0xFFA380F9),
                                ],
                                bold: true,
                                fonte: 'Jura',
                                shadowColor: const Color(0xFF4CC9F0),
                                onPressed: () {},
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Expanded(
                                  child: Image.asset(
                                    './lib/assets/Celular_small.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  desktop(Size screenSize) {
    return SizedBox(
      height: screenSize.height * 1.2,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF5AC7EE),
                    Colors.white,
                    Colors.white,
                    Color(0xFF5AC7EE)
                  ],
                  stops: [0.0, 0.20, 0.85, 0.94],
                ),
              ),
            ),
          ),
          Container(
            color: Colors.transparent,
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Row(
              children: [
                SizedBox(
                  height: screenSize.height * 1.2,
                  width: screenSize.width * 0.5,
                  child: Image.asset(
                    './lib/assets/Componentes-Banner-MaterCode.png',
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('./lib/assets/competicao.png',
                          height: screenSize.height * 0.15,
                          width: double.infinity),
                      const SizedBox(height: 20),
                      Text(
                        'Durante a semana, vai rolar uma competição para ver quem encontra mais MaterCodes espalhados pelo ambiente do evento. Os ganhadores vão receber seus prêmios ao final da semana.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenSize.width * 0.015,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Jura',
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'Se encontrar um, não perca sua chance: pegue seu telefone e se garanta no placar!',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenSize.width * 0.015,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Jura',
                        ),
                      ),
                      Text(
                        'Detalhes:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width * 0.015,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Jura',
                        ),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.020,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            size: 8,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: screenSize.width * 0.020,
                          ),
                          Text(
                            'Horário de inicio',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.015,
                                color: Colors.black,
                                fontFamily: 'Jura',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            size: 8,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: screenSize.width * 0.020,
                          ),
                          Text(
                            'Informação',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.015,
                                color: Colors.black,
                                fontFamily: 'Jura',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            size: 8,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: screenSize.width * 0.020,
                          ),
                          Text(
                            'Locais',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.015,
                                color: Colors.black,
                                fontFamily: 'Jura',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            size: 8,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: screenSize.width * 0.020,
                          ),
                          Text(
                            'Regras',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.015,
                                color: Colors.black,
                                fontFamily: 'Jura',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Center(
                        child: SizedBox(
                          width: screenSize.width * 0.24,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: screenSize.width * 0.22,
                                child: HoverButton(
                                  cores: const [
                                    Color(0xFF4CC9F0),
                                    Color(0xFF5458FE),
                                    Color(0xFF853BF7),
                                  ],
                                  texto: 'Ler MaterCode',
                                  bold: true,
                                  fonte: 'Jura',
                                  shadowColor: const Color(0xFF4CC9F0),
                                  onPressed: () {},
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Image.asset(
                                  './lib/assets/Celular_small.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          '(Exclusivo para celulares)',
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.015,
                              color: Colors.black,
                              fontFamily: 'Jura',
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
