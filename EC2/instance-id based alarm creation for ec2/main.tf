provider "aws" {
region = "eu-west-1"
}
############### create Cloudwatch alarm ##########################
resource "aws_cloudwatch_metric_alarm" "test" {
  alarm_name         = format("%s-%s",var.instance,"CPU-UTILIZATION-HIGH")
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "180"
  statistic           = "Average"
  threshold           = "90"
 alarm_actions        = [var.sns_topic_name]

  dimensions = {
    InstanceId = "${var.instance}"
    TopicName = "${var.sns_topic_name}"
  }
 }
