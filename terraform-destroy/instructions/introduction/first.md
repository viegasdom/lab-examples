# Terraform destroy

The sandbox has a `terraform` resource that creates a marker file through the
`local` provider. Nothing here needs doing: the point of the lab is what happens
when the session ends.

Leave the lab, then read the session's logs. A correct teardown logs:

```
Destroying resources     force=false
Destroy Terraform        ref=resource.terraform.marker
```

followed by terraform's own output, ending in `Destroy complete!`.

A teardown that skipped the destroy logs this instead, and nothing after it:

```
Destroying resources           force=true
Skipping Destroy Terraform     ref=resource.terraform.marker
```
