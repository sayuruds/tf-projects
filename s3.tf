module "s3" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "${var.project}-${var.creator}-bucket"
  #acl    = "private"

  control_object_ownership = true
  #object_ownership         = "ObjectWriter"

  versioning = {
    enabled = false
  }

  tags = {
    creator = var.creator
    project = var.project
  }
}