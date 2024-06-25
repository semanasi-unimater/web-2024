import 'package:flutter/widgets.dart';

class FogueteAnimado extends StatefulWidget {
  final double mult;
  final bool isSmallScreen;
  const FogueteAnimado(
      {super.key, required this.mult, required this.isSmallScreen});

  @override
  // ignore: no_logic_in_create_state
  FogueteAnimadoState createState() => FogueteAnimadoState(mult, isSmallScreen);
}

class FogueteAnimadoState extends State<FogueteAnimado>
    with SingleTickerProviderStateMixin {
  double mult;
  bool isSmallScreen;
  FogueteAnimadoState(this.mult, this.isSmallScreen);
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    animation = Tween<double>(begin: isSmallScreen ? 0 : -25, end: 40).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, animation.value),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * mult,
            child: Image.asset('./lib/assets/Foguete.png'),
          ),
        );
      },
    );
  }
}
