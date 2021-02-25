import 'package:flutter/material.dart';

class ChampionDetail extends StatelessWidget {
  final String name;

  ChampionDetail({this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('League of Legends'),
      ),
      body : Center(
        child: Text('Champion Detail - $name'),
      )
    );
  }
}
