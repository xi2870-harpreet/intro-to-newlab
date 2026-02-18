# Define the lab metadata and structure
resource "lab" "container_terminal" {
  title       = "Container Terminal"
  description = "This is an example lab with a single container sandbox and a terminal tab."

  settings {
    idle {
      enabled = false
    }
  }

  layout = resource.layout.two_column

  content {
    chapter "introduction" {
      title = "Introduction"
      page "first" {
        title     = "First"
        reference = resource.page.first
      }
    }
  }
}

# Define the exec resource at top level — runs your setup script in the container during initialization
resource "exec" "environment_setup" {
  target = resource.container.ubuntu

  script = <<-EOF
#!/bin/bash
set -euo pipefail   # Recommended: exit on error

mkdir -p /home/user/workshop
echo "Welcome to the Container Terminal lab!" > /home/user/workshop/README.md
echo "Container ID: $(hostname)" >> /home/user/workshop/README.md

apt-get update -qq
apt-get install -y tree

touch /root/secret.txt
echo "This is a secret file - do not delete!" > /root/secret.txt

echo "Setup complete"   # For log visibility
EOF

  timeout           = "180s"
  working_directory = "/root"
  environment = {
    PATH = "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
  }

 
}