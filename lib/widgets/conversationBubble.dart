import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/util/Date.dart';

class ConversationBubble extends StatelessWidget {
  final String message;
  final Date date;
  final bool isRead;
  final bool isInBound;
  final bool isDateToken;

  ConversationBubble(
      {this.message,
      this.date,
      this.isRead = false,
      this.isInBound = false,
      this.isDateToken = false});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: isDateToken
          ? isInBound
              ? WrapAlignment.start
              : WrapAlignment.end
          : WrapAlignment.center,
      children: [
        isDateToken
            ? isInBound
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
                  )
            : Bubble(
                margin: BubbleEdges.symmetric(vertical: 16),
                shadowColor: Colors.transparent,
                padding: BubbleEdges.symmetric(vertical: 6, horizontal: 4),
                color: CupertinoColors.label.withAlpha(150),
                child: Text(
                  this.date.date,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1,
                    color: CupertinoColors.white,
                  ),
                ),
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
      color:
          inbound ? CupertinoColors.white : Color.fromARGB(255, 220, 248, 198),
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
            padding: EdgeInsets.only(top: 4.0),
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
