variable "load_balancer_id" {
  type        = string
  description = "ALB ID"
}

variable "target_group_id" {
  type        = string
  description = "Target Group ID"
}
variable "statistic_period" {
  type        = string
  default     = "300"
  description = "The number of seconds that make each statistic period."
}
variable "sns_topic_name" {
  type        = string
  description = "ARN of SNS topic that will be subscribed to an alarm."
}
variable "evaluation_period" {
  type        = string
  default     = "1"
  description = "The evaluation period over which to use when triggering alarms."
}

variable "unhealthy_hosts_threshold" {
  type        = string
  default     = "0"
  description = "The number of unhealthy hosts."
}
