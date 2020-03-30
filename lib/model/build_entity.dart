import 'package:mon/model/user_entity.dart';
import 'package:mon/model/workflows_entity.dart';

class BuildEntity {
  const BuildEntity({
    this.committerDate,
    this.body,
    this.reponame,
    this.buildUrl,
    this.parallel,
    this.branch,
    this.username,
    this.authorDate,
    this.user,
    this.vcsRevision,
    this.workflows,
    this.buildNum,
    this.committerEmail,
    this.status,
    this.committerName,
    this.subject,
  });

  final String committerDate;
  final String body;
  final String reponame;
  final String buildUrl;
  final int parallel;
  final String branch;
  final String username;
  final String authorDate;
  final UserEntity user;
  final String vcsRevision;
  final WorkflowsEntity workflows;
  final int buildNum;
  final String committerEmail;
  final String status;
  final String committerName;
  final String subject;

  factory BuildEntity.fromJson(Map<String, dynamic> json) {
    return BuildEntity(
      committerDate: json['committer_date'],
      body: json['body'],
      reponame: json['reponame'],
      buildUrl: json['build_url'],
      parallel: json['parallel'],
      branch: json['branch'],
      username: json['username'],
      authorDate: json['author_date'],
      user: UserEntity.fromJson(json['user']),
      vcsRevision: json['vcs_revision'],
      workflows: WorkflowsEntity.fromJson(json['workflows']),
      buildNum: json['build_num'],
      committerEmail: json['committer_email'],
      status: json['status'],
      committerName: json['committer_name'],
      subject: json['subject'],
    );
  }

  BuildEntity copyWith({
    final String committerDate,
    final String body,
    final String reponame,
    final String buildUrl,
    final int parallel,
    final String branch,
    final String username,
    final String authorDate,
    final UserEntity user,
    final String vcsRevision,
    final WorkflowsEntity workflows,
    final int buildNum,
    final String committerEmail,
    final String status,
    final String committerName,
    final String subject,
  }) {
    return  BuildEntity(
      committerDate: committerDate ?? this.committerDate,
      body: body ?? this.body,
      reponame: reponame ?? this.reponame,
      buildUrl: buildUrl ?? this.buildUrl,
      parallel: parallel ?? this.parallel,
      branch: branch ?? this.branch,
      username: username ?? this.username,
      authorDate: authorDate ?? this.authorDate,
      user: user ?? this.user,
      vcsRevision: vcsRevision ?? this.vcsRevision,
      workflows: workflows ?? this.workflows,
      buildNum: buildNum ?? this.buildNum,
      committerEmail: committerEmail ?? this.committerEmail,
      status: status ?? this.status,
      committerName: committerName ?? this.committerName,
      subject: subject ?? this.subject,
    );
  }
}
