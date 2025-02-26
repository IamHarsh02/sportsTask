import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sportstasks/application/controller.dart';
import 'package:sportstasks/common/constant.dart';
import 'package:sportstasks/domain/home_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ct) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Day 1 Cricket "),
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.menu), // Drawer Menu Icon
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Opens Drawer
                },
              );
            },
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text(
                  "Match Days",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text("Day 1"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text("Day 2"),
                onTap: () {
                  ct.fetchSecondScreenData();
                  Get.toNamed(Constant.secound_page);
                },
              ),
            ],
          ),
        ),
        body: ct.isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.sports_cricket,
                                      color: Colors.blue),
                                  SizedBox(width: 10),
                                  Text(
                                      "${ct.dataModal?.matchdetail?.match?.number} - ${ct.dataModal?.matchdetail?.match?.league}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text("India vs New Zeeland",
                                  style: TextStyle(fontSize: 16)),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(Constant.summary);
                                },
                                child: Text("Click Here For Highlights!",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(Icons.location_on, color: Colors.red),
                                  SizedBox(width: 5),
                                  Text(
                                      "Venue: ${ct.dataModal?.matchdetail?.venue?.name}"),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.calendar_today,
                                      color: Colors.green),
                                  SizedBox(width: 5),
                                  Text(
                                      "Date: ${ct.dataModal?.matchdetail?.match?.date} at ${ct.dataModal?.matchdetail?.match?.time}"),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.wb_sunny, color: Colors.orange),
                                  SizedBox(width: 5),
                                  Text(
                                      "Weather: ${ct.dataModal?.matchdetail?.weather}"),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(Icons.emoji_events, color: Colors.amber),
                                  SizedBox(width: 5),
                                  SizedBox(
                                    width: Get.width / 1.5,
                                    child: Text(
                                        "Result: ${ct.dataModal?.matchdetail?.result}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.person, color: Colors.purple),
                                  SizedBox(width: 5),
                                  Text(
                                      "Man of the Match: ${ct.dataModal?.matchdetail?.playerMatch}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                              TabBar(
                                controller: ct.tabController,
                                tabs: ct.dataModal!.innings!
                                    .map((inning) =>
                                        Tab(text: "Inning ${inning.number}"))
                                    .toList(),
                              ),
                              Expanded(
                                child: TabBarView(
                                  controller: ct.tabController,
                                  children:
                                      ct.dataModal!.innings!.map((inning) {
                                    return SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                "Batting Team: ${inning.battingteam}",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                                "Total: ${inning.total} / ${inning.wickets} wickets in ${inning.overs} Overs",
                                                style: TextStyle(fontSize: 16)),
                                            SizedBox(height: 10),
                                            Text("Batting",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: DataTable(
                                                columnSpacing: 20,
                                                columns: [
                                                  DataColumn(
                                                      label: Text("Batsman")),
                                                  DataColumn(
                                                      label: Text("Runs")),
                                                  DataColumn(
                                                      label: Text("Balls")),
                                                  DataColumn(label: Text("4s")),
                                                  DataColumn(label: Text("6s")),
                                                  DataColumn(label: Text("SR")),
                                                ],
                                                rows: List.generate(
                                                    inning.batsmen!.length,
                                                    (index) {
                                                  var batsman =
                                                      inning.batsmen![index];
                                                  return DataRow(cells: [
                                                    DataCell(IconButton(
                                                      icon: Icon(
                                                          Icons.remove_red_eye),
                                                      onPressed: () {
                                                        showModalBottomSheet(
                                                            context: context,
                                                            isScrollControlled:
                                                                true, // Allow full-screen scrollable sheet
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius.vertical(
                                                                      top: Radius
                                                                          .circular(
                                                                              20)),
                                                            ),
                                                            builder: (context) {
                                                              Players?
                                                                  playerData;
                                                              if (ct.tabController!
                                                                      .index ==
                                                                  0) {
                                                                playerData = ct
                                                                        .dataModal!
                                                                        .teams!
                                                                        .teamA!
                                                                        .players![
                                                                    batsman
                                                                        .batsman!];
                                                              } else {
                                                                playerData = ct
                                                                        .dataModal!
                                                                        .teams!
                                                                        .teamB!
                                                                        .players![
                                                                    batsman
                                                                        .batsman!];
                                                              }
                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Card(
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(15)),
                                                                    elevation:
                                                                        4,
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                              .all(
                                                                          16.0),
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                              playerData!.nameFull ?? "",
                                                                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                                                                          SizedBox(
                                                                              height: 5),
                                                                          Text(
                                                                              "Batting Style: ${playerData.batting?.style}"),
                                                                          Text(
                                                                              "Bowling Style: ${playerData.bowling?.style}"),
                                                                          if (playerData.iskeeper ==
                                                                              true)
                                                                            Text("🏏 WC",
                                                                                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          20),

                                                                  // Batting Stats
                                                                  Text(
                                                                      "Batting Stats",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.bold)),
                                                                  _buildStatBar(
                                                                      "Batting Average",
                                                                      double.parse(playerData
                                                                          .batting!
                                                                          .average!),
                                                                      100,
                                                                      Colors
                                                                          .green),
                                                                  _buildStatBar(
                                                                      "Strike Rate",
                                                                      double.parse(playerData
                                                                          .batting!
                                                                          .strikerate!),
                                                                      150,
                                                                      Colors
                                                                          .orange),
                                                                  _buildStatBar(
                                                                      "Total Runs",
                                                                      double.parse(playerData
                                                                          .batting!
                                                                          .runs!),
                                                                      10000,
                                                                      Colors
                                                                          .blue),

                                                                  SizedBox(
                                                                      height:
                                                                          20),

                                                                  // Bowling Stats
                                                                  Text(
                                                                      "Bowling Stats",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.bold)),
                                                                  _buildStatBar(
                                                                      "Bowling Average",
                                                                      double.parse(playerData
                                                                          .bowling!
                                                                          .average!),
                                                                      100,
                                                                      Colors
                                                                          .red),
                                                                  _buildStatBar(
                                                                      "Economy Rate",
                                                                      double.parse(playerData
                                                                          .bowling!
                                                                          .economyrate!),
                                                                      10,
                                                                      Colors
                                                                          .purple),
                                                                  _buildStatBar(
                                                                      "Wickets",
                                                                      double.parse(playerData
                                                                          .bowling!
                                                                          .wickets!),
                                                                      50,
                                                                      Colors
                                                                          .teal),
                                                                ],
                                                              );
                                                            });
                                                      },
                                                    )),
                                                    DataCell(
                                                        Text(batsman.runs!)),
                                                    DataCell(
                                                        Text(batsman.balls!)),
                                                    DataCell(
                                                        Text(batsman.fours!)),
                                                    DataCell(
                                                        Text(batsman.sixes!)),
                                                    DataCell(Text(
                                                        batsman.strikerate!)),
                                                  ]);
                                                }),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Text("Bowling",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: DataTable(
                                                columnSpacing: 20,
                                                columns: [
                                                  DataColumn(
                                                      label: Text("Bowler")),
                                                  DataColumn(
                                                      label: Text("Overs")),
                                                  DataColumn(
                                                      label: Text("Maidens")),
                                                  DataColumn(
                                                      label: Text("Runs")),
                                                  DataColumn(
                                                      label: Text("Wickets")),
                                                  DataColumn(
                                                      label: Text("Econ")),
                                                ],
                                                rows: List.generate(
                                                    inning.bowlers!.length,
                                                    (index) {
                                                  var bowler =
                                                      inning.bowlers![index];
                                                  return DataRow(cells: [
                                                    DataCell(IconButton(
                                                      icon: Icon(
                                                          Icons.remove_red_eye),
                                                      onPressed: () {
                                                        print(bowler.bowler);
                                                        showModalBottomSheet(
                                                            context: context,
                                                            isScrollControlled:
                                                                true, // Allow full-screen scrollable sheet
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius.vertical(
                                                                      top: Radius
                                                                          .circular(
                                                                              20)),
                                                            ),
                                                            builder: (context) {
                                                              Players?
                                                                  playerData;
                                                              if (ct.tabController!
                                                                      .index ==
                                                                  0) {
                                                                playerData = ct
                                                                        .dataModal!
                                                                        .teams!
                                                                        .teamB!
                                                                        .players![
                                                                    bowler
                                                                        .bowler!];
                                                              } else {
                                                                playerData = ct
                                                                        .dataModal!
                                                                        .teams!
                                                                        .teamA!
                                                                        .players![
                                                                    bowler
                                                                        .bowler!];
                                                              }
                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Card(
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(15)),
                                                                    elevation:
                                                                        4,
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                              .all(
                                                                          16.0),
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                              playerData!.nameFull ?? "",
                                                                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                                                                          SizedBox(
                                                                              height: 5),
                                                                          Text(
                                                                              "Batting Style: ${playerData.batting?.style}"),
                                                                          Text(
                                                                              "Bowling Style: ${playerData.bowling?.style}"),
                                                                          if (playerData.iskeeper ==
                                                                              true)
                                                                            Text("🏏 WC",
                                                                                style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold))
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          20),

                                                                  // Batting Stats
                                                                  Text(
                                                                      "Batting Stats",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.bold)),
                                                                  _buildStatBar(
                                                                      "Batting Average",
                                                                      double.parse(playerData
                                                                          .batting!
                                                                          .average!),
                                                                      100,
                                                                      Colors
                                                                          .green),
                                                                  _buildStatBar(
                                                                      "Strike Rate",
                                                                      double.parse(playerData
                                                                          .batting!
                                                                          .strikerate!),
                                                                      150,
                                                                      Colors
                                                                          .orange),
                                                                  _buildStatBar(
                                                                      "Total Runs",
                                                                      double.parse(playerData
                                                                          .batting!
                                                                          .runs!),
                                                                      10000,
                                                                      Colors
                                                                          .blue),

                                                                  SizedBox(
                                                                      height:
                                                                          20),

                                                                  // Bowling Stats
                                                                  Text(
                                                                      "Bowling Stats",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight:
                                                                              FontWeight.bold)),
                                                                  _buildStatBar(
                                                                      "Bowling Average",
                                                                      double.parse(playerData
                                                                          .bowling!
                                                                          .average!),
                                                                      100,
                                                                      Colors
                                                                          .red),
                                                                  _buildStatBar(
                                                                      "Economy Rate",
                                                                      double.parse(playerData
                                                                          .bowling!
                                                                          .economyrate!),
                                                                      10,
                                                                      Colors
                                                                          .purple),
                                                                  _buildStatBar(
                                                                      "Wickets",
                                                                      double.parse(playerData
                                                                          .bowling!
                                                                          .wickets!),
                                                                      50,
                                                                      Colors
                                                                          .teal),
                                                                ],
                                                              );
                                                            });
                                                      },
                                                    )),
                                                    DataCell(
                                                        Text(bowler.overs!)),
                                                    DataCell(
                                                        Text(bowler.maidens!)),
                                                    DataCell(
                                                        Text(bowler.runs!)),
                                                    DataCell(
                                                        Text(bowler.wickets!)),
                                                    DataCell(Text(
                                                        bowler.economyrate!)),
                                                  ]);
                                                }),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: ListView(
                  //       children: [
                  //         _buildSectionTitle("India's Innings 🇮🇳"),
                  //         ..._buildNewsCards(ct.dataModal?.notes?.l1),
                  //         _buildSectionTitle("New Zealand's Innings 🇳🇿"),
                  //         ..._buildNewsCards(ct.dataModal?.notes?.l2),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  NewsTicker(nuggets: ct.dataModal?.nuggets),
                ],
              ),
      );
    });
  }
}

class NewsTicker extends StatefulWidget {
  final List<String>? nuggets;
  NewsTicker({required this.nuggets});

  @override
  _NewsTickerState createState() => _NewsTickerState();
}

class _NewsTickerState extends State<NewsTicker> {
  late ScrollController _scrollController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (!mounted) return;
      setState(() {
        _currentIndex = (_currentIndex + 1) % widget.nuggets!.length;
      });
      _scrollController.animateTo(
        _currentIndex * 50.0,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.black,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.nuggets!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Text(
                widget.nuggets![index],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Function to build progress bar widget
Widget _buildStatBar(String label, double value, double maxValue, Color color) {
  double percent = (value / maxValue).clamp(0.0, 1.0);

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$label: ${value.toStringAsFixed(2)}",
            style: TextStyle(fontSize: 16)),
        SizedBox(height: 5),
        LinearPercentIndicator(
          lineHeight: 12.0,
          percent: percent,
          backgroundColor: Colors.grey.shade300,
          progressColor: color,
          barRadius: Radius.circular(10),
        ),
      ],
    ),
  );
}
