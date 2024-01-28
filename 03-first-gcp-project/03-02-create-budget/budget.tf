data "google_billing_account" "this" {
  billing_account = var.billing_account_id
}

resource "google_billing_budget" "this" {
  billing_account = data.google_billing_account.this.id
  display_name = "Basic billing"
  budget_filter {
    projects = ["projects/${local.gcp.project}"]
  }
  amount {
    specified_amount {
      currency_code = "PLN"
      units = "100"
    }
  }
  threshold_rules {
      threshold_percent =  0.5
  }
  threshold_rules {
      threshold_percent =  0.75
  }
  threshold_rules {
      threshold_percent =  0.9
  }
}
