terraform {
  backend "gcs" {
    bucket = "watermill-terraform-state"
  }
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {
  owner = "ThreeDotsLabs"
}

module "pubsub_repo_amazonsqs" {
  source = "./modules/pubsub_repo"

  id          = "amazonsqs"
  name        = "Amazon SQS/SNS"
  description = ""
  url         = ""
}

module "pubsub_repo_amqp" {
  source = "./modules/pubsub_repo"

  id          = "amqp"
  name        = "AMQP"
  description = ""
  url         = ""
}

module "pubsub_repo_bolt" {
  source = "./modules/pubsub_repo"

  id          = "bolt"
  name        = "Bolt"
  description = ""
  url         = ""
}

module "pubsub_repo_firestore" {
  source = "./modules/pubsub_repo"

  id          = "firestore"
  name        = "Firestore"
  description = ""
  url         = ""
}

module "pubsub_repo_googlecloud" {
  source = "./modules/pubsub_repo"

  id          = "googlecloud"
  name        = "Google Cloud Pub/Sub"
  description = ""
  url         = ""
}

module "pubsub_repo_http" {
  source = "./modules/pubsub_repo"

  id          = "http"
  name        = "HTTP"
  description = ""
  url         = ""
}

module "pubsub_repo_io" {
  source = "./modules/pubsub_repo"

  id          = "io"
  name        = "IO"
  description = ""
  url         = ""
}

module "pubsub_repo_kafka" {
  source = "./modules/pubsub_repo"

  id          = "kafka"
  name        = "Kafka"
  description = ""
  url         = ""
}

module "pubsub_repo_nats" {
  source = "./modules/pubsub_repo"

  id          = "nats"
  name        = "NATS"
  description = ""
  url         = ""
}

module "pubsub_repo_redisstream" {
  source = "./modules/pubsub_repo"

  id          = "redisstream"
  name        = "Redis"
  description = ""
  url         = ""
}

module "pubsub_repo_sql" {
  source = "./modules/pubsub_repo"

  id          = "sql"
  name        = "SQL (Postgres/MySQL)"
  description = ""
  url         = ""
}
