variable "instance" {
  description = "Instance ID"
  type        = string
}
variable "sns_topic_name" {
  type        = string
  description = "ARN of SNS topic that will be subscribed to an alarm."
}

############### create Cloudwatch alarm ##########################
resource "aws_cloudwatch_metric_alarm" "test" {
  alarm_name          = format("%s-%s", "${var.instance}", "High-CPU-Utilizaton")
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "90"
  alarm_actions       = [var.sns_topic_name]

  dimensions = {
    InstanceId = "${var.instance}"
  }
}


resource "aws_cloudwatch_metric_alarm" "test1" {
  alarm_name          = format("%s-%s", "${var.instance}", "Warning-CPU-Utilizaton")
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "80"
  alarm_actions       = [var.sns_topic_name]

  dimensions = {
    InstanceId = "${var.instance}"
  }
}
resource "aws_cloudwatch_metric_alarm" "test2" {
  alarm_name         = format("%s-%s",var.instance,"StatusCheckFailed")
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "StatusCheckFailed"
  namespace           = "AWS/EC2"
  period              = "180"
  statistic           = "Average"
  threshold           = "1"
 alarm_actions        = [var.sns_topic_name]

dimensions = {
    InstanceId = "${var.instance}"
  }
}
