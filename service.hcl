resource "service" "nginx" {
  target = resource.container.ubuntu
  port   = 80
  scheme = "http"
  path   = "/"
}
# Service tab - exposes the nginx web server to users
resource "service" "webserver" {
  target = resource.container.webserver
  port   = 80
  scheme = "http"
}