import 'package:cosmic_food_app/core/utils/colors.dart';
import 'package:cosmic_food_app/features/cosmic_food/authentication/domain/entities/user_reg_cosmic_food.dart';
import 'package:cosmic_food_app/features/cosmic_food/home/presentation/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final Users users;
  Homepage({super.key, required this.users});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primary02,
      drawer: const Drawer(),
      appBar: AppBar(
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
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SizedBox(
                height: 90,
                width: size.width,
                child: Stack(
                  children: [
                    Text(
                      "Welcome, ${users.name}",
                      style: const TextStyle(
                        fontSize: 30,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.01,
                      ),
                    ),
                    const Positioned(
                        bottom: 0,
                        left: 0,
                        child: Text(
                          "Satisfy your belly to the maximum ",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.01,
                          ),
                        ))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: SizedBox(
                height: 60,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 3.0,
                          color: AppColors.secondary01,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.primary02,
                      ),
                    ),
                    SizedBox(
                      height: 55,
                      width: double.infinity,
                      child: SearchText(
                        size: size,
                        textEditingController: searchController,
                        fillColor: AppColors.primary02,
                        isFilled: true,
                        fontSize: 20,
                        hintText: "Search Vendor",
                        textColors: AppColors.secondary01,
                        textFieldBorderColors: AppColors.secondary01,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
