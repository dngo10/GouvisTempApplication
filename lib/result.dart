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
      margin: EdgeInsets.only(top: 20.0, left: 20.0),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Expanded(flex: 1,
                child: Text("Test1"),
              ),
              Expanded(child: Text("abc"), flex: 3,)
            ],
          )
        ],
      )
    );
  }
}