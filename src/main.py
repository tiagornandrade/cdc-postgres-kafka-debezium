import apache_beam as beam
from apache_beam.options.pipeline_options import PipelineOptions
from beam_nuggets.io.kafkaio import KafkaConsume
import json


def run(argv=None):
    pipeline_options = PipelineOptions()
    pipeline = beam.Pipeline(options=pipeline_options)
    kafka_config = {
        'bootstrap_servers': 'localhost:9092',
        'topics': ['postgres.public.user_profile'],
        'group_id': 'group1',
        'auto_offset_reset': 'earliest',
        'enable_auto_commit': True,
        'value_deserializer': lambda x: json.loads(x.decode('utf-8'))
    }
    (pipeline
     | KafkaConsume(consumer_config=kafka_config)
     | beam.Map(print)
     )
    pipeline.run().wait_until_finish()