import 'package:flutter/material.dart';
import 'package:semanaacademica2024/enum/enum.dart';
import 'package:semanaacademica2024/screens/mater_game_screen.dart';
import 'package:semanaacademica2024/screens/palestrantes_screen.dart';
import 'package:semanaacademica2024/screens/patrocinadores_screen.dart';
import 'package:semanaacademica2024/screens/top_screen.dart';
import 'package:semanaacademica2024/utils/utils.dart';
import 'package:semanaacademica2024/widgets/nav_bar.dart';
import 'package:semanaacademica2024/widgets/texto_com_borda.dart';

class ScreenMain extends StatefulWidget {
  const ScreenMain({super.key});

  @override
  State<ScreenMain> createState() => ScreenMainState();
}

class ScreenMainState extends State<ScreenMain> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(const AssetImage('./lib/assets/foguete.png'), context);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(const AssetImage('./lib/assets/estrelas.png'), context);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(const AssetImage('./lib/assets/poligonos.jpeg'), context);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(
          const AssetImage('./lib/assets/Componentes-Banner-MaterCode.png'),
          context);
    });
  }

  @override
  Widget build(BuildContext context) {
    DeviceType deviceType = Utils.getDeviceType(context);
    var screenSize = MediaQuery.of(context).size;

    switch (deviceType) {
      case DeviceType.mobile:
        return mobile(screenSize);
      case DeviceType.tablet:
        return tablet(screenSize);
      case DeviceType.desktop:
        return desktop(screenSize);
      default:
        return desktop(screenSize);
    }
  }

  desktop(Size screenSize) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: NavBarHome(),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF4CC9F0),
              Color(0xFF0A9C99),
              Color(0xFF8569DA),
            ],
          ),
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            const ContainerHomeTop(),
            const QrCodeContainer(),
            const PalestrantesPage(),
            const PatrocinadoresPage(),
            Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    width: double.infinity,
                    height: screenSize.height * 0.01,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF8569DA),
                          Colors.white,
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: screenSize.height * 0.35,
                    child: Image.asset(
                      './lib/assets/realizacao/realizacao.png',
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: screenSize.height * 0.01,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFF94DEFB),
                          Color(0xFF7B51FF),
                          Color(0xFFEC32F8),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.grey.withOpacity(0.75),
                    height: screenSize.height * 0.09,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Semana Academica 2024',
                          style: TextStyle(
                              fontSize: screenSize.width * 0.010,
                              color: Colors.white,
                              fontFamily: 'Jura',
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '© Todos os direitos reservados.',
                          style: TextStyle(
                              fontSize: screenSize.width * 0.010,
                              color: Colors.white,
                              fontFamily: 'Jura',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  tablet(Size screenSize) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            './lib/assets/poligonos.jpeg',
            fit: BoxFit.cover,
          ),
        ),
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextoComBorda(
              text: 'Desculpe, mas ainda nao possuimos',
              fontFamily: 'Cristik',
              fontSize: screenSize.width * 0.05,
              textColor: Colors.white,
              borderColor: const Color(0xFF935CAB),
            ),
            SizedBox(
              height: screenSize.height * 0.04,
            ),
            TextoComBorda(
              text: 'responsividade para tablets',
              fontFamily: 'Cristik',
              fontSize: screenSize.width * 0.050,
              textColor: Colors.white,
              borderColor: const Color(0xFF935CAB),
            ),
          ],
        )),
      ],
    );
  }

  mobile(Size screenSize) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: NavBarHome(),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF4CC9F0),
              Color(0xFF0A9C99),
              Color(0xFF8569DA),
            ],
          ),
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            const ContainerHomeTop(),
            const QrCodeContainer(),
            const PalestrantesPage(),
            const PatrocinadoresPage(),
            Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    width: double.infinity,
                    height: screenSize.height * 0.005,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF8569DA),
                          Colors.white,
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: screenSize.height * 0.2,
                    child: Image.asset(
                      './lib/assets/realizacao/realizacao.png',
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: screenSize.height * 0.01,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF94DEFB),
                        Color(0xFF7B51FF),
                        Color(0xFFEC32F8),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.grey.withOpacity(0.75),
                  height: screenSize.height * 0.075,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Semana Academica 2024',
                        style: TextStyle(
                            fontSize: screenSize.width * 0.032,
                            color: Colors.white,
                            fontFamily: 'Jura',
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '© Todos os direitos reservados.',
                        style: TextStyle(
                            fontSize: screenSize.width * 0.032,
                            color: Colors.white,
                            fontFamily: 'Jura',
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
