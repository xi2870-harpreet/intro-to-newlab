resource "lab" "main" {
  title       = "My Web Server Lab"
  description = "Learn web server basics by customizing an nginx homepage"
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

    chapter "getting_started" {
      title = "Getting Started with Web Servers"

      page "customize_homepage" {
        reference = resource.page.customize_homepage
      }
    }

  }
}