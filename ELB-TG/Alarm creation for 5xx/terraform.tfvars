cloudwatch_alarms_map = {
    frontend-HTTPCode_Target_5XX_Count-alarm = {
      target_group_arn  = "targetgroup/frontend/83ba17aa184b6cf8"
      load_balancer_arn = "/app/frontend/40a7fef74b6bf220"
      alarm_namespace          = "AWS/ApplicationELB"
      HTTPCode_Target_5XX_Count = "90"
    }
}
