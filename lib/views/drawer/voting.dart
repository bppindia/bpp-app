import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen5(),
    );
  }
}

class DashboardScreen5 extends StatelessWidget {
  final List<Map<String, String>> voterData = [
    {
      "name": "Swapnil M",
      "block": "Panvel",
      "votes": "5,678",
      "votePercentage": "46%"
    },
    {
      "name": "Test Name",
      "block": "Belapur",
      "votes": "6,789",
      "votePercentage": "54%"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Voting',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            // Add your functionality for the arrow button here
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0), // Adjust padding as needed
            child: SvgPicture.asset(
              'assets/images/arrow.svg', // Your SVG file path
              color: Colors.white, // Color of the arrow (if necessary)
              // height: 10.0, // Size of the arrow
              // width: 10.0, // Size of the arrow
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Statistics Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatCard("Total Votes", "12,345", context),
                  _buildStatCard("Active Polls", "27", context),
                  _buildStatCard("Voter Turnout", "78%", context),
                ],
              ),
              SizedBox(height: 20),

              // Active Polls Section
              // Active Polls Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Active Polls",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Create Poll action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Create Poll",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 8),
              // Voter Information Section
              SizedBox(
                height: 280,
                width: double.infinity,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Voter Information",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),

                        // Data Table
                        SingleChildScrollView(
                          scrollDirection:
                              Axis.horizontal, // Horizontal scrolling
                          child: DataTable(
                            columnSpacing: 10, // Reduce column spacing
                            headingRowHeight: 40,
                            horizontalMargin: 10, // Add table padding
                            columns: [
                              DataColumn(
                                label: Text(
                                  'Name',
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Block',
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Votes',
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Vote %',
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Details',
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal),
                                ),
                              ),
                            ],
                            rows: voterData.map((voter) {
                              return DataRow(
                                cells: [
                                  DataCell(
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(voter["name"]!),
                                    ),
                                  ),
                                  DataCell(
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(voter["block"]!),
                                    ),
                                  ),
                                  DataCell(
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(voter["votes"]!),
                                    ),
                                  ),
                                  DataCell(
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(voter["votePercentage"]!),
                                    ),
                                  ),
                                  DataCell(
                                    SizedBox(
                                      width: 60, // Fix width for the button
                                      child: TextButton(
                                        onPressed: () {
                                          // Handle View Details action
                                        },
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8,
                                            // vertical: 8,
                                          ),
                                          backgroundColor: Colors.blue,
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                        child: Text(
                                          "View Details",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 20),

                        // Total Voters Section
                        Text(
                          "Total Voters: ${voterData.length}",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // Floating Action Button
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Handle Create Poll action
      //   },
      //   backgroundColor: Colors.black,
      //   child: Icon(Icons.add),
      //   tooltip: "Create Poll",
      // ),
    );
  }

  // Statistics Card Widget
  Widget _buildStatCard(String title, String value, BuildContext context) {
    return Expanded(
      child: Card(
        color: Colors.green,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 18,
                    //color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                value,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  //color: Colors.grey
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
