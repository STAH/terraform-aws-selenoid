terraform {
  required_version = ">= 0.12"

  required_providers {
    github = ">= 2.6"
  }
}

provider github {
  anonymous  = true
  individual = true
}

data github_user me {
  username = "4ops"
}
