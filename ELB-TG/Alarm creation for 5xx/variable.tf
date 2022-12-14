variable "statistic_period" {
  type        = string
  default     = "120"
  description = "The number of seconds that make each statistic period."
}
variable "sns_topic_name" {
  type        = string
  default     = "arn:aws:sns:eu-west-1:745245420757:terraform"
  description = "ARN of SNS topic that will be subscribed to an alarm."
}
variable "evaluation_period" {
  type        = string
  default     = "5"
  description = "The evaluation period over which to use when triggering alarms."
}

variable "cloudwatch_alarms_map" {
  type = map(object({
    alarm_namespace          = string # eg: AWS/ApplicationELB
    target_group_arn  = string
    load_balancer_arn = string
    HTTPCode_Target_5XX_Count = string
  }))
  default     = {}
}
