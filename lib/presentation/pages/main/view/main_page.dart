import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:deepface_test/config/constants/app_colors.dart';
import 'package:deepface_test/config/constants/app_text_styles.dart';
import 'package:deepface_test/presentation/pages/database/manager/table_cubit/table_cubit.dart';
import 'package:deepface_test/presentation/pages/database/view/database_page.dart';
import 'package:deepface_test/presentation/pages/main/manager/main_cubit.dart';
import 'package:deepface_test/presentation/pages/video/view/video_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus!.unfocus();
          },
          child: Stack(
            children: [
              PageView(
                controller: context.read<MainCubit>().mainPageController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  VideoPage(),
                  DatabasePage(),
                ],
              ),
              Positioned(
                bottom: 10,
                child: BlocBuilder<MainCubit, MainState>(
                    builder: (context, state) {
                      return SizedBox(
                        width: 430.w,
                        child: CustomNavigationBar(
                          isFloating: true,
                          iconSize: 30.0,
                          strokeColor: Theme.of(context).primaryColor,
                          borderRadius: Radius.circular(15.r),
                          selectedColor: Theme.of(context).primaryColor,
                          unSelectedColor: AppColors.black,
                          backgroundColor: AppColors.primaryBlack,
                          items: [
                            CustomNavigationBarItem(
                              icon: Transform.scale(
                                  scale: 0.8,
                                  child: Icon(Icons.video_camera_back_outlined, color: AppColors.accentColor)),
                              selectedIcon: Transform.scale(
                                  scale: 1,
                                  child: Icon(Icons.video_camera_back_outlined, color: Theme.of(context).primaryColor)),
                            ),
                            CustomNavigationBarItem(
                              icon: Transform.scale(
                                  scale: 0.8,
                                  child: Icon(Icons.dataset, color: AppColors.accentColor)),
                              selectedIcon: Transform.scale(
                                  scale: 1,
                                  child: Icon(Icons.dataset, color: Theme.of(context).primaryColor)),
                            ),
                          ],
                          currentIndex: state.navbarIndex,
                          onTap: (index) {
                            context.read<MainCubit>().mainPageController.jumpToPage(index);
                            context.read<MainCubit>().changeNavBarIndex(index);
                          },
                        ),
                      );
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
