## These are some boilerplate s3 checks for real time events
resource "gorillastack_rule" "s3_bucket_versioning_config_change" {
  name      = "Catch someone turning off Bucket Versioning"
  labels    = ["terraform", "cloudtrail", "s3", "bucket"]
  enabled   = true

  context {
    aws {
    }
  }

  trigger {
    cloudtrail_event {
      match_fields {
        event_name = ["PutBucketVersioning"]
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
        label       = "Bucket Name"
        expression  = "detail.requestParameters.bucketName"
      }
      notifications {
        slack_webhook {
          room_id   = "${var.slack_webhook_id}"
        }
      }
    }
  }
}

resource "gorillastack_rule" "s3_bucket_website_on" {
  name      = "Catch someone enabling a bucket website"
  labels    = ["terraform", "cloudtrail", "s3", "bucket"]
  enabled   = true

  context {
    aws {
    }
  }

  trigger {
    cloudtrail_event {
      match_fields {
        event_name = ["PutBucketWebsite"]
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
        label       = "Bucket Name"
        expression  = "detail.requestParameters.bucketName"
      }
      notifications {
        slack_webhook {
          room_id   = "${var.slack_webhook_id}"
        }
      }
    }
  }
}

resource "gorillastack_rule" "s3_delete_bucket_encryption" {
  name      = "Catch someone deleting bucket encryption"
  labels    = ["terraform", "cloudtrail", "s3", "bucket", "encryption"]
  enabled   = true

  context {
    aws {
    }
  }

  trigger {
    cloudtrail_event {
      match_fields {
        event_name = ["DeleteBucketEncryption"]
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
        label       = "Bucket Name"
        expression  = "detail.requestParameters.bucketName"
      }
      notifications {
        slack_webhook {
          room_id   = "${var.slack_webhook_id}"
        }
      }
    }
  }
}

resource "gorillastack_rule" "s3_put_bucket_acl" {
  name      = "Catch changes to your bucket acls"
  labels    = ["terraform", "cloudtrail", "s3", "bucket", "acl"]
  enabled   = true

  context {
    aws {
    }
  }

  trigger {
    cloudtrail_event {
      match_fields {
        event_name = ["PutBucketAcl"]
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
        label       = "Bucket Name"
        expression  = "detail.requestParameters.bucketName"
      }
      notifications {
        slack_webhook {
          room_id   = "${var.slack_webhook_id}"
        }
      }
    }
  }
}

resource "gorillastack_rule" "s3_delete_bucket_tagging" {
  name      = "Catch tags being deleted from your buckets"
  labels    = ["terraform", "cloudtrail", "s3", "bucket", "tagging"]
  enabled   = true

  context {
    aws {
    }
  }

  trigger {
    cloudtrail_event {
      match_fields {
        event_name = ["DeleteBucketTagging"]
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
        label       = "Bucket Name"
        expression  = "detail.requestParameters.bucketName"
      }
      notifications {
        slack_webhook {
          room_id   = "${var.slack_webhook_id}"
        }
      }
    }
  }
}

resource "gorillastack_rule" "s3_bucket_public_access_block" {
  name      = "Catch all changes to your public access block settings on buckets"
  labels    = ["terraform", "cloudtrail", "s3", "bucket", "public-access-block"]
  enabled   = true

  context {
    aws {
    }
  }

  trigger {
    cloudtrail_event {
      match_fields {
        event_name = ["PutBucketPublicAccessBlock"]
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
        label       = "Bucket Name"
        expression  = "detail.requestParameters.bucketName"
      }
      notifications {
        slack_webhook {
          room_id   = "${var.slack_webhook_id}"
        }
      }
    }
  }
}