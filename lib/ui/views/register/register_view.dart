import 'package:flutter/material.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:transitspot/ui/views/register/register_view.form.dart';
import 'package:transitspot/ui/views/register/register_viewmodel.dart';
import 'package:transitspot/utils/app_color.dart';
import 'package:transitspot/utils/app_text.dart';
import 'package:stacked/stacked.dart';

@FormView(fields: [
  FormTextField(name: "name"),
  FormTextField(name: "email"),
  FormTextField(name: "password", isPassword: true),
])
class RegisterView extends StatelessWidget with $RegisterView {
  RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      onModelReady: (viewModel) => listenToFormUpdated(viewModel),
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.primaryBackground,
        body: SingleChildScrollView(
          child: Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: double.maxFinite,
              color: AppColors.secondaryBackground,
            ),
            Column(
              children: [
                Image.asset('lib/assets/images/hero-register.png'),
                const SizedBox(height: 20),
                Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.primaryBackground,
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width / 10 * 8,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  model.setIsSignUp(true);
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AppText(
                                      color: Colors.black,
                                      text: "Sign Up",
                                      size: 22.5,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 5,
                                      color: model.isSignUp
                                          ? AppColors.secondaryBackground
                                          : Colors.transparent,
                                      width: 30,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                model.setIsSignUp(false);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AppText(
                                      color: Colors.black,
                                      text: "Sign In",
                                      size: 22.5,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 5,
                                      color: !model.isSignUp
                                          ? AppColors.secondaryBackground
                                          : Colors.transparent,
                                      width: 30,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        Container(
                          child: model.isSignUp
                              ? SignUpForm(model)
                              : SignInForm(model),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                            onPressed: () {},
                            elevation: 5,
                            padding: EdgeInsets.all(20),
                            child: Text("Submit"),
                            color: AppColors.secondaryBackground,
                            minWidth: double.infinity,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
      viewModelBuilder: () => RegisterViewModel(),
    );
  }

  Padding SignUpForm(RegisterViewModel model) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextInput(
            nameController: nameController,
            nameFocusNode: nameFocusNode,
            nameField: "Full Name",
            hint: "Full Name",
          ),
          TextInput(
            nameController: emailController,
            nameFocusNode: emailFocusNode,
            nameField: "Email",
            hint: "example@email.com",
          ),
          TextInput(
            nameController: passwordController,
            nameFocusNode: passwordFocusNode,
            nameField: "Password",
            hint: "*********",
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LabelText(text: "Register as"),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Material(
            elevation: 5,
            color: AppColors.secondaryBackground,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  alignment: AlignmentDirectional.center,
                  items: RegisterAsValueToTitleMap.entries
                      .map((entry) => DropdownMenuItem(
                            value: entry.key,
                            child: Center(
                              child: Text(
                                entry.value,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                  value: model.registerAsValue,
                  hint: const Text("Driver"),
                  dropdownColor: AppColors.secondaryBackground,
                  isExpanded: true,
                  onChanged: (picked) => model.setRegisterAs(picked.toString()),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding SignInForm(RegisterViewModel model) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextInput(
            nameController: emailController,
            nameFocusNode: emailFocusNode,
            nameField: "Email",
            hint: "example@email.com",
          ),
          TextInput(
            nameController: passwordController,
            nameFocusNode: passwordFocusNode,
            nameField: "Password",
            hint: "*********",
          ),
        ],
      ),
    );
  }
}
