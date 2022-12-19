resource "aws_cloudwatch_metric_alarm" "httpcode_target_5xx_count" {
  for_each = var.cloudwatch_alarms_map

  alarm_name          = each.key
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_period
  metric_name         = "HTTPCode_Target_5XX_Count"
  namespace           = each.value["alarm_namespace"]
  period              = var.statistic_period
  statistic           = "Average"
  threshold           = each.value["HTTPCode_Target_5XX_Count"]
  alarm_description   = format("Average API response time is greater than %s", each.value["HTTPCode_Target_5XX_Count"])
  alarm_actions       = [var.sns_topic_name]

  dimensions = {
    TargetGroup  = each.value["target_group_arn"]
    LoadBalancer = each.value["load_balancer_arn"]
  }
}
terraform {
  backend "s3" {
    bucket = "nishanthi"
    key    = "terraform/5xx/terraform.tfstate"
    region = "eu-west-1"
  }
}
