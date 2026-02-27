resource "layout" "two_column" {
  column {
    tab "terminal" {
      target = resource.terminal.shell
    }
    width = "33"
    instructions {
    }
  }
  column {
    tab "terminal2" {
      target = resource.terminal.shell2
    }
    width = "33"
    instructions {
    }
  }
  column {
    width = 60
    instructions {}
  }
    column {
    width = "30"

    tab "docs" {
      target = resource.external_website.kubernetes_docs
      title  = "K8s Docs"
    }
    }
}
