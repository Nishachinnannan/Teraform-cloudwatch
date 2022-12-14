resource "aws_cloudwatch_metric_alarm" "unhealthy_hosts" {
  alarm_name          = "${var.target_group_id}-unhealthy-hosts"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_period
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = var.statistic_period
  statistic           = "Average"
  threshold           = var.unhealthy_hosts_threshold
  alarm_description   = format("Unhealthy host count is greater than %s", var.unhealthy_hosts_threshold)
  alarm_actions       = [var.sns_topic_name]



  dimensions = {
    "TargetGroup"  = var.target_group_id
    "LoadBalancer" = var.load_balancer_id
  }
}
