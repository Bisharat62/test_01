
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:test_01/model_class/modelclass.dart';
import 'package:url_launcher/url_launcher.dart';

import '../helper/helper.dart';


class ArticleDetail extends StatelessWidget {
  final Articles articles;
  const ArticleDetail({Key? key,required this.articles}) : super(key: key);
  _launchURL() async {
    final url = articles.url;
    if (await canLaunch(url.toString())) {
      await launch(url.toString());
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(articles.title.toString()),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: width*0.9,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(articles.urlToImage.toString()),
                  fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            sizebox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    (articles.source?.name).toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    (articles.publishedAt).toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),
            Text("Author : ${articles.author}"),
            sizebox(),
            Text(articles.description.toString(),style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),),
            Text(
              articles.content.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
             TextButton(
              onPressed: _launchURL,
              child:  Text('Explore More'),
            ),
          ],
        ),
      ),
    );
  }
}