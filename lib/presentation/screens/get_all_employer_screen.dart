import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:workshop/data/model/employer_model.dart';

class GetAllEmployerScreen extends StatelessWidget {
  const GetAllEmployerScreen({Key? key}) : super(key: key);

  Future<List<EmployerModel>> getAllEmployer() async {
    try {
      http.Response res = await http.get(
        Uri.parse('http://92.204.185.4:9889/employer/'),
      );

      if (res.statusCode == 200) {
        List rawEmployers = jsonDecode(res.body)["results"]; //

        List<EmployerModel> employers =
            rawEmployers.map((e) => EmployerModel.fromJson(e)).toList();

        return employers;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get All Employers"),
      ),
      body: FutureBuilder(
        future: getAllEmployer(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Expanded(
                    child: Text(
                      snapshot.data![index].employerId.toString(),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      snapshot.data![index].organizationName.toString(),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      snapshot.data![index].emailAddress.toString(),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
