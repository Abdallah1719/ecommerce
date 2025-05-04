import 'package:ecommerce_app/core/utils/resources/index.dart';
import 'package:ecommerce_app/core/utils/resources/size_config.dart';
import 'package:ecommerce_app/l10n/cubit/local_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: R.colors.white,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 18),
          child: GestureDetector(
            onTap: () => context.read<LocaleCubit>().toggleLocale(),

            child: Text(
              context.watch<LocaleCubit>().state == 'en'
                  ? 'العربية'
                  : 'English',
              style: TextStyle(
                color: R.colors.darkgreen,
                fontSize: R.fontSize.s18,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(SizeConfig.defaultSize! * 6);
}
