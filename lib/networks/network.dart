import 'package:dio/dio.dart';
import 'package:flutter_counter/repositories/movies_responses.dart';

var dio = Dio();

Future<MovieResponse> getMovies() async {
  final result = await dio.get(
      "https://api.themoviedb.org/3/movie/550?api_key=cdc6ca7bed6a5eb7c99b71a5e92a2d93");
  if (result.statusCode == 200) {
    final data = result.data;
  //  var decodedData = jsonDecode(data);
    return MovieResponse.fromJson(data);
  } else {
    print(result.statusCode);
  }
  return MovieResponse();
}
