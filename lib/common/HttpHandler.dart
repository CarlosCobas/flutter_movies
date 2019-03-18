import 'dart:async';
import 'package:http/http.dart' as http; 
import 'dart:convert';
import 'package:movie_app/apiInfo.dart';

class HttpHandler {


  Future<dynamic> getJson(Uri uri) async {
    http.Response response = await http.get(uri);
    return json.decode(response.body).toString();
  }


  Future<String> fetchMovies(){
    var uri = new Uri.https(TMDB.getAPIURL(), "/3/movie/popular", {
      'api_key' : TMDB.getAPIKEY(),
      'language': TMDB.getAPILang(),
    });

    return getJson(uri).then(
      (data) => data.toString()
    );
  }
}