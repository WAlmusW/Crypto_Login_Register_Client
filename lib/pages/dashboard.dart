import 'package:flutter/material.dart';

import 'package:crypto_login_register/component/dashboardTest/get_text.dart';
import 'package:crypto_login_register/component/dashboardTest/post_text.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String serverTitle = "";
  String serverBody = "";
  TextEditingController requestTitleController = TextEditingController();
  TextEditingController sendTitleController = TextEditingController();
  TextEditingController sendBodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DashboardPage'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Request from Server:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                controller: requestTitleController,
                decoration:
                    InputDecoration(labelText: 'Enter Title for Request'),
                enableSuggestions: true,
                autocorrect: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final titleRequest = requestTitleController.text;

                  try {
                    print(titleRequest);
                    GettingService.gettingText(titleRequest, (title, body) {
                      setState(() {
                        serverTitle = title;
                        serverBody = body;
                      });
                    });
                  } catch (e) {
                    print("Sending request failed. Try again later.");
                  }
                },
                child: Text('Get Data from Server'),
              ),
              SizedBox(height: 20),
              Text('Received from Server:'),
              Text('Title: $serverTitle'),
              Text('Body: $serverBody'),
              SizedBox(height: 20),
              Text(
                'Send to Server:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                controller: sendTitleController,
                decoration: InputDecoration(labelText: 'Title'),
                enableSuggestions: true,
                autocorrect: true,
              ),
              TextField(
                controller: sendBodyController,
                decoration: InputDecoration(labelText: 'Body'),
                enableSuggestions: true,
                autocorrect: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final titleSent = sendTitleController.text;
                  final bodySent = sendBodyController.text;

                  try {
                    print(titleSent);
                    PostingService.postingText(titleSent, bodySent);
                  } catch (e) {
                    print("Sending request failed. Try again later.");
                  }
                },
                child: Text('Send to Server'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
