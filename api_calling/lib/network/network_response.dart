class GetIdTokenResponse {
  String status;
  int statusCode;
  String data;

//  GetIdTokenResponse({this.status, this.statusCode, this.data});
  GetIdTokenResponse(this.status, this.statusCode, this.data);

  factory GetIdTokenResponse.fromJson(Map<String, dynamic> networkBody){
    return GetIdTokenResponse(networkBody["status"],networkBody["statusCode"],networkBody["data"]);
  }

  /*
  *
  * factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        source: Source.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: json["publishedAt"],
        content: json["content"]);
  }
  *
  * */
}


