import 'package:flutter/foundation.dart';
import 'package:mon/model/build_entity.dart';

@immutable
class AppState {
  final bool isLoading;
  final List<BuildEntity> builds;

  const AppState({
    this.isLoading = false,
    this.builds = const [],
  });

  factory AppState.loading() => const AppState(isLoading: true);

  AppState copyWith({
    bool isLoading,
    List<BuildEntity> builds,
  }) {
    return AppState(
      isLoading: isLoading ?? this.isLoading,
      builds: builds ?? this.builds,
    );
  }

  @override
  int get hashCode => isLoading.hashCode ^ builds.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState && runtimeType == other.runtimeType && isLoading == other.isLoading && builds == other.builds;

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, builds: $builds';
  }
}
