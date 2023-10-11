import 'package:arch_image/views/pages/Home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_routes.dart';
import '../../../../core/ys_localizations/ys_localizations_provider.dart';
import '../../../../providers/login_provider.dart';
import '../../../widgets/main_button.dart';
import '../../../widgets/main_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: Builder(
        builder: (context) {
          final  loginProvider= Provider.of<LoginProvider>(context);  //instance from provider
          return Scaffold(
            body: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                MainTextField(
                  controller: loginProvider.email,

                ),
                MainTextField(
                  controller: loginProvider.password,
                ),
                MainButton(
                  onPressed: () async {
                    bool succese= await loginProvider.login;
                    if(succese)
                      {
                        AppRoutes.routeRemoveAllTo(context, Home());
                      }
                  },
                  child:Text("login"),),
              ],
            ),
          );
        }
      ),
    );
  }
}
