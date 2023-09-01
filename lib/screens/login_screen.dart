import 'package:chat/component/button.dart';
import 'package:chat/component/textForm.dart';
import 'package:chat/cubit/chat/chat_cubit.dart';
import 'package:chat/cubit/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../const/const.dart';

class Login extends StatelessWidget {
  Login({super.key});

  GlobalKey<FormState> formKey = GlobalKey();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          BlocProvider.of<ChatCubit>(context).getMessage();
          Navigator.pushNamed(context, "chatPage",
              arguments: emailController.text);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                backgroundColor: Colors.green,
                content: Text("Login successful")),
          );
          isLoading = false;
        } else if (state is LoginError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red, content: Text(state.errorMessage),
          ),
          );
          isLoading = false;
        }
      },
      builder:(context,state)=> ModalProgressHUD(
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
                              "LOGIN",
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
                                BlocProvider.of<LoginCubit>(context).loginUser(
                                    email: emailController.text,
                                    password: passwordController.text);
                              }
                            },
                            name: "Login"),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don\'t have an account ?",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "RegisterPage");
                              },
                              child: const Text(
                                '  Register Now',
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
      ),
    );
  }
}
