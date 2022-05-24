import 'package:flutter/material.dart';
import 'package:test_01/model_class/modelclass.dart';
import 'package:test_01/page/article_details.dart';


Widget customCard(Articles articles,BuildContext context){
  var width = MediaQuery.of(context).size.width;
  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleDetail(articles: articles)));
    },
    child: Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow:const [
           BoxShadow(
            color: Colors.black12,
            blurRadius: 3,
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            width: width*0.9,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(articles.urlToImage.toString()),
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          sizebox(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text((articles.source?.name).toString(),style: const TextStyle(color: Colors.white,fontSize: 16),),
          ),
          sizebox(),
          Text(articles.title.toString(),style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),)
        ],
      ),
    ),
  );
}

Widget sizebox(){
  return const SizedBox(height: 10,);
}