import 'package:flokitune/src/blocs/bloc_auth/auth_bloc.dart';
import 'package:flokitune/src/constants/app_assets.dart';
import 'package:flokitune/src/constants/app_strings.dart';
import 'package:flokitune/src/ui/background/onboarding_background.dart';
import 'package:flokitune/src/ui/general_scaffold.dart';
import 'package:flokitune/src/ui/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return Scaffold(
      body: BlocProvider<AuthBloc>(
        create: (_) => AuthBloc(context),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Stack(
              children: [
                const OnboardingBackground(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 327.w,
                        height: 76.h,
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 32.sp,
                              fontFamily: AppAssets.fontJakarta,
                              fontWeight: FontWeight.w800,
                            ),
                            text: state.localizations.how,
                            children: [
                              const TextSpan(
                                style: TextStyle(),
                                text: AppStrings.floki,
                              ),
                              TextSpan(
                                text: state.localizations.work,
                              ),
                            ],
                          ),
                        ),
                      ),
                      9.95.verticalSpace,
                      SizedBox(
                        height: 72.h,
                        child: PageView(
                          controller: controller,
                          onPageChanged: (page) =>
                              BlocProvider.of<AuthBloc>(context).add(
                            ChangePage(page: page),
                          ),
                          children: [
                            _lorem(),
                            _lorem(),
                            _lorem(),
                          ],
                        ),
                      ),
                      16.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _iconPage(state, 1),
                          5.horizontalSpace,
                          _iconPage(state, 2),
                          5.horizontalSpace,
                          _iconPage(state, 3),
                        ],
                      ),
                      35.05.verticalSpace,
                      CustomElevatedButton(
                        text: state.localizations.wath,
                        onTap: () {},
                      ),
                      19.95.verticalSpace,
                      TextButton(
                        onPressed: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: ((context) => const GeneralScaffold()),
                          ),
                        ),
                        child: Text(
                          state.localizations.skip,
                          style: TextStyle(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 16.sp,
                            fontFamily: AppAssets.fontJakarta,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _lorem() {
    return Text(
      AppStrings.lorem,
      style: TextStyle(
        color: const Color.fromRGBO(150, 154, 160, 1),
        fontSize: 14.sp,
        fontFamily: AppAssets.fontPoppisns,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _iconPage(AuthState state, int page) {
    return SizedBox.square(
      dimension: state.page == page ? 8.29.h : 5.h,
      child: Icon(
        Icons.circle,
        color: state.page == page
            ? const Color.fromRGBO(172, 36, 192, 1)
            : const Color.fromRGBO(255, 255, 255, 1),
        size: state.page == page ? 8.29 : 5.h,
      ),
    );
  }
}
