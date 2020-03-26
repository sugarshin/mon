class WorkflowsEntity {
  const WorkflowsEntity({
    this.jobName,
    this.jobId,
    this.workflowId,
    this.workspaceId,
    this.upstreamJobIds,
    this.upstreamConcurrencyMap,
    this.workflowName,
  });

  final String jobName;
  final String jobId;
  final String workflowId;
  final String workspaceId;
  final List<dynamic> upstreamJobIds;
  final Map upstreamConcurrencyMap;
  final String workflowName;

  factory WorkflowsEntity.fromJson(Map<String, dynamic> json) {
    return WorkflowsEntity(
      jobName: json['job_name'],
      jobId: json['job_id'],
      workflowId: json['workflow_id'],
      workspaceId: json['workspace_id'],
      upstreamJobIds: json['upstream_job_ids'],
      upstreamConcurrencyMap: json['upstream_concurrency_map'],
      workflowName: json['workflow_name'],
    );
  }

  WorkflowsEntity copyWith({
    final String jobName,
    final String jobId,
    final String workflowId,
    final String workspaceId,
    final Set<String> upstreamJobIds,
    final Map upstreamConcurrencyMap,
    final String workflowName,
  }) {
    return WorkflowsEntity(
      jobName: jobName ?? this.jobName,
      jobId: jobId ?? this.jobId,
      workflowId: workflowId ?? this.workflowId,
      workspaceId: workspaceId ?? this.workspaceId,
      upstreamConcurrencyMap: upstreamConcurrencyMap ?? this.upstreamConcurrencyMap,
      workflowName: workflowName ?? this.workflowName,
    );
  }
}
