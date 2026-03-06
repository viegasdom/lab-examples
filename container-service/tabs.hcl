resource "service" "nginx" {
  target = resource.container.nginx
  scheme = "http"
  port   = 80
  path   = "/"
}
resource "terminal" "terminal" {
  target = resource.container.new-container-for-test-party
}
