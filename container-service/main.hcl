resource "lab" "container_service" {
  title       = "Updated Container Service"
  description = "Updated description for sync-to-remote test. My version is way better than bruno's "

  settings {
    idle {
      enabled      = false
      show_warning = false
    }
    timelimit {
      duration = "20m"
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
