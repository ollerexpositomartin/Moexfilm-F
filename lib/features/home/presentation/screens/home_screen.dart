import 'package:flutter/material.dart';
import 'package:moexfilm/config/app_color.dart';
import 'package:moexfilm/core/widgets/profile_button.dart';
import 'package:moexfilm/features/home/presentation/widgets/custom_bottomSheet.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String path = "/";
  static const String name = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [ButtonProfile()],
                  ),
                ],
              )),
          CustomBottomSheet(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(),
              ),
              bottomNavigationBar: const BottomBarSalomon(
                items: [
                  TabItem(icon: Icons.tv, title: "Series"),
                  TabItem(icon: Icons.movie, title: "Peliculas"),
                  TabItem(icon: Icons.search, title: "Buscar"),
                ],
                backgroundColor: AppColors.BACKGROUND_COLOR,
                color: AppColors.NO_SELECTED_COLOR,
                colorSelected: AppColors.ACCENT_COLOR,
                indexSelected: 0,
                backgroundSelected: AppColors.BACKGROUND_CHIP_COLOR,
              )),
        ],
      )),
    );
  }
}
