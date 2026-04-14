resource "layout" "two_column" {

  # Column 1 - Terminal 1
  column {
    width = "25"

    tab "terminal" {
      target = resource.terminal.shell
      title  = "Terminal 1"
    }

    instructions {
    }
  }

  # Column 2 - Terminal 2
  column {
    width = "25"

    tab "terminal2" {
      target = resource.terminal.shell2
      title  = "Terminal 2"
    }

    instructions {
    }
  }

  # Column 3 - Instructions
  column {
    width = "25"

    instructions {
    }
  }

  # Column 4 - Docs + NGINX
  column {
    width = "25"

    tab "docs" {
      target = resource.external_website.kubernetes_docs
      title  = "K8s Docs"
    }

    tab "nginx" {
      target = resource.service.nginx
      title  = "NGINX (use terminal or service URL)"

    }
  }
}