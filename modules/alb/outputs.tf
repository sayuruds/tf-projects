output "alb_tg-arn" {
  value = aws_alb_target_group.app_lb-tg.arn
}

# output "alb-dns_name" {
#   value = aws_lb.app_lb.dns_name
# }

# output "alb-zone_id" {
#   value = aws_lb.app_lb.zone_id
# }

output "alb-arn" {
  value = aws_lb.app_lb.arn
}