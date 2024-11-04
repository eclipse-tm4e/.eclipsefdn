local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-tm4e') {
  settings+: {
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/tm4e/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push"
      ],
    },
  ],
  _repositories+:: [
    orgs.newRepo('tm4e') {
      code_scanning_default_languages+: [
        "go",
        "javascript",
        "javascript-typescript",
        "python",
        "ruby",
        "typescript"
      ],
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "TextMate support in Eclipse IDE",
      has_discussions: true,
      has_projects: false,
      has_wiki: false,
      homepage: "https://projects.eclipse.org/projects/technology.tm4e",
      squash_merge_commit_message: "BLANK",
      squash_merge_commit_title: "PR_TITLE",
      topics+: [
        "eclipse",
        "hacktoberfest",
        "java",
        "textmate"
      ],
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
      ],
    },
  ],
}
