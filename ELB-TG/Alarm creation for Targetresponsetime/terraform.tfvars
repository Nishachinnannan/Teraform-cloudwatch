cloudwatch_alarms_map = {
    app1-TargetResponseTime-alarm = {
      target_group_arn  = "targetgroup/terraform/e9952a9afd8f91ea"
      load_balancer_arn = "app/terrafrom/4a773875a3c0b703"
      alarm_namespace          = "AWS/ApplicationELB"
      response_time_threshold = "90"
    }
