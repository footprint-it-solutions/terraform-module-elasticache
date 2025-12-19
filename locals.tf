locals {
  tags = merge(
    var.tags,
    {
      "provisioned-by" = "terraform"
    }
  )
}
