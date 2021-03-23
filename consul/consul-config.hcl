## agent.hcl

acl = {
  enabled = true
  default_policy = "deny"
  enable_token_persistence = true
}
service {
  name = "dashboard",
  port = 9002,
  token = "457e7af1-b31d-36bc-be62-6b2eab43a027"
  check {
    id = "dashboard-check",
    http = "http://localhost:9002/health",
    method = "GET",
    interval = "1s",
    timeout = "1s"
  }
}