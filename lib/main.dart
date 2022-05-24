import 'package:flutter/material.dart';
import 'package:test_01/services/api_test.dart';

import 'helper/helper.dart';
import 'model_class/modelclass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Apitest(),
    );
  }
}
class Apitest extends StatefulWidget {
  const Apitest({Key? key}) : super(key: key);

  @override
  State<Apitest> createState() => _ApitestState();
}

class _ApitestState extends State<Apitest> {
  final Apitest = ApiTest();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Test"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Apitest.getArticle(),
        builder: (BuildContext context, AsyncSnapshot <List<Articles>> snapshot){
          if(snapshot.hasData){
            List<Articles>? articles = snapshot.data;
            return ListView.builder(
              itemCount: articles!.length,
              itemBuilder: (context,index)=> customCard(articles[index],context),
              );
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        }
      ),
    );
  }
}
