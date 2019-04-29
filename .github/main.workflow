workflow "PR" {
  on = "pull_request"
  resolves = ["docker://node:8"]
}

action "Filter for PR merge" {
  uses = "actions/bin/filter@3c0b4f0e63ea54ea5df2914b4fabf383368cd0da"
  args = "merged true"
}

action "docker://node:8" {
  uses = "docker://node:8"
  needs = ["Filter for PR merge"]
  args = "echo 'hello world'"
}
