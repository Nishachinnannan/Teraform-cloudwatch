resource "aws_cloudwatch_metric_alarm" "httpcode_target_5xx_count" {
  alarm_name          = "${var.target_group_id}-high5XXCount"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_period
  metric_name         = "HTTPCode_Target_5XX_Count"
  namespace           = "AWS/ApplicationELB"
  period              = var.statistic_period
  statistic           = "Sum"
  threshold           = "50"
  alarm_description   = "Average API 5XX target group error code count is too high"
  alarm_actions       = [var.sns_topic_name]

  dimensions = {
    "TargetGroup"  = var.target_group_id
    "LoadBalancer" = var.load_balancer_id
  }
}
resource "aws_cloudwatch_metric_alarm" "target_response_time_average" {
  alarm_name          = "${var.target_group_id}-highResponseTime"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_period
  metric_name         = "TargetResponseTime"
  namespace           = "AWS/ApplicationELB"
  period              = var.statistic_period
  statistic           = "Average"
  threshold           = var.response_time_threshold
  alarm_description   = format("Average API response time is greater than %s", var.response_time_threshold)
  alarm_actions       = [var.sns_topic_name]



  dimensions = {
    "TargetGroup"  = var.target_group_id
    "LoadBalancer" = var.load_balancer_id
  }
}

resource "aws_cloudwatch_metric_alarm" "unhealthy_hosts" {
  alarm_name          = "${var.target_group_id}-unhealthy-hosts"
  comparison_operator = "GreaterThanOrEqualToThreshold"
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

resource "aws_cloudwatch_metric_alarm" "healthy_hosts" {
  alarm_name          = "${var.target_group_id}-healthy-hosts"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_period
  metric_name         = "HealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = var.statistic_period
  statistic           = "Average"
  threshold           = var.healthy_hosts_threshold
  alarm_description   = format("Healthy host count is less than or equal to %s", var.healthy_hosts_threshold)
  alarm_actions       = [var.sns_topic_name]



  dimensions = {
    "TargetGroup"  = var.target_group_id
    "LoadBalancer" = var.load_balancer_id
  }
}
