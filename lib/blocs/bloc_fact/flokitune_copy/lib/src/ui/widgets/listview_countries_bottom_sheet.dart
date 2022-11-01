import 'package:flokitune/src/blocs/bloc_auth/auth_bloc.dart';
import 'package:flokitune/src/constants/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewCountriesBottomSheet extends StatelessWidget {
  final BuildContext sheetContext;
  final AuthState state;
  final ValueChanged<Country> onCountryChanged;
  const ListViewCountriesBottomSheet({
    super.key,
    required this.state,
    required this.sheetContext,
    required this.onCountryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          thickness: 1.h,
        ),
        shrinkWrap: true,
        itemCount: state.countryList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              state.flagImagePath(state.countryList[index]),
              package: 'intl_phone_field',
              width: 32,
            ),
            title: Text(
              state.countryList[index].name,
            ),
            trailing: Text(
              '+${state.countryList[index].dialCode}',
            ),
            onTap: () {
              onCountryChanged(state.countryList[index]);
              Navigator.pop(sheetContext);
            },
          );
        },
      ),
    );
  }
}
