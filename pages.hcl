resource "page" "first_challenge" {
  title = "Container terminal"
  file  = "instructions/page.md"

  activities = {
    "test" = resource.task.test
  }
}

resource "page" "customize_homepage" {
  title = "Customize Your Web Server"
  file = "instructions/customize_homepage.md"

  activities = {
    edit_homepage = resource.task.edit_homepage
  }
}