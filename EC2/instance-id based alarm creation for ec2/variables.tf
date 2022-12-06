variable "instance" {
    description = "Instance ID"
    type = string
 }
variable "sns_topic_name" {
  type        = string
  description = "ARN of SNS topic that will be subscribed to an alarm."
}
