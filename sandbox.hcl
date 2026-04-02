resource "network" "main" {
  subnet = "10.0.5.0/24"
}

resource "container" "ubuntu" {
  image {
    name = "ubuntu:24.04"
  }

  privileged = true

   # ← Added to connect container to the network

  network {
    id = resource.network.main.meta.id
  }

 

}
