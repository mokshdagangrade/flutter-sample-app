import 'package:dyte_flutter_sample_app/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dyte_flutter_sample_app/screens/create_meeting.dart';
import 'package:dyte_flutter_sample_app/screens/join_meeting.dart';

class BasePage extends StatefulWidget {
    const BasePage({Key? key, required this.title, required this.mode}) : super(key: key);

  final String title;
  final Mode mode;

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _selectedIndex = 0;

  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
        CreateMeeting(mode: widget.mode),
        JoinMeeting(mode: widget.mode),
    ];

  }

  void _onTappedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color(0xff2160fd),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call_sharp),
            label: 'Create Meeting',
            backgroundColor: Color(0xff2160fd),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_camera_front_sharp),
            label: 'Join Meeting',
            backgroundColor: Color(0xff2160fd),
          ),
        ],
        type: BottomNavigationBarType.shifting,
        backgroundColor: const Color(0xff2160fd),
        selectedItemColor: const Color(0xfff5f5f7),
        iconSize: 30,
        onTap: _onTappedItem,
        elevation: 5,
      ),
    );
  }
}
