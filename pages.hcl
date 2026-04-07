resource "page" "first_challenge" {
  title = "Container terminal"
  file  = "instructions/page.md"

  activities = {
    test = resource.task.test
  }
}