import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Result Bar"),
      ),
      body: ResultBody(),
    );
  }
}

class ResultBody extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _ResultBody();
  }

}

class _ResultBody extends State<ResultBody>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("hello World!"),),
    );
  }

}