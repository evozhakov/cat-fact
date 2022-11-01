import 'package:flokitune/src/blocs/bloc_auth/auth_bloc.dart';
import 'package:flokitune/src/constants/app_assets.dart';
import 'package:flokitune/src/constants/country.dart';
import 'package:flokitune/src/theme_styles/text_styles.dart';
import 'package:flokitune/src/ui/widgets/listview_countries_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountriesListBottomSheet extends StatelessWidget {
  final BuildContext sheetContext;
  final ValueChanged<Country> onCountryChanged;
  const CountriesListBottomSheet({
    required this.sheetContext,
    required this.onCountryChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => AuthBloc(context),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(top: 10, left: 24.w, right: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.localizations.searhByCountry,
                  style: TextStyles.style1,
                ),
                TextField(
                  decoration: InputDecoration(
                    suffixIcon: SvgPicture.asset(
                      AppAssets.search,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  textInputAction: TextInputAction.search,
                  onChanged: (value) {
                    BlocProvider.of<AuthBloc>(context).add(
                      SearchCountryEvent(value: value),
                    );
                  },
                ),
                ListViewCountriesBottomSheet(
                  state: state,
                  sheetContext: sheetContext,
                  onCountryChanged: onCountryChanged,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
