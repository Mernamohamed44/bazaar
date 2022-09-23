import 'package:bazzar/cubit/cubit.dart';
import 'package:bazzar/modules/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/state.dart';
import '../style/themes.dart';
import '../shared/component/component.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BazaarCubit(context),
      child: BlocConsumer<BazaarCubit, BazaarStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
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
                          style: CommonMethod().themeData.textTheme.bodyText2),
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Sign UP',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              buildTextField(cubit.nameController, 'Full Name',
                                  Icons.person_outline),
                              const SizedBox(
                                height: 10,
                              ),
                              buildTextField(cubit.emailController,
                                  'Email Address', Icons.email_outlined),
                              const SizedBox(
                                height: 10,
                              ),
                              buildTextField(cubit.phoneController,
                                  'Phone Number', Icons.phone_outlined),
                              const SizedBox(
                                height: 10,
                              ),
                              buildTextField(cubit.passwordController,
                                  'Password', Icons.lock,
                                  isPass: cubit.isPassword,
                                  suffix: cubit.suffix, onpress: () {
                                cubit.changePasswordVisibility;
                              })
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                     cubit.isLoading?CircularProgressIndicator():
                     buildButton('Sign up', Colors.white, null, () {
                       if (cubit.formkey.currentState!.validate()) {
                         cubit.loading();
                         cubit.signUp(context);
                       }
                     }, 40.0, 300.0),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
