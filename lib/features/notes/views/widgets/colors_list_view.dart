import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/utils/colors.dart';
import 'package:todo_app/core/utils/size.dart';
import 'package:todo_app/features/notes/controllers/add_note_cubit/add_note_cubit.dart';
import 'color_item.dart';

class ColorsListView extends StatelessWidget {
  const ColorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteCubit, AddNoteState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<AddNoteCubit>(context);
        return SizedBox(
          height: height(context) * 0.1,
          child: ListView.builder(
            itemCount: AppColors.kColors.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: width(context) * 0.004),
                child: ColorItem(
                  onTap: () {
                    cubit.changeIndex(index: index);
                  },
                  color: AppColors.kColors[index],
                  isActive: cubit.currentIndex == index,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
