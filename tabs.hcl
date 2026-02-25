resource "terminal" "shell" {
  target = resource.container.ubuntu

  shell             = "/bin/bash"
  working_directory = "/root"
}

resource "external_website" "kubernetes_docs" {
  url = "https://kubernetes.io/docs/"
}