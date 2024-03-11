import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice_0702/presentation/bloc/email_bloc.dart';
import 'package:flutter_practice_0702/presentation/widgets/custom_text.dart';
import 'package:flutter_practice_0702/presentation/widgets/custom_text_field.dart';

class HomePage extends StatelessWidget {
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerLastname = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerMassage = TextEditingController();

  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmailBloc(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      controller: controllerName,
                      hintText: "Name",
                      label: "First name",
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    child: CustomTextField(
                      controller: controllerLastname,
                      hintText: "Lastname",
                      label: "Last name",
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextField(
                controller: controllerEmail,
                hintText: "yourmail@gmail.com",
                label: "E-mail",
                suffix: const Icon(Icons.email),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextField(
                controller: controllerPhone,
                hintText: "(555) 000-0000",
                label: "Phone",
                suffix: const Icon(Icons.call),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextField(
                controller: controllerMassage,
                hintText: "Your message",
                label: "Message",
                maxLines: 6,
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 270,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffE12828),
                  ),
                  onPressed: () {
                    BlocProvider.of<EmailBloc>(context).add(SendEvent(
                      name: controllerName.text,
                      message: controllerMassage.text,
                      phone: controllerPhone.text,
                      toEmail: controllerEmail.text,
                      firstName: controllerName.text,
                      lastName: controllerLastname.text,
                    ));

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return BlocBuilder<EmailBloc, EmailState>(
                          builder: (context, state) {
                            if (state is EmailLoading) {
                              return 
                                const Center(child: CircularProgressIndicator());
                              
                            } else if (state is EmailSuccess) {
                              return const AlertDialog(
                                content: Text("Email sent successfully!"),
                              );
                            } else if (state is EmailError) {
                              return AlertDialog(
                                content: Text("Error: ${state.errorMessage}"),
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          },
                        );
                      },
                    );
                  },
                  child: const Text(
                    "Enter",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
