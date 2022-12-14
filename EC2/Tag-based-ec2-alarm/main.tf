provider "aws" {
  region = "eu-west-1"
}
variable "sns_topic_name" {
  type        = string
  description = "ARN of SNS topic that will be subscribed to an alarm."
}

data "aws_instance" "selected" {
  filter {
    name   = "tag:alarms"
    values = ["Create_Auto_Alarms"]
  }
}
############### create Cloudwatch alarm ##########################
resource "aws_cloudwatch_metric_alarm" "bat" {
  alarm_name          = format("%s-%s", "${data.aws_instance.selected.id}", "High-CPU-Utilizaton")
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "90"
 alarm_actions        = [var.sns_topic_name]

  dimensions = {
     InstanceId = data.aws_instance.selected.id
  }
 }
resource "aws_cloudwatch_metric_alarm" "CpuUtilization1" {
  alarm_name          = format("%s-%s", "${data.aws_instance.selected.id}", "Warning-CPU-Utilizaton")
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "80"
 alarm_actions        = [var.sns_topic_name]

  dimensions = {
     InstanceId = data.aws_instance.selected.id
  }
 }
resource "aws_cloudwatch_metric_alarm" "instance-health-check" {
 alarm_name          = format("%s-%s", "${data.aws_instance.selected.id}", "StatusCheckFailed_System")
comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "StatusCheckFailed_System"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "1"
  alarm_actions        = [var.sns_topic_name]

  dimensions = {
     InstanceId = data.aws_instance.selected.id
  }
 }

