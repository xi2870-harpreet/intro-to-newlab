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
  target = resource.container.ubuntu  # Targets your ubuntu container

  script = "scripts/start.sh"         # Your file-creation + tree install script

  timeout           = "180s"          # Safe for apt update/install + any waits
  working_directory = "/root"         # Good choice — root-owned files go here safely

  environment = {
    PATH = "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
  }

  # No 'user' needed — defaults to root in ubuntu image
  # No depends_on required — Instruqt handles container → exec ordering via reference
}