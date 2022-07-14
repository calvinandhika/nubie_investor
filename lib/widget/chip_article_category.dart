import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nubie_investor/cubit/article_category_cubit.dart';
import 'package:nubie_investor/theme.dart';

class ChipArticleCategory extends StatelessWidget {
  bool isSelected;
  final int id;
  final String title;

  ChipArticleCategory({
    Key? key,
    this.isSelected = false,
    required this.id,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ArticleCategoryCubit>().categorySelection(id);
      },
      child: BlocBuilder<ArticleCategoryCubit, int>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
            ),
            child: Chip(
              backgroundColor: (state == id) ? kBlueColor : kWhiteColor,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              side: BorderSide(
                width: 1,
                color: (state == id)
                    ? kBlueColor.withOpacity(0.5)
                    : kLightGreyColor.withOpacity(0.2),
              ),
              label: Text(
                title,
                style: body4TextStyle.copyWith(
                    color: (state == id) ? kWhiteColor : kBlackColor),
              ),
            ),
          );
        },
      ),
    );
  }
}
