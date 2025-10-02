variable "dynamodb_table" {
  description = "The name of the DynamoDB table"
  type        = string
  default     = "remote-state-lock-table"
  
}
