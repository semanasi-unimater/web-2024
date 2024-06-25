import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:semanaacademica2024/enum/enum.dart';
import 'package:semanaacademica2024/utils/utils.dart';
import 'package:semanaacademica2024/widgets/gradient_container.dart';

class PatrocinadoresPage extends StatefulWidget {
  const PatrocinadoresPage({super.key});

  @override
  State<PatrocinadoresPage> createState() => _PatrocinadoresPageState();
}

class _PatrocinadoresPageState extends State<PatrocinadoresPage> {
  int currentPage = 0;

  List<Widget> listaPatrocinadores = const [
    GradientContainer(
      tela: PalestrantesPatrocinadores.patrocinadores,
      senioridade: 'Senior',
      asset1: './lib/assets/patrocinadores/aiqfome.png',
      asset2: './lib/assets/patrocinadores/bv.png',
    ),
    GradientContainer(
      tela: PalestrantesPatrocinadores.patrocinadores,
      senioridade: 'Pleno',
      asset1: './lib/assets/patrocinadores/ids.jpg',
      asset2: './lib/assets/patrocinadores/softfocus.png',
    ),
    GradientContainer(
      tela: PalestrantesPatrocinadores.patrocinadores,
      senioridade: 'Junior',
      asset1: './lib/assets/patrocinadores/viasoft.jpg',
      asset2: './lib/assets/patrocinadores/sinnc.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Utils.isMobile(context) ? mobile(screenSize) : desktop(screenSize);
  }

  mobile(Size screenSize) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF13A1A2),
              Color(0xFF6761DC),
              Color(0xFF8569DA),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: screenSize.height * 0.06,
            ),
            Image.asset('./lib/assets/patrocinadores/patrocinadores.png'),
            SizedBox(
              height: screenSize.height * 0.06,
            ),
            SizedBox(
              width: double.infinity,
              child: CarouselSlider(
                items: listaPatrocinadores
                    .map(
                      (e) => e,
                    )
                    .toList(),
                options: CarouselOptions(
                  height: screenSize.height * 0.55,
                  initialPage: 0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  enlargeCenterPage: true,
                  viewportFraction: 0.7,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            buildCarouselIndicators(),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }

  desktop(Size screenSize) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF13A1A2),
            Color(0xFF6761DC),
            Color(0xFF8569DA),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Image.asset(
            './lib/assets/patrocinadores/patrocinadores.png',
            width: MediaQuery.of(context).size.width * 0.30,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          AspectRatio(
            aspectRatio: 16 / 3.78,
            child: CarouselSlider(
              items: listaPatrocinadores
                  .map(
                    (e) => Wrap(children: [e]),
                  )
                  .toList(),
              options: CarouselOptions(
                initialPage: 0,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                enlargeCenterPage: true,
                viewportFraction: 0.65,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentPage = index;
                  });
                },
              ),
            ),
          ),
          buildCarouselIndicators(),
        ],
      ),
    );
  }

  buildCarouselIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < listaPatrocinadores.length; i++)
          Container(
            margin: const EdgeInsets.all(5),
            height: i == currentPage ? 13 : 10,
            width: i == currentPage ? 13 : 10,
            decoration: BoxDecoration(
              color: i == currentPage ? Colors.grey : Colors.black,
              shape: BoxShape.circle,
              border: Border.all(
                color: i == currentPage ? Colors.black : Colors.black,
                width: 2,
              ),
            ),
          )
      ],
    );
  }
}
