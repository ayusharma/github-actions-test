workflow "PR" {
  on = "pull_request"
  resolves = ["check merge event"]
}

action "Filter for PR merge" {
  uses = "actions/bin/filter@3c0b4f0e63ea54ea5df2914b4fabf383368cd0da"
  args = "merged true"
}

action "check merge event" {
  uses = "actions/bin/filter@3c0b4f0e63ea54ea5df2914b4fabf383368cd0da"
  needs = ["Filter for PR merge"]
  args = "ref refs/heads/*/merge"
}

workflow "New workflow" {
  on = "push"
  resolves = ["Filters for GitHub Actions"]
}

action "docker://node:10" {
  uses = "docker://node:10"
  args = "echo \"this is push\""
}

action "Filters for GitHub Actions" {
  uses = "actions/bin/filter@3c0b4f0e63ea54ea5df2914b4fabf383368cd0da"
  needs = ["docker://node:10"]
  args = "ref refs/heads/*/merge"
}
