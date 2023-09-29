import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../common/presentation/widgets/search_text_field.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
    required this.size,
    required this.searchController,
  });

  final Size size;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
