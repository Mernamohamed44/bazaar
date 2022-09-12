import 'package:bazzar/cubit/cubit.dart';
import 'package:bazzar/cubit/state.dart';
import 'package:bazzar/layout/home_layout.dart';
import 'package:bazzar/modules/signup_screen.dart';
import 'package:bazzar/style/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/component/component.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => BazaarCubit(context),
        child: BlocConsumer<BazaarCubit, BazaarStates>(
            listener: (context, state) {},
            builder: ((context, state) {
              var cubit = BazaarCubit.get(context);
              return Form(
                key: cubit.formkey,
                child: Scaffold(
                  backgroundColor: CommonMethod().themeData.primaryColor,
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('bazaar',
                            style:
                                CommonMethod().themeData.textTheme.bodyText2),
                        SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Sign In',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                buildTextField(cubit.emailController, 'e-mail',
                                    Icons.person_outline),
                                const SizedBox(
                                  height: 15,
                                ),
                                buildTextField(
                                    cubit.passwordController,
                                    'Password',
                                    Icons.lock,
                                    isPass: cubit.isPassword,
                                    suffix:  cubit.suffix,
                                    onpress: (){
                                      cubit.changePasswordVisibility;
                                    }),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        buildButton('Sign In', Colors.white, null, () {

                          if (cubit.formkey.currentState!.validate()) {
                           cubit.signIn();
                           navigateTo(context, const HomeLayout());
                          }
                        }, 40.0, 300.0),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Dont have account',
                                style: GoogleFonts.poppins(
                                    textStyle:
                                        const TextStyle(color: Colors.white))),
                            const SizedBox(
                              width: 7,
                            ),
                            InkWell(
                              child: Text('Sign Up',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          decoration:
                                              TextDecoration.underline))),
                              onTap: () {
                                navigateTo(context, SignUp());
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            })));
  }
}
