import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/util/Date.dart';

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
