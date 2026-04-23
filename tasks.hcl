resource "task" "test" {
  description     = "Verify NGINX is running"
  success_message = "Excellent! You've completed all requirements."

  config {
    target            = resource.container.ubuntu
    user              = "root"
    working_directory = "/root"
    timeout           = "30s"

    success_exit_codes = [0]
  }
      
  condition "nginx_running" {
    description = "Check if NGINX container is running"
    config {
      timeout = "120s"
    }

    check {
      script          = "scripts/check_nginx.sh"
      failure_message = "NGINX is not running. Please ensure the container is up and NGINX is installed and running inside it."
    }

  }

  condition "nginx_accessible" {
    description = "Check if NGINX is accessible"
    config {
      timeout = "120s"
    }
    check {
      script          = "scripts/check_nginx_access.sh"
      failure_message = "NGINX is not accessible. Please ensure NGINX is running and properly configured to serve content on port 80."
    }


  }
}