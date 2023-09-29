import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../common/presentation/provider/common_provider.dart';
import '../../../common/presentation/widgets/text_types.dart';
import 'search_box.dart';

class BuildBody extends StatelessWidget {
  const BuildBody({
    super.key,
    required this.size,
    required this.commonProvider,
    required this.searchController,
  });

  final Size size;
  final CommonProvider commonProvider;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  TextHeader(
                      text: "Welcome, ${commonProvider.users!.name}",
                      color: AppColors.secondary01,
                      fontsize: 28,
                      fontWeight: FontWeight.w900),
                  const Positioned(
                    bottom: 0,
                    left: 0,
                    child: TextHeader(
                        text: "Satisfy your belly to the maximum",
                        color: AppColors.secondary01,
                        fontsize: 20,
                        fontWeight: FontWeight.w900),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: SearchBox(size: size, searchController: searchController),
          ),
        ],
      ),
    );
  }
}
