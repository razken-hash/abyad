import 'package:abyad/controllers/navigation_controller.dart';
import 'package:abyad/screens/widgets/abyad_bar.dart';
import 'package:abyad/utils/assets.dart';
import 'package:abyad/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AbyadNavScreen extends StatelessWidget {
  const AbyadNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationController>(
      builder: (context, navigationController, child) {
        return PopScope(
          canPop: false,
          onPopInvoked: (result) {
            navigationController.navigateTo(
              navigationController.screens[2],
              index: 2,
            );
          },
          child: SafeArea(
            child: Scaffold(
              backgroundColor: bgColor,
              body: Column(
                children: [
                  const AbyadBar(),
                  //! Content
                  Expanded(
                    child: navigationController.currentScreen,
                  ),
                  //! Nav Bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    height: 75,
                    color: white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                        navigationController.screens.length,
                        (index) => Expanded(
                          child: InkWell(
                            onTap: () {
                              navigationController.navigateTo(
                                navigationController.screens[index],
                                index: index,
                              );
                            },
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    Assets.iconify(
                                        navigationController.icons[index]),
                                    height: 30,
                                    width: 30,
                                    fit: BoxFit.contain,
                                    color: navigationController.currentIndex ==
                                            index
                                        ? mainColor
                                        : grey,
                                  ),
                                  Text(
                                    navigationController.labels[index],
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          navigationController.currentIndex ==
                                                  index
                                              ? mainColor
                                              : grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
