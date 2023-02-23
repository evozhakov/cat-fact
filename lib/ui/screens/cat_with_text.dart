import 'package:cats_fact/blocs/bloc_service/service_bloc.dart';
import 'package:cats_fact/constants/app_assets.dart';
import 'package:cats_fact/repository/repository_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

final key = GlobalKey<FormState>();

class CatWithText extends StatelessWidget {
  const CatWithText({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final apiCataasWork =
        context.select((ServiceBloc bloc) => bloc.state.apiCataasWork);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const FaIcon(
          FontAwesomeIcons.cat,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
        child: apiCataasWork
            ? Form(
                key: key,
                child: Column(
                  children: [
                    const Text(
                      'Will return a random cat saying :',
                      style: TextStyle(fontSize: 20),
                    ), //to local
                    const SizedBox(height: 10),
                    TextFormField(
                      validator: (value) {
                        final regExp =
                            RegExp(r'[\^$*.\[\]{}()?\-"!@#%&/\,><:;_~`+='
                                "'"
                                ']');

                        if (value!.isEmpty) {
                          return 'Please add text'; //to local
                        } else if (value.contains(regExp)) {
                          return "Don't use ^ * . [ ] { } ( ) ? - ! @ # % & / , > < : ; | _ ~ ` + =";
                        }
                        return '';
                      },
                      controller: controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(99.0)),
                        ),
                      ),
                    ),
                    // const Spacer(),
                    // Lottie.asset(AppAssets.fatCatWantsToChat),
                    const Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(99),
                        ),
                        fixedSize: Size(MediaQuery.of(context).size.width, 60),
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () => factRepository.createImageWithText(
                          context, controller, key),
                      child: const Text(
                        'Create image',
                        style: TextStyle(fontSize: 17),
                      ), //to local
                    )
                  ],
                ),
              )
            : Center(
                child: Lottie.asset(AppAssets.sleeping),
              ),
      ),
    );
  }
}
