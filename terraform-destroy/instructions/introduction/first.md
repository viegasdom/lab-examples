# Terraform destroy

The sandbox has two `terraform` resources. Both create a marker file through the
`local` provider, so they do identical work. They differ in one thing only:
`resource.terraform.with_vars` declares `variables`, `resource.terraform.no_vars`
does not.

Nothing here needs doing. The point of the lab is what the teardown logs.

Leave the lab, then read the session's logs. A resource that is really destroyed
logs both of these, followed by terraform's own output ending in
`Destroy complete!`:

```
Destroy Terraform          ref=resource.terraform.with_vars
Running terraform destroy  id=resource.terraform.with_vars
```

A resource that is skipped logs only the first line, and nothing after it:

```
Destroy Terraform          ref=resource.terraform.no_vars
```

Both arms logging `Running terraform destroy` is the pass condition. Only
`with_vars` logging it means the sdk is gating destroy on `terraform.tfvars`,
which is written only when `variables` are declared, even though `variables` is
optional in the schema.
