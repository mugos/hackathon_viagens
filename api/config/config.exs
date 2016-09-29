# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# Exported port
config :chat_web, :port, 80

# Kafka
# config :kafka_ex,
#   # the default consumer group for worker processes, must be a binary (string)
#   #    NOTE if you are on Kafka < 0.8.2 or if you want to disable the use of
#   #    consumer groups, set this to :no_consumer_group (this is the
#   #    only exception to the requirement that this value be a binary)
#   consumer_group: "kafka_ex",
#   # consumer_group: :no_consumer_group,
#   # Set this value to true if you do not want the default
#   # `KafkaEx.Server` worker to start during application start-up -
#   # i.e., if you want to start your own set of named workers
#   disable_default_worker: false,
#   # Timeout value, in msec, for synchronous operations (e.g., network calls)
#   sync_timeout: 3000,
#   # Supervision max_restarts - the maximum amount of restarts allowed in a time frame
#   max_restarts: 10,
#   # Supervision max_seconds -  the time frame in which :max_restarts applies
#   max_seconds: 60,
#   # Kafka version
#   kafka_version: "0.10.0.1"

# Influx configs
# config :fluxter,
#   host: "influx",
#   port: 8086

# case Mix.env do
#   :prod ->
#     # a list of brokers to connect to in {"HOST", port} format
#     config :kafka_ex, brokers: [
#       { "10.195.250.1", 9092 }
#     ]
#   _ ->
#     config :kafka_ex, brokers: [
#       { "kafka", 9092 }
#       # {"kafka", 9093},
#       # {"kafka", 9094},
#     ]
# end

# https://github.com/ueberauth/guardian#secret-key
# config :guardian, Guardian,
#   # allowed_algos: ["HS512"], # optional
#   # verify_module: Guardian.JWT,  # optional
#   issuer: "ChatWeb",
#   ttl: { 30, :days },
#   # verify_issuer: true, # optional
#   secret_key: "felicificguesthousesreflectivelybattologisedunderdivemsinonreactivelucretiussortably",
#   serializer: ChatWeb.Auth.GuardianSerializer

