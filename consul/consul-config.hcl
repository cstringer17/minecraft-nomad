## agent.hcl

acl = {
  enabled = true
  default_policy = "deny"
  enable_token_persistence = true
}
service {
  name = "dashboard",
  port = 9002,
  check {
    id = "dashboard-check",
    http = "http://localhost:9002/health",
    method = "GET",
    interval = "1s",
    timeout = "1s"
  }
}