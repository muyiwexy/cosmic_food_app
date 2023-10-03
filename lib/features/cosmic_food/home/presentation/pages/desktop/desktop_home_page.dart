import 'package:cosmic_food_app/core/utils/colors.dart';
import 'package:cosmic_food_app/features/cosmic_food/common/presentation/widgets/text_types.dart';
import 'package:flutter/material.dart';

class DesktopHomePage extends StatelessWidget {
  const DesktopHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
        title: const TextHeader(
            text: "Home",
            color: AppColors.secondary01,
            fontsize: 25,
            fontWeight: FontWeight.w900),
        actions: [
          TextButton(
              onPressed: () {},
              child: const TextHeader(
                  text: "Orders",
                  color: Colors.black,
                  fontsize: 20,
                  fontWeight: FontWeight.w500)),
          TextButton(
              onPressed: () {},
              child: const TextHeader(
                  text: "Profile",
                  color: Colors.black,
                  fontsize: 20,
                  fontWeight: FontWeight.w500)),
          TextButton(
              onPressed: () {},
              child: const TextHeader(
                  text: "Settings",
                  color: Colors.black,
                  fontsize: 20,
                  fontWeight: FontWeight.w500)),
          Stack(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none_outlined,
                    size: 30,
                    color: AppColors.secondary01,
                  )),
              Positioned(
                right: 0,
                top: 5,
                child: ClipOval(
                  child: Container(
                    height: 15,
                    width: 15,
                    color: Colors.red,
                    child: const FittedBox(child: Text("2")),
                  ),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: CircleAvatar(),
          )
        ],
      ),
    );
  }
}
