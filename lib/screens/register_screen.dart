import 'package:chat/component/button.dart';
import 'package:chat/component/textForm.dart';
import 'package:chat/cubit/register/register_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../const/const.dart';

class Register extends StatelessWidget {
  Register({super.key});

  GlobalKey<FormState> formKey = GlobalKey();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          Navigator.pushNamed(context, "chatPage",
              arguments: emailController.text);
          isLoading = false;
        } else if (state is RegisterError) {
          isLoading = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.errorMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Form(
            key: formKey,
            child: Scaffold(
              backgroundColor: primaryColor,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        children: [
                          const Spacer(
                            flex: 2,
                          ),
                          Image.asset("assets/images/scholar.png"),
                          const Text(
                            "Scholar Chat",
                            style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                                fontFamily: "Pacifico"),
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "REGISTER",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          textFormField(
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "email must not be empty";
                                }
                                return null;
                              },
                              label: "Email",
                              icon: Icons.email),
                          const SizedBox(
                            height: 15,
                          ),
                          textFormField(
                              controller: passwordController,
                              type: TextInputType.visiblePassword,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "password must not be empty";
                                }
                                return null;
                              },
                              label: "Password",
                              icon: Icons.password),
                          const SizedBox(
                            height: 15,
                          ),
                          button(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<RegisterCubit>(context)
                                      .registerUser(
                                          email: emailController.text,
                                          password: passwordController.text);
                                }
                              },
                              name: "Sign Up"),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Have an account ?",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  '  Login Now',
                                  style: TextStyle(
                                    color: Color(0xffC7EDE6),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Spacer(
                            flex: 3,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
