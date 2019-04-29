workflow "PR" {
  on = "pull_request"
  resolves = ["check branch name"]
}

action "Filter for PR merge" {
  uses = "actions/bin/filter@3c0b4f0e63ea54ea5df2914b4fabf383368cd0da"
  args = "merged true"
}

action "check branch name" {
  uses = "actions/bin/filter@3c0b4f0e63ea54ea5df2914b4fabf383368cd0da"
  needs = ["Filter for PR merge"]
  args = "branch master"
}

workflow "New workflow" {
  on = "push"
  resolves = ["docker://node:10"]
}

action "docker://node:10" {
  uses = "docker://node:10"
  args = "echo \"this is push\""
}
