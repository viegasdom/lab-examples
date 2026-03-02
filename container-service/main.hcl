resource "lab" "container_service" {
  title       = "Updated Container Service"
  description = "Updated description for sync-to-remote test."

  settings {
    idle {
      enabled = false
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
