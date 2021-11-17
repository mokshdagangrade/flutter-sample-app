import 'package:dyte_flutter_sample_app/screens/base_page.dart';
import 'package:dyte_flutter_sample_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DyteSampleHomePage extends StatefulWidget {
  const DyteSampleHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DyteSampleHomePage> createState() => _DyteSampleHomePageState();
}

class _DyteSampleHomePageState extends State<DyteSampleHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color(0xff2160fd),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(25),
              child: TextButton(
                child: const Text(
                  'Group Call',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BasePage(
                              mode: Mode.groupCall,
                              title: '${widget.title} - Group Call')));
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(25),
              child: TextButton(
                child: const Text(
                  'Webinar',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BasePage(
                              mode: Mode.webinar,
                              title: '${widget.title} - Webinar')));
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(25),
              child: TextButton(
                child: const Text(
                  'Custom Controls',
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BasePage(
                              mode: Mode.customControls,
                              title: '${widget.title} - Custom Controls')));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
