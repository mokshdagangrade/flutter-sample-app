import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupCall extends StatefulWidget {
  const GroupCall({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _GroupCallState createState() => _GroupCallState();
}

class _GroupCallState extends State<GroupCall> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Create Meeting',
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        )),
    Text('Join Meeting',
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        )),
  ];

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
