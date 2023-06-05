import 'package:flutter/material.dart';
import 'package:workshop/presentation/screens/add_employer_screen.dart';
import 'package:workshop/presentation/screens/get_all_employer_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Workshop"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddNewEmployerScreen()));
              },
              child: const Text(
                "Add New Employer",
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>GetAllEmployerScreen()));

              },
              child: const Text(
                "Get All Employer",
              ),
            )
          ],
        ),
      ),
    );
  }
}
