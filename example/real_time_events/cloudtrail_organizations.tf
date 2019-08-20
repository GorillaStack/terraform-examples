## Track the addition of new accounts to an AWS Organization
## Really useful if your organization has boilerplate resources to deploy
## or processes to initialize on account creation.

resource "gorillastack_rule" "new_account_from_org" {
  name      = "Catch new accounts created from the AWS Organization"
  labels    = ["terraform", "cloudtrail", "organization"]
  enabled   = true

  context {
    aws {
    }
  }

  trigger {
    cloudtrail_event {
      match_fields {
        event_name = ["CreateAccount"]
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
      notifications {
        slack_webhook {
          room_id   = "<Your Slack Room Id>"
        }
      }
    }
  }
}


resource "gorillastack_rule" "new_account_invited_to_org" {
  name      = "Catch new accounts being invited to the AWS Organization"
  labels    = ["terraform", "cloudtrail", "organization"]
  enabled   = true

  context {
    aws {
    }
  }

  trigger {
    cloudtrail_event {
      match_fields {
        event_name = ["InviteAccountToOrganization"]
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
      notifications {
        slack_webhook {
          room_id   = "<Your Slack Room Id>"
        }
      }
    }
  }
}
resource "gorillastack_rule" "new_organizational_unit" {
  name      = "Catch new organizational units created within AWS Organization"
  labels    = ["terraform", "cloudtrail", "organization"]
  enabled   = true

  context {
    aws {
    }
  }

  trigger {
    cloudtrail_event {
      match_fields {
        event_name = ["CreateOrganizationalUnit"]
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
      notifications {
        slack_webhook {
          room_id   = "<Your Slack Room Id>"
        }
      }
    }
  }
}

resource "gorillastack_rule" "leave_organization" {
  name      = "Catch accounts leaving the AWS Organization"
  labels    = ["terraform", "cloudtrail", "organization"]
  enabled   = true

  context {
    aws {
    }
  }

  trigger {
    cloudtrail_event {
      match_fields {
        event_name = ["LeaveOrganization"]
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
      notifications {
        slack_webhook {
          room_id   = "<Your Slack Room Id>"
        }
      }
    }
  }
}
