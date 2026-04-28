resource "network" "main" {
  subnet = "10.0.5.0/24"
}

resource "container" "ubuntu" {
  image {
    name = "ubuntu:24.04"
  }

  privileged = true

  network {
    id = resource.network.main.meta.id
  }

  port {
    local = "80"
    host  = "80"
  }

  
}

resource "exec" "setup_environment" {
  target = resource.container.ubuntu
  script = "scripts/environment_setup.sh"
  timeout           = "600s"
  working_directory = "/root"
  environment = {
    "PATH" = "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
  }
}
