import 'package:flutter/material.dart';

class TheatrePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color.fromRGBO(138, 43, 226, 0.1),
          Color.fromRGBO(186, 85, 211, 1),
        ],
      )),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(70, 130, 180, 0.65),
        appBar: AppBar(
          title: Text('Theatres'),
          backgroundColor: Color.fromRGBO(70, 130, 180, 1),
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 15, left: 15),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(70, 130, 180, 0.75),
                      border: Border.all(color: Colors.white54),
                      borderRadius: BorderRadius.all(Radius.circular(13))),
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.92,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30,
                      ),
                      suffixIcon: Icon(
                        Icons.mic,
                        color: Colors.white,
                        size: 30,
                      ),
                      hintText: 'Search for theotre',
                      hintStyle: TextStyle(fontSize: 21, color: Colors.white70),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
