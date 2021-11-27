// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freelance_world_flutter/components/postulation_card.dart';
import 'package:freelance_world_flutter/models/postulation.dart';
import 'package:freelance_world_flutter/shared/http_interceptor.dart';
import 'package:freelance_world_flutter/shared/side_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:freelance_world_flutter/theme/constants.dart';

class MyPostulationPage extends StatefulWidget {
  @override
  _MyPostulationPageState createState() => _MyPostulationPageState();
}

class _MyPostulationPageState extends State<MyPostulationPage> {
  late final List<Postulation> postulations;

  List<Postulation> parsePostulations(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed
        .map<Postulation>((json) => Postulation.fromJson(json))
        .toList();
  }

  Future<List<Postulation>> getPostulations() async {
    var httpClient = AuthenticatedHttpClient();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int freelancerId = int.parse(prefs.getString('id')!);
    final response = await httpClient.get(
      Uri.parse(
          "https://freelance-world.herokuapp.com/api/freelancers/$freelancerId/postulations"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return parsePostulations(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load postulations');
    }
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FreelanceWorld'),
        actions: [],
        backgroundColor: primaryColor,
      ),
      drawer: MenuPage(),
      body: FutureBuilder<List<Postulation>>(
        future: getPostulations(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? PostulationList(
                  postulations: snapshot.data ?? [],
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class PostulationList extends StatelessWidget {
  final List<Postulation> postulations;
  const PostulationList({required this.postulations});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: postulations == null ? 0 : postulations.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: PostulationCard(
                      postulation: postulations[i],
                    ),
                  )),
            )
          ],
        );
      },
    );
  }
}
