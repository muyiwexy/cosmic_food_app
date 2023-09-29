import 'package:cosmic_food_app/core/utils/colors.dart';
import 'package:cosmic_food_app/features/cosmic_food/common/presentation/provider/common_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/build_body.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    CommonProvider commonProvider = context.watch<CommonProvider>();
    return Scaffold(
      backgroundColor: AppColors.primary02,
      drawer: const Drawer(),
      appBar: _buildAppBar(),
      body: BuildBody(
        size: size,
        commonProvider: commonProvider,
        searchController: searchController,
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.primary02,
      leading: _buildLeading(),
      leadingWidth: 100,
      title: const Text("Home",
          style: TextStyle(
            fontSize: 25,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.normal,
            color: AppColors.secondary01,
          )),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_outlined,
              size: 30,
              color: AppColors.secondary01,
            )),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: CircleAvatar(),
        )
      ],
    );
  }

  Builder _buildLeading() {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: AppColors.appBarContainercolor,
            border: Border.all(width: 3.0, color: AppColors.secondary01),
            borderRadius: BorderRadius.circular(20),
          ),
          child: IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(
              Icons.account_tree_outlined,
              size: 40,
              color: AppColors.appBarIconcolor,
            ),
          ),
        ),
      );
    });
  }
}
