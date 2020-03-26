class UserEntity {
  const UserEntity({
    this.isUser,
    this.login,
    this.avatarUrl,
    this.name,
    this.vcsType,
    this.id,
  });

  final bool isUser;
  final String login;
  final String avatarUrl;
  final String name;
  final String vcsType;
  final int id;

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      isUser: json['is_user'],
      login: json['login'],
      avatarUrl: json['avatar_url'],
      name: json['name'],
      vcsType: json['vcs_type'],
      id: json['id'],
    );
  }

  UserEntity copyWith({
    final bool isUser,
    final String login,
    final String avatarUrl,
    final String name,
    final String vcsType,
    final int id,
  }) {
    return UserEntity(
      isUser: isUser ?? this.isUser,
      login: login ?? this.login,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      name: name ?? this.name,
      vcsType: vcsType ?? this.vcsType,
      id: id ?? this.id,
    );
  }
}
