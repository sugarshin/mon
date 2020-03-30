import 'dart:async';
import 'package:mon/model/builds_dto.dart';
import 'package:mon/repository/http/circleci.dart';

class BuildsImpl {
  Future<BuildsDto> fetchRecent(String token){
    CircleCIAPIClient client = CircleCIAPIClient();
    return client.fetchRecentBuilds(token);
  }
}
