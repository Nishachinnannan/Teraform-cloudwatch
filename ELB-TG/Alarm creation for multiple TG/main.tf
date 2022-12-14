resource "aws_cloudwatch_metric_alarm" "target_response_time_average" {
  for_each = var.cloudwatch_alarms_map

  alarm_name          = each.key
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_period
  metric_name         = "TargetResponseTime"
  namespace           = each.value["alarm_namespace"]
  period              = var.statistic_period
  statistic           = "Average"
  threshold           = each.value["response_time_threshold"]
  alarm_description   = format("Average API response time is greater than %s", each.value["response_time_threshold"])
  alarm_actions       = [var.sns_topic_name]

  dimensions = {
    TargetGroup  = each.value["target_group_arn"]
    LoadBalancer = each.value["load_balancer_arn"]
  }
}

