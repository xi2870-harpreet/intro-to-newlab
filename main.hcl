# Define the lab metadata and structure
resource "lab" "container_terminal" {

  title       = "Container Terminal"
  description = "This is an example lab with a single container sandbox and a terminal tab."
  tags        = ["kubernetes", "advanced", "devops"]

  settings {
    theme = "modern-dark"
    timelimit {
      duration   = "180m"
      show_timer = true
    }
    idle {
      enabled = true
      timeout = "30m"
    }
    controls {
      show_stop = false
    }
  }

  layout = resource.layout.two_column

  content {
    chapter "introduction" {
      title = "Introduction"

      page "first" {
        title     = "First Challenge"
        reference = resource.page.first_challenge
      }
    }
  }
}

# Define the exec resource at top level — runs your setup script in the container during initialization



