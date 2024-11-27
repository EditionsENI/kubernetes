package main

deny[msg] {
  input.kind == "Deployment"
  not input.metadata.labels["app.kubernetes.io/name"]
  msg := "Deployment must define app.kubernetes.io/name label"
}
