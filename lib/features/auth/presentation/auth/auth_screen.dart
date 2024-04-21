import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:global_test_project/config/app_router.dart';
import 'package:global_test_project/core/constant/theme_colors.dart';
import 'package:global_test_project/core/constant/theme_text_style.dart';
import 'package:global_test_project/core/core_bloc/core_blocs.dart';
import 'package:global_test_project/features/auth/presentation/auth/auth_bloc/auth_bloc.dart';
import 'package:global_test_project/features/auth/presentation/widgets/custom_circlar_indicator.dart';
import 'package:global_test_project/features/auth/presentation/widgets/custom_scaffold.dart';
import 'package:global_test_project/features/auth/presentation/widgets/custom_text_button.dart';
import 'package:global_test_project/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:email_validator/email_validator.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController loginTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    loginTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (BuildContext context, AuthState state) {
          if (state is AuthLoaded) {
            AutoRouter.of(context).replace(const MainRoute());
          } else if (state is AuthError) {
            showCupertinoDialog(
              context: context,
              builder: (context) => CupertinoAlertDialog(
                title: Text("Attention",
                    style: ThemeTextBrandonGrotesqueBold.commonSize.copyWith(
                      fontSize: 16,
                      color: ThemeColors.black,
                    )),
                content: Text(
                  state.errorText,
                  style: ThemeTextBrandonGrotesqueRegular.commonSize.copyWith(
                    fontSize: 14,
                    color: ThemeColors.black,
                  ),
                ),
                actions: [
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: const Text('Close'),
                    onPressed: () {
                      AutoRouter.of(context).pop();
                    },
                  )
                ],
              ),
            );
          }
        },
        builder: (context, state) {
          bool isLoading = false;
          if (state is AuthLoading) {
            isLoading = true;
          } else {
            isLoading = false;
          }
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 70),
                      Text(
                        "Welcome back !",
                        style: ThemeTextBrandonGrotesqueBold.commonSize.copyWith(
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomTextField(
                              controller: loginTextController,
                              hintText: "Enter valid email",
                              label: "Email",
                              validator: (value) {
                                if (value != null && !EmailValidator.validate(value)) {
                                  return "Enter valid email";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              controller: passwordTextController,
                              hintText: "Enter password",
                              label: "Password",
                              isObscure: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter valid password";
                                } else if (value.length < 8) {
                                  return "Password length lower 8 digits";
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        value: isChecked,
                                        onChanged: null,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        "Remember me",
                                        style: ThemeTextBrandonGrotesqueRegular.commonSize.copyWith(height: 2.1),
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: ThemeColors.primaryColor,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      "Forgotten Password?",
                                      style: ThemeTextBrandonGrotesqueRegular.commonSize.copyWith(
                                        color: ThemeColors.primaryColor,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextButton(
                              btnText: "Login",
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  CoreBlocs.auth.add(AuthLoginEvent(
                                    password: passwordTextController.text.replaceAll(" ", ""),
                                    login: loginTextController.text.replaceAll(" ", ""),
                                  ));
                                }
                              },
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t have an account?",
                            style: ThemeTextBrandonGrotesqueRegular.commonSize.copyWith(
                              color: ThemeColors.textGray,
                            ),
                          ),
                          const SizedBox(width: 3),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Create one",
                              style: ThemeTextBrandonGrotesqueBold.commonSize.copyWith(
                                color: ThemeColors.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              if (isLoading) ...[
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: CustomCirclarIndicator(),
                    ),
                  ),
                ),
              ]
            ],
          );
        },
      ),
    );
  }
}
