// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'get_all_employer_screen.dart';

class AddNewEmployerScreen extends StatefulWidget {
  const AddNewEmployerScreen({Key? key}) : super(key: key);

  @override
  State<AddNewEmployerScreen> createState() => _AddNewEmployerScreenState();
}

class _AddNewEmployerScreenState extends State<AddNewEmployerScreen> {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  final TextEditingController idTextEditingController = TextEditingController();

  final TextEditingController organizationNameTextEditingController =
      TextEditingController();

  final TextEditingController emailTextEditingController =
      TextEditingController();

  Future<bool> addNewEmployer() async {
    try {
      http.Response res = await http.post(
        Uri.parse('http://92.204.185.4:9889/employer/'),
        body: {
          "employer_id": idTextEditingController.text.trim(),
          "organization_name":
              organizationNameTextEditingController.text.trim(),
          "email_address": emailTextEditingController.text.trim(),
        },
      );

      if (res.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Employer"),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: idTextEditingController,
              decoration: const InputDecoration(labelText: "Id"),
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Please enter valid id";
                }
                return null;
              },
            ),
            TextFormField(
              controller: organizationNameTextEditingController,
              decoration: const InputDecoration(labelText: "Organization Name"),
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Please enter valid Organization Name";
                }
                return null;
              },
            ),
            TextFormField(
              controller: emailTextEditingController,
              decoration: const InputDecoration(labelText: "Email"),
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Please enter valid Email";
                }
                return null;
              },
            ),
            isLoading
                ? const CircularProgressIndicator()
                : TextButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        bool res = await addNewEmployer();

                        if (res) {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      GetAllEmployerScreen()));
                        } else {
                          setState(() {
                            isLoading = false;
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Try Again")));
                        }
                      }
                    },
                    child: const Text(
                      "Add",
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
