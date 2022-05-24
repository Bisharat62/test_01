


class Source{
  String? id;
  String? name;
  Source({this.id,this.name});
  factory Source.fromJson(Map<String,dynamic> json){
    return Source(id: json['id'],name: json['name']);
  }
}
class Articles {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  Articles({this.source,this.author,this.title,this.description,this.url,this.urlToImage,this.publishedAt,this.content});
  factory Articles.fromJson(Map<String,dynamic>json){
    return Articles(
      source: Source.fromJson(json['source']),
      author: json['author'] ,
      title: json['title'] ,
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],

    );
  }
  
}