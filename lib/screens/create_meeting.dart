import 'package:dyte_flutter_sample_app/models/dyte_api.dart';
import 'package:dyte_flutter_sample_app/models/models.dart';
import 'package:dyte_flutter_sample_app/ui_utils/text_field.dart';
import 'package:dyte_flutter_sample_app/utils/constants.dart';
import 'package:dyte_flutter_sample_app/utils/exceptions.dart';
import 'package:flutter/material.dart';

import './dyte_meeting_page.dart';

class CreateMeeting extends StatefulWidget {
  const CreateMeeting({Key? key, required this.mode}) : super(key: key);

  final Mode mode;

  @override
  _CreateMeetingState createState() => _CreateMeetingState();
}

class _CreateMeetingState extends State<CreateMeeting> {
  String meetingTitle = "";
  String participantName = "";

  bool isLoading = false;
  bool isErroredState = false;

  final TextEditingController _meetingTitleController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      participantName = _nameController.text.trim();
    });

    _meetingTitleController.addListener(() {
      meetingTitle = _meetingTitleController.text.trim();
    });
  }

  Future<void> _joinRoom(Meeting meeting, bool isHost) async {
    /* Navigator.of(context).pop(); */
    try {
      var authToken = await DyteAPI.joinRoom(meeting, isHost,
          widget.mode == Mode.webinar ? true : false, participantName);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DyteMeetingPage(
                  roomName: meeting.roomName!,
                  authToken: authToken,
                  mode: widget.mode,
                )),
      );
    } on APIFailureException {
      setState(() {
        isErroredState = true;
        isLoading = false;
      });
      Navigator.of(context).pop();
    }
  }

  Future<void> _showMeetingDialog(Meeting meeting) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Join ${meeting.roomName} as'),
          children: <Widget>[
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: TextArea(
                controller: _nameController,
                description: "Enter your name",
                textColor: Colors.black,
              ),
            ),
            SimpleDialogOption(
              child: const Text('Host'),
              onPressed: () {
                _joinRoom(meeting, true);
              },
            ),
            SimpleDialogOption(
              child: const Text('Participant'),
              onPressed: () {
                _joinRoom(meeting, false);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text(
        "Enter meeting title",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      TextArea(
          controller: _meetingTitleController,
          description: "Enter meeting title"),
      TextButton(
        onPressed: () async {
          setState(() {
            isLoading = true;
          });
          try {
            var meeting = await DyteAPI.createMeeting(meetingTitle);
            _showMeetingDialog(meeting);
            setState(() {
              isLoading = false;
            });
          } on APIFailureException {
            setState(() {
              isLoading = false;
              isErroredState = true;
            });
          }
        },
        child: !isLoading
            ? Text(
                isErroredState ? "Retry" : "Create",
                style: const TextStyle(
                  color: Colors.white,
                ),
              )
            : const CircularProgressIndicator(),
      ),
      isErroredState
          ? const Text(
              "Meeting could not be created, try again",
              style: TextStyle(
                color: Colors.white,
              ),
            )
          : Container(),
    ]);
  }
}
