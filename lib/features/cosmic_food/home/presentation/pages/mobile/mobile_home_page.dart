import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../common/presentation/provider/common_provider.dart';
import '../../../../common/presentation/widgets/text_types.dart';
import '../../widgets/build_body.dart';

class MobileHomePage extends StatelessWidget {
  MobileHomePage({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    UsersProvider usersProvider = context.watch<UsersProvider>();
    return Scaffold(
      backgroundColor: AppColors.primary02,
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/welcome/amirali-mirhashemian-sc5sTPMrVfk-unsplash.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Positioned(
                    bottom: 10,
                    left: 10,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                        "assets/images/welcome/amirali-mirhashemian-sc5sTPMrVfk-unsplash.jpg",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                color: AppColors.primary01,
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {},
                      hoverColor: AppColors.secondary01.withOpacity(0.9),
                      leading: const Icon(
                        Icons.home_filled,
                        color: AppColors.secondary01,
                      ),
                      title: const TextHeader(
                        text: "Home",
                        color: AppColors.secondary01,
                        fontsize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Divider(
                      color: Colors.transparent,
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.book_online_outlined,
                        color: AppColors.secondary01,
                      ),
                      title: TextHeader(
                        text: "Orders",
                        color: AppColors.secondary01,
                        fontsize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Divider(
                      color: Colors.transparent,
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.account_tree_outlined,
                        color: AppColors.secondary01,
                      ),
                      title: TextHeader(
                        text: "Account",
                        color: AppColors.secondary01,
                        fontsize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Divider(
                      color: Colors.transparent,
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.settings,
                        color: AppColors.secondary01,
                      ),
                      title: TextHeader(
                        text: "Home",
                        color: AppColors.secondary01,
                        fontsize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      appBar: _buildAppBar(),
      body: BuildBody(
        size: size,
        usersProvider: usersProvider,
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
          child: CircleAvatar(
            backgroundImage: AssetImage(
              "assets/images/welcome/amirali-mirhashemian-sc5sTPMrVfk-unsplash.jpg",
            ),
          ),
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
