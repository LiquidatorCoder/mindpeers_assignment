import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PageNotFoundScreen extends StatelessWidget {
  final String routeName;

  const PageNotFoundScreen(this.routeName, {super.key});

  Future<String> getRandomImage() async {
    // Fetch dog image from 'https://dog.ceo/api/breeds/image/random'
    // and return the image url
    final response =
        await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));
    return jsonDecode(response.body)['message'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<String>(
              future: getRandomImage(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                      snapshot.data!,
                    ),
                    radius: 100,
                    backgroundColor: Colors.transparent,
                  );
                }
                return const CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.transparent,
                );
              },
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text(
                'Oops!\nPage not found!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
