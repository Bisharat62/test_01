
import 'dart:convert';

import 'package:test_01/model_class/modelclass.dart';
import 'package:http/http.dart'as http;

class ApiTest {
  final url = "https://newsapi.org/v2/everything?q=Apple&from=2022-05-23&sortBy=popularity&apiKey=8366602eb3f4437db81b34a7ff49c469";
  Future<List<Articles>> getArticle()async{
    final res = await http.get(Uri.parse(url));
    if(res.statusCode == 200){
      Map<String,dynamic> json = jsonDecode(res.body);
      List<dynamic> body = json['articles'];
      List<Articles> articles = body.map((dynamic item) => Articles.fromJson(item)).toList();
      return articles; 
    }else{
      throw("Api not fetched Successfully");
    }
  }
}