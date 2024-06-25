import 'package:flutter/material.dart';
import 'package:semanaacademica2024/widgets/hover_button.dart';
import 'dart:async';

import 'package:url_launcher/url_launcher.dart';

import '../utils/utils.dart';

class NavBarHome extends StatelessWidget {
  const NavBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
          vertical: Utils.isMobile(context)
              ? screenSize.height * 0.010
              : screenSize.height * 0.014,
          horizontal: Utils.isMobile(context)
              ? screenSize.width * 0.040
              : screenSize.width * 0.040),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [const Color(0xFF3B3959), Colors.black.withOpacity(0.9)],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Row(
          //   children: [
          //     DropdownMenu(
          //       buttonTitleStyle: TextStyle(
          //         color: Colors.white,
          //         fontSize: Utils.isMobile(context)
          //             ? screenSize.height * 0.025
          //             : screenSize.height * 0.030,
          //       ),
          //       dropdownWidth: Utils.isMobile(context)
          //           ? screenSize.height * 0.2
          //           : screenSize.height * 0.3,
          //       buttonTitle: 'Navegação',
          //       dropdownItems: const [
          //         ListTile(
          //           mouseCursor: SystemMouseCursors.click,
          //           title: Text('Open', style: TextStyle(color: Colors.white)),
          //         ),
          //         ListTile(
          //           mouseCursor: SystemMouseCursors.click,
          //           title: Text('New', style: TextStyle(color: Colors.white)),
          //         )
          //       ],
          //     ),
          //     const Icon(
          //       Icons.keyboard_arrow_down_outlined,
          //       color: Colors.white,
          //     )
          //   ],
          // ),
          Expanded(
            child: Container(),
          ),
          SizedBox(
            height: 40,
            width: 180,
            child: HoverButton(
              texto: 'Inscreva-se!',
              cores: const [
                Color(0xFF4CC9F0),
                Color(0xFF5458FE),
                Color(0xFF853BF7),
              ],
              bold: true,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class DropdownMenu extends StatefulWidget {
  final TextStyle buttonTitleStyle;
  final double dropdownWidth;
  final String buttonTitle;
  final List<ListTile> dropdownItems;

  const DropdownMenu({
    super.key,
    required this.buttonTitleStyle,
    required this.dropdownWidth,
    required this.buttonTitle,
    required this.dropdownItems,
  });

  @override
  DropdownMenuState createState() => DropdownMenuState();
}

class DropdownMenuState extends State<DropdownMenu> {
  bool isDropdownVisible = false;
  Timer? hideTimer;

  void showDropdown() {
    hideTimer?.cancel();
    setState(() {
      isDropdownVisible = true;
    });
  }

  void startHideDropdownTimer() {
    hideTimer = Timer(const Duration(milliseconds: 200), () {
      setState(() {
        isDropdownVisible = false;
      });
    });
  }

  void cancelHideDropdownTimer() {
    hideTimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        MouseRegion(
          onEnter: (_) => showDropdown(),
          onExit: (_) => startHideDropdownTimer(),
          child: SizedBox(
            width: 100,
            child: GestureDetector(
              onTap: () {},
              child: Text(widget.buttonTitle, style: widget.buttonTitleStyle),
            ),
          ),
        ),
        if (isDropdownVisible)
          Positioned(
            top: 50,
            child: MouseRegion(
              onEnter: (_) => cancelHideDropdownTimer(),
              onExit: (_) => startHideDropdownTimer(),
              child: Container(
                width: widget.dropdownWidth,
                color: Colors.black,
                child: Column(
                  children: widget.dropdownItems,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
