# Create EventBridge rule to trigger Lambda every 3 minutes
resource "aws_cloudwatch_event_rule" "every_3_minutes_rule" {
  name        = "${var.project}-rule"
  description = "Event rule to trigger sg-auto-lambda every 3 minutes"
  schedule_expression = "rate(3 minutes)"
  
}

# Create permissions for EventBridge to invoke Lambda
resource "aws_lambda_permission" "eventbridge_permission" {
  statement_id  = "AllowEventBridgeInvoke"
  action        = "lambda:InvokeFunction"
  function_name = module.lambda.lambda_function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.every_3_minutes_rule.arn
}

# Create target for EventBridge rule to invoke Lambda
resource "aws_cloudwatch_event_target" "invoke_lambda_target" {
  rule      = aws_cloudwatch_event_rule.every_3_minutes_rule.name
  target_id = "InvokeLambdaTarget"
  arn       = module.lambda.lambda_function_arn

  depends_on = [ module.lambda ]
}