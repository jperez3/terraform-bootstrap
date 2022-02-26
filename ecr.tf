resource "aws_ecr_repository" "service" {

  name = var.service

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = merge(
    local.common_tags,
    tomap({
      "Name" = var.service
    })
  )
}
