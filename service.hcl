resource "service" "nginx" {
  target = resource.container.ubuntu
  port   = 8080
  scheme = "http"
  path   = "/"
}
