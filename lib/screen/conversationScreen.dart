import 'package:bubble/bubble.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screen/profileScreen.dart';
import 'package:flutter_app/util/Date.dart';

class ConversationScreen extends StatelessWidget {
  final String name;

  final messages = [
    {
      'name': '+44',
      'message': Faker().lorem.sentence(),
      'date': Date(DateTime(2021)),
      'isRead': false,
      'isInBound': false,
    },
    {
      'name': '+49',
      'message': Faker().lorem.words(10).toString(),
      'date': Date(DateTime.now()),
      'isRead': false,
      'isInBound': true,
    },
    {
      'name': '+49',
      'message': ':)',
      'date': Date(DateTime.now()),
      'isRead': false,
      'isInBound': true,
    },
    {
      'name': '+49',
      'message': '''
This is a very long message.

I would like to send this cuz why not.
      '''
          .trim(),
      'date': Date(DateTime.now()),
      'isRead': false,
      'isInBound': false,
    },
  ];

  ConversationScreen({this.name});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Color.fromARGB(200, 255, 255, 255),
        middle: Text(this.name),
        trailing: GestureDetector(
          onTap: () {
            Navigator.push(context, CupertinoPageRoute(builder: (context) {
              return ProfileScreen(name: this.name);
            }));
          },
          child: CircleAvatar(
            radius: 16,
            backgroundColor: CupertinoColors.systemGrey,
          ),
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(
              1,
              1,
            ),
            colors: <Color>[
              Colors.orange,
              Colors.red,
            ], // red to yellow
            tileMode:
            TileMode.repeated, // repeats the gradient over the canvas
          ),
        ),
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: ListView.builder(
                  itemCount: this.messages.length,
                  itemBuilder: (context, index) {
                    return ConversationBubble(
                      message: this.messages[index]['message'],
                      date: this.messages[index]['date'],
                      isRead: this.messages[index]['isRead'],
                      isInBound: this.messages[index]['isInBound'],
                    );
                  },
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    spreadRadius: -10,
                  ),
                ],
              ),
              child: SizedBox(
                child: Container(
                  color: Color.fromARGB(240, 255, 255, 255),
                  padding: EdgeInsets.only(left: 16, right: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: CupertinoTextField(
                            minLines: 1,
                            maxLines: 5,
                            onEditingComplete: () {},
                          ),
                        ),
                      ),
                      CupertinoButton(
                        alignment: Alignment.center,
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: Icon(CupertinoIcons.arrowtriangle_right_fill),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ConversationBubble extends StatelessWidget {
  final String message;
  final Date date;
  final bool isRead;
  final bool isInBound;

  ConversationBubble({this.message, this.date, this.isRead, this.isInBound});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: isInBound ? WrapAlignment.start : WrapAlignment.end,
      children: [
        isInBound
            ? Container(
                padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 4,
                ),
                child: createBubble(inbound: this.isInBound),
              )
            : Container(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 4,
                ),
                child: createBubble(inbound: this.isInBound),
              ),
      ],
    );
  }

  Widget createBubble({bool inbound}) {
    return Bubble(
      borderColor: Color.fromARGB(20, 0, 0, 0),
      borderWidth: 0.5,
      margin: BubbleEdges.only(top: 10),
      stick: true,
      elevation: 0.3,
      nip: inbound ? BubbleNip.leftTop : BubbleNip.rightBottom,
      color: inbound ? Colors.white : Color.fromARGB(255, 220, 248, 198),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            this.message,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: CupertinoColors.label,
              height: 1,
              fontSize: 16,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              this.date.date,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromARGB(100, 0, 0, 0),
                height: 1,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment(
//                     1,
//                     1,
//                   ),
//                   colors: <Color>[
//                     Colors.orange,
//                     Colors.red,
//                   ], // red to yellow
//                   tileMode:
//                       TileMode.repeated, // repeats the gradient over the canvas
//                 ),
//               ),
