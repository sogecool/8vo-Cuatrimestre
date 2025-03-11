import 'package:flutter/material.dart';

class Customsearchbar extends StatelessWidget {
  final void Function(String)? onSubmitted;

  const Customsearchbar({
    super.key,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: 10,),
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(width: 10,),
          Expanded(
            child: TextField(
              onSubmitted: onSubmitted,
              onChanged: onSubmitted,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Buscar...",
              ),
            ),
          ),
          SizedBox(width: 10,),
        ],
      ),
    );
  }
}