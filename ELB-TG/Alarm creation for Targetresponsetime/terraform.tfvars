cloudwatch_alarms_map = {
    app1-TargetResponseTime-alarm = {
      target_group_arn  = "targetgroup/terraform/d9d2a19eb0d2ded6"
      load_balancer_arn = "app/terraform/75ff8eded5782305"
      alarm_namespace          = "AWS/ApplicationELB"
      response_time_threshold = "90"
    }
