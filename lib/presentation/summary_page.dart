import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportstasks/application/controller.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ct) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Match Highlights"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Handles back navigation
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              _buildSectionTitle("India's Innings 🇮🇳"),
              ..._buildNewsCards(ct.dataModal?.notes?.l1),
              _buildSectionTitle("New Zealand's Innings 🇳🇿"),
              ..._buildNewsCards(ct.dataModal?.notes?.l2),
            ],
          ),
        ),
      );
    });
  }
}

Widget _buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Text(
      title,
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange),
    ),
  );
}

List<Widget> _buildNewsCards(List<String>? news) {
  return news!
      .map(
        (update) => Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListTile(
            leading: Icon(Icons.sports_cricket, color: Colors.blue),
            title: Text(update, style: TextStyle(fontSize: 16)),
          ),
        ),
      )
      .toList();
}
