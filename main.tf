provider "aws" {
    region = "us-east-1"
}

resource "aws_dynamodb_table" "airline_table" {
  name           = "cache_dynamo_flights"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "airline_iata"
  range_key      = "flight_number"

  attribute {
    name = "airline_iata"
    type = "S"
  }

  attribute {
    name = "flight_number"
    type = "N"
  }

  ttl {
    attribute_name = "TimeToExist"
    enabled        = true
  }
}

output "dynamo_arn" {
    value = aws_dynamodb_table.airline_table.arn
    description = "Dynamo DB arn"
}
