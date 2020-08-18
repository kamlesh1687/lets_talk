import 'package:flutter/material.dart';

class Searchbar extends StatefulWidget {
  @override
  _SearchbarState createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(
            right: 13,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
            ),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.access_alarm),
                  border: InputBorder.none,
                  hintText: "Search....",
                  hintStyle: TextStyle(fontSize: 16, color: Colors.red)),
            ),
          ),
        ),
        leading: Icon(Icons.scanner),
        actions: [
          Icon(Icons.add_a_photo),
          Container(
            width: 15,
          ),
        ],
      ),
      body: Center(
        child: Text("hello"),
      ),
    );
  }
}
