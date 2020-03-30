import 'package:flutter/foundation.dart';
import 'package:mon/model/build_entity.dart';

@immutable
class AppState {
  final bool isLoading;
  final List<BuildEntity> builds;
  final String token;

  const AppState({
    this.isLoading = false,
    this.builds = const [],
    this.token = '',
  });

  factory AppState.loading() => const AppState(isLoading: true);

  AppState copyWith({
    bool isLoading,
    List<BuildEntity> builds,
    String token,
  }) {
    return AppState(
      isLoading: isLoading ?? this.isLoading,
      builds: builds ?? this.builds,
      token: token ?? this.token,
    );
  }

  static AppState fromJson(dynamic json) =>
      AppState(
        isLoading: json == null ? false : json['isLoading'],
        builds: json == null ? [] : json['builds'],
        token: json == null ? '' : json['token'],
      );

  dynamic toJson() => {'counter': isLoading, 'builds': builds, 'token': token};

  @override
  int get hashCode => isLoading.hashCode ^ builds.hashCode ^ token.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState && runtimeType == other.runtimeType && isLoading == other.isLoading && builds == other.builds && token == other.token;

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, builds: $builds token: $token}';
  }
}
