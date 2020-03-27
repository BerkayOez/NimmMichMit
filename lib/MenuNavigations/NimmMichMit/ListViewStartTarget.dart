import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ListViewStartTarget extends StatefulWidget {
  List items = List<ListItem>();

  @override
  _ListViewStartTargetState createState() => _ListViewStartTargetState();
  ListViewStartTarget({Key key, @required this.items}) : super(key: key);
}

class _ListViewStartTargetState extends State<ListViewStartTarget> {

  @override
  Widget build(BuildContext context) {

    return Container(
      child: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index){
          final item = widget.items[index];
          return Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  print("HELLOW");
                },
                onLongPress: () {
                  setState(() {
                    widget.items.removeAt(index);
                  });
                },
                color: Colors.grey.shade100,
                child: ListTile(
                title: Text("Von: ${item.start1} "),
                subtitle: Text("Nach: ${item.ziel1}"),
                ),
              ),
              SizedBox(
                height: 5.0,
              )
            ],
          );
        }

      ),
    );
  }
}


// The base class for the different types of items the list can contain.
abstract class ListItem {}

// A ListItem that contains data to display a message.
class StartTargetItem implements ListItem {
  final String start1;
  final String ziel1;

  StartTargetItem(this.start1, this.ziel1);
}
