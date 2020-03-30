import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mon/model/builds_dto.dart';

class CircleCIAPIClient {
  static const _BASE_URL = 'https://circleci.com/api/v1.1';
  Future<BuildsDto> fetchRecentBuilds(String token) async {
    final response = await http.get(
      '$_BASE_URL/recent-builds?circle-token=$token',
      headers: { 'Accept': 'application/json' }
    );
    final responseJson = json.decode(response.body);
    return BuildsDto.fromJson(responseJson);
  }
}
