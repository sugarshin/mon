import 'dart:async';
import 'package:mon/model/builds_dto.dart';
import 'package:mon/repository/http/circleci.dart';

class BuildsImpl {
  Future<BuildsDto> fetchRecent(){
    CircleCIAPIClient client = CircleCIAPIClient();
    return client.fetchRecentBuilds();
  }
}
