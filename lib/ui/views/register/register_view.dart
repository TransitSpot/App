import 'package:flutter/material.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:transitspot/ui/views/register/register_view.form.dart';
import 'package:transitspot/ui/views/register/register_viewmodel.dart';
import 'package:transitspot/utils/app_color.dart';
import 'package:transitspot/utils/app_text.dart';
import 'package:stacked/stacked.dart';

@FormView(fields: [
  FormTextField(name: "name", isPassword: false),
  FormTextField(name: "email", isPassword: false),
  FormTextField(name: "password", isPassword: true),
  FormDropdownField(
    name: 'registerAs',
    items: [
      StaticDropdownItem(
        title: 'Driver',
        value: 'driver',
      ),
      StaticDropdownItem(
        title: 'Customer',
        value: 'customer',
      ),
    ],
  )
])
class RegisterView extends StatelessWidget with $RegisterView {
  RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      onModelReady: (viewModel) => listenToFormUpdated(viewModel),
      builder: (context, model, child) => Scaffold(
        backgroundColor: AppColors.primaryBackground,
        drawer: Drawer(),
        body: Stack(children: [
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AppText(
                                  color: Colors.black,
                                  text: "Test",
                                  size: 22.5,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 5,
                                  color: AppColors.secondaryBackground,
                                  width: 30,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AppText(
                                  color: Colors.black,
                                  text: "Test",
                                  size: 22.5,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 5,
                                  color: AppColors.secondaryBackground,
                                  width: 30,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
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
                      const LabelText(text: "Register as"),
                    ],
                  ),
                ),
              )
            ],
          )
        ]),
      ),
      viewModelBuilder: () => RegisterViewModel(),
    );
  }
}

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    required this.nameController,
    required this.nameFocusNode,
    required this.nameField,
    required this.hint,
  }) : super(key: key);

  final TextEditingController nameController;
  final FocusNode nameFocusNode;
  final String nameField;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelText(text: nameField),
          const SizedBox(
            height: 10,
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: hint,
            ),
            style: const TextStyle(fontSize: 15.0, color: Colors.black),
            controller: nameController,
            focusNode: nameFocusNode,
          ),
        ],
      ),
    );
  }
}

class LabelText extends StatelessWidget {
  const LabelText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
    );
  }
}
