import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:semanaacademica2024/enum/enum.dart';
import 'package:semanaacademica2024/model/palestrantes_model.dart';
import 'package:semanaacademica2024/utils/utils.dart';
import 'package:semanaacademica2024/widgets/gradient_container.dart';

class PalestrantesPage extends StatefulWidget {
  const PalestrantesPage({super.key});

  @override
  State<PalestrantesPage> createState() => PalestrantesPageState();
}

class PalestrantesPageState extends State<PalestrantesPage> {
  List<Widget> listaPalestrantes = [
    GradientContainer(
      tela: PalestrantesPatrocinadores.palestrantes,
      diaDaSemana: 'Segunda-Feira',
      ddMMyyyy: '02/09/2024',
      palestrantes: [
        Palestrante(
            nome: 'Nome1',
            tema: 'Mentoria de Careira',
            horarios: '19:30 ás 20:10',
            assetImage: './lib/assets/Celular.png'),
        Palestrante(
            nome: 'Nome2',
            tema: 'Liderança',
            horarios: '20:50 ás 21:30',
            assetImage: './lib/assets/Celular.png'),
      ],
    ),
    GradientContainer(
      tela: PalestrantesPatrocinadores.palestrantes,
      diaDaSemana: 'Terça-Feira',
      ddMMyyyy: '03/09/2024',
      palestrantes: [
        Palestrante(
            nome: 'Nome3',
            tema: 'Inteligência Artificial',
            horarios: '19:30 ás 20:10',
            assetImage: './lib/assets/Celular.png'),
        Palestrante(
            nome: 'Thiago Reolon',
            tema: 'O Futuro da Análise de Dados:\n  Tendências e Oportunidade',
            horarios: '19:30 ás 20:10',
            assetImage: './lib/assets/palestrantes/thiago.jpg'),
      ],
    ),
    GradientContainer(
      tela: PalestrantesPatrocinadores.palestrantes,
      diaDaSemana: 'Quarta-Feira',
      ddMMyyyy: '04/09/2024',
      palestrantes: [
        Palestrante(
            nome: 'Alexandro Hervis',
            tema: 'Arquitetura de Projetos',
            horarios: '19:30 ás 20:10',
            assetImage: './lib/assets/palestrantes/alexandro.jpg'),
        Palestrante(
            nome: 'Nome6',
            tema: 'Dev. Full Stack',
            horarios: '19:30 ás 20:10',
            assetImage: './lib/assets/Celular.png'),
      ],
    ),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Utils.isMobile(context) ? mobile(screenSize) : deskop(screenSize);
  }

  mobile(Size screenSize) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF4BC8EF).withOpacity(0.9),
            const Color(0xFF13A1A2),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('./lib/assets/palestrantes/confira_mobile.png'),
          SizedBox(height: screenSize.height * 0.03),
          CarouselSlider(
            items: listaPalestrantes
                .map(
                  (item) => item,
                )
                .toList(),
            options: CarouselOptions(
              height: screenSize.height * 0.80,
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
          SizedBox(
            height: screenSize.height * 0.02,
          ),
          buildCarouselIndicators(),
          SizedBox(
            height: screenSize.height * 0.02,
          ),
        ],
      ),
    );
  }

  deskop(Size screenSize) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF5AC7EE),
            Color(0xFF13A1A2),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            './lib/assets/palestrantes/confira_desktop.png',
            width: screenSize.width * 0.40,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          AspectRatio(
            aspectRatio: 16 / 6.1,
            child: CarouselSlider(
              items: listaPalestrantes
                  .map(
                    (palestrante) => Wrap(
                      children: [palestrante],
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                initialPage: 0,
                autoPlay: true,
                enlargeCenterPage: true,
                autoPlayInterval: const Duration(seconds: 5),
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
        for (int i = 0; i < listaPalestrantes.length; i++)
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
