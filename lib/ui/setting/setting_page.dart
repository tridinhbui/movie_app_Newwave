import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
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
          title: Text('Setting'),
          backgroundColor: Color.fromRGBO(70, 130, 180, 1),
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 15, left: 20),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 380,
                  child: Text("",
                      style: TextStyle(fontSize: 22, color: Colors.white)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
