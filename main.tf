provider "aws" {
    region = "us-east-1"
}

resource "aws_dynamodb_table" "airline_table" {
  name           = "ingestion_dynamo_airlines"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "iata"
  range_key      = "airline"

  attribute {
    name = "iata"
    type = "S"
  }

  attribute {
    name = "airline"
    type = "S"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = false
  }
}

output "dynamo_arn" {
    value = aws_dynamodb_table.airline_table.arn
    description = "Dynamo DB arn"
}
