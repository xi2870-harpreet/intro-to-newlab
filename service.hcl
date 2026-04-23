resource "service" "nginx" {
  target = resource.container.ubuntu
  port   = 80
  scheme = "http"
  path   = "/"
}
