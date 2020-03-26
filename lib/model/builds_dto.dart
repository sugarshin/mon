import 'package:mon/model/build_entity.dart';

class BuildsDto {
  const BuildsDto({
    this.builds
  });

  final List<BuildEntity> builds;

  factory BuildsDto.fromJson(List<dynamic> json) {
    List<BuildEntity> buildList = [];
    for (var build in json) {
      buildList.add(BuildEntity.fromJson(build));
    }

    return BuildsDto(
      builds: buildList,
    );
  }
}
