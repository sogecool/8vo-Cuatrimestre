import 'package:flutter/material.dart';
import '../models/trending.dart';


class Detail extends StatefulWidget {
  final Trending? item;
  const Detail({super.key, this.item});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  Trending _item =Trending(
      category: "", 
      hashtag: "", 
      published: ""
    );

  void move(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Detail(
          item: _item,
        ),
      ),
    );
  }

  void goBack(){
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => Detail(
          item: _item,
        ),
      ),
      (route) => false,
    );
  }


  @override
  Widget build(BuildContext context) {
    _item = widget.item??Trending(
      category: "", 
      hashtag: "", 
      published: ""
    );

    
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Detalle"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(_item.hashtag),
          IconButton(
            onPressed: move, 
            icon: Icon(
              Icons.add,
            )
          ),
          IconButton(
            onPressed: goBack, 
            icon: Icon(
              Icons.arrow_back,
            )
          )
        ],
      ),
    );
  }
}