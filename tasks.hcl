resource "task" "test" {
  description = "Complete the Docker setup"
  success_message = "Excellent! You've completed all requirements."

  config {
    target = resource.container.ubuntu
    user = "root"
    group = "root"
    working_directory = "/home/user"
    timeout = "30s"
    environment = {
      PATH = "/usr/local/bin:/usr/bin:/bin"
    }
    success_exit_codes = [0]
    failure_exit_codes = [1, 2]
    parallel_exec {
      condition = true
      check = false
      solve = false
      setup = false
      cleanup = false
    }
  }

  condition "setup_environment" {
    description = "Set up the Docker environment"

    config {
      timeout = "180s"   # ← Increased (recommended for Docker setup; Instruqt defaults ~30s otherwise)
    }

    setup {
      script = "scripts/start.sh"
    }
  }
}