
## These are some boilerplate iam checks for real time events
resource "gorillastack_rule" "iam_attach_user_policy" {
  name      = "Catch privilege escalation through AttachUserPolicy events"
  labels    = ["terraform", "cloudtrail", "iam", "user policy"]
  enabled   = true

  context {
    aws {
    }
  }

  trigger {
    cloudtrail_event {
      match_fields {
        event_name = ["AttachUserPolicy"]
      }
    }
  }

  actions {
    notify_event {
      index         = 1
      notification_field_mapping {
        label       = "Event Name"
        expression  = "detail.eventName"
      }
      notification_field_mapping {
        label       = "Event Time"
        expression  = "detail.eventTime"
      }
      notification_field_mapping {
        label       = "Event Source"
        expression  = "detail.eventSource"
      }
      notification_field_mapping {
        label       = "AWS Region"
        expression  = "detail.awsRegion"
      }
      notification_field_mapping {
        label       = "IP Address"
        expression  = "detail.sourceIPAddress"
      }
      notification_field_mapping {
        label       = "User ARN"
        expression  = "detail.userIdentity.arn"
      }
      notification_field_mapping {
        label       = "User Name"
        expression  = "detail.requestParameters.userName"
      }
      notification_field_mapping {
        label       = "Policy ARN"
        expression  = "detail.requestParameters.policyArn"
      }
      notifications {
        slack_webhook {
          room_id   = "${var.slack_webhook_id}"
        }
      }
    }
  }
}

resource "gorillastack_rule" "iam_create_login_profile" {
  name      = "Catch CreateLoginProfile events for IAM"
  labels    = ["terraform", "cloudtrail", "iam", "login profile"]
  enabled   = true

  context {
    aws {
    }
  }

  trigger {
    cloudtrail_event {
      match_fields {
        event_name = ["CreateLoginProfile"]
      }
    }
  }

  actions {
    notify_event {
      index         = 1
      notification_field_mapping {
        label       = "Event Name"
        expression  = "detail.eventName"
      }
      notification_field_mapping {
        label       = "Event Time"
        expression  = "detail.eventTime"
      }
      notification_field_mapping {
        label       = "Event Source"
        expression  = "detail.eventSource"
      }
      notification_field_mapping {
        label       = "AWS Region"
        expression  = "detail.awsRegion"
      }
      notification_field_mapping {
        label       = "IP Address"
        expression  = "detail.sourceIPAddress"
      }
      notification_field_mapping {
        label       = "User ARN"
        expression  = "detail.userIdentity.arn"
      }
      notification_field_mapping {
        label       = "User Name"
        expression  = "detail.requestParameters.userName"
      }
      notification_field_mapping {
        label       = "Password Reset Required"
        expression  = "detail.requestParameters.passwordResetRequired"
      }
      notifications {
        slack_webhook {
          room_id   = "${var.slack_webhook_id}"
        }
      }
    }
  }
}

resource "gorillastack_rule" "iam_create_access_key" {
  name      = "Catch CreateAccessKey events for IAM"
  labels    = ["terraform", "cloudtrail", "iam", "access keys"]
  enabled   = true

  context {
    aws {
    }
  }

  trigger {
    cloudtrail_event {
      match_fields {
        event_name = ["CreateAccessKey"]
      }
    }
  }

  actions {
    notify_event {
      index         = 1
      notification_field_mapping {
        label       = "Event Name"
        expression  = "detail.eventName"
      }
      notification_field_mapping {
        label       = "Event Time"
        expression  = "detail.eventTime"
      }
      notification_field_mapping {
        label       = "Event Source"
        expression  = "detail.eventSource"
      }
      notification_field_mapping {
        label       = "AWS Region"
        expression  = "detail.awsRegion"
      }
      notification_field_mapping {
        label       = "IP Address"
        expression  = "detail.sourceIPAddress"
      }
      notification_field_mapping {
        label       = "User ARN"
        expression  = "detail.userIdentity.arn"
      }
      notification_field_mapping {
        label       = "User Name"
        expression  = "detail.requestParameters.userName"
      }
      notifications {
        slack_webhook {
          room_id   = "${var.slack_webhook_id}"
        }
      }
    }
  }
}
