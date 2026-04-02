# Define the lab metadata and structure
resource "lab" "container_terminal" {
  
  title       = "Container Terminal"
  description = "This is an example lab with a single container sandbox and a terminal tab."
  tags        = ["kubernetes", "advanced", "devops"]

  settings {
    theme = "modern-dark"
    timelimit {
      duration = "60m"
      show_timer = true
    }
    idle {
      enabled = true
      timeout = "15m"
    }
   controls {
    show_stop=false
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

  script = "scripts/environment_setup.sh"

  timeout           = "180s"
  working_directory = "/root"
  environment = {
    PATH = "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
  }

 
}