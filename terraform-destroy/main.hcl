resource "lab" "terraform_destroy" {
  title       = "Terraform Destroy"
  description = "Checks that terraform destroy runs when the lab ends."

  settings {
    idle {
      enabled = false
    }
  }

  layout = resource.layout.terraform_destroy

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
