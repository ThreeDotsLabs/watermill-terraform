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

  details = <<EOT
It uses the [Amazon SQS](https://aws.amazon.com/sqs/) and [Amazon SNS](https://aws.amazon.com/sns/) services.
EOT
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

  details = <<EOT
It uses the [Google Cloud Pub/Sub](https://cloud.google.com/pubsub) service.

### Testing Locally

The tests expect a running instance of PubSub. You can run the emulator specified in the `docker-compose.yml`, then set the correct env variable by running the following:
```
make up
PUBSUB_EMULATOR_HOST=localhost:8085 make test
```

Running one test:

```
make up
PUBSUB_EMULATOR_HOST=localhost:8085 go test -v ./... -run TestPublishSubscribe/TestContinueAfterSubscribeClose
```
EOT

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

  details = <<EOT
It targets NATS - primarily streaming use cases via [JetStream](https://docs.nats.io/nats-concepts/jetstream).

It contains two packages, `/pkg/nats` being the current primary implementation.  This supports JetStream
(default) and also some messaging use cases with core NATS but those aren't a perfect fit for watermill due
to fire and forget nature of the system - acks and nacks for example are implemented as no-ops in that mode.
However if you accept the limitations it does open up some interesting options, for example a system with
publishers that don't require confirmation could use the core NATS mode but send to subjects included in JetStream
subscriptions.  This lies far enough outside the streaming use cases of watermill that its included in an
experimental fashion only but should work if resources are provisioned correctly.  It can be nice to use watermill
as the sole interface to NATS in such a system if eg request/reply is not needed.

There is also an experimental `/pkg/jetstream` package that tracks with the experimental upstream
[JetStream API](https://github.com/nats-io/nats.go/blob/main/jetstream/README.md).  This is targeted for a
stable API within watermill by v2.1 of this package.  Right now it only supports a very minimal configuration
subset but does make an effort to preserve lower level access to the underlying stream provisioning API.  You can
see an example [here](./_examples/jetstream_new.go).
EOT

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
