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

  id   = "amazonsqs"
  name = "Amazon SQS/SNS"

  details = "It uses the [Amazon SQS](https://aws.amazon.com/sqs/) and [Amazon SNS](https://aws.amazon.com/sns/) services."
}

module "pubsub_repo_amqp" {
  source = "./modules/pubsub_repo"

  id   = "amqp"
  name = "AMQP"
}

module "pubsub_repo_bolt" {
  source = "./modules/pubsub_repo"

  id   = "bolt"
  name = "Bolt"

  details = "It uses the [Bolt](https://github.com/etcd-io/bbolt) database."
}

module "pubsub_repo_firestore" {
  source = "./modules/pubsub_repo"

  id   = "firestore"
  name = "Firestore"

  details = "It uses the [Firestore](https://firebase.google.com/docs/firestore) database."
}

module "pubsub_repo_googlecloud" {
  source = "./modules/pubsub_repo"

  id   = "googlecloud"
  name = "Google Cloud Pub/Sub"

  details = "It uses the [Google Cloud Pub/Sub](https://cloud.google.com/pubsub) service."
}

module "pubsub_repo_http" {
  source = "./modules/pubsub_repo"

  id   = "http"
  name = "HTTP"
}

module "pubsub_repo_io" {
  source = "./modules/pubsub_repo"

  id   = "io"
  name = "IO"
}

module "pubsub_repo_kafka" {
  source = "./modules/pubsub_repo"

  id   = "kafka"
  name = "Kafka"
}

module "pubsub_repo_nats" {
  source = "./modules/pubsub_repo"

  id   = "nats"
  name = "NATS"

  details = "It targets NATS - primarily streaming use cases via [JetStream](https://docs.nats.io/nats-concepts/jetstream)."

}

module "pubsub_repo_redisstream" {
  source = "./modules/pubsub_repo"

  id   = "redisstream"
  name = "Redis"

  default_branch = "main"
}

module "pubsub_repo_sql" {
  source = "./modules/pubsub_repo"

  id   = "sql"
  name = "SQL (Postgres/MySQL)"
}
