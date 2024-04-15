import json

def lambda_handler(event, context):

# extract the two numbers from the Lambda service's event object
    #mathResult = math.pow(int(event['base']), int(event['exponent']))
    result = int(event['bill']) * int(event['disc']) / 100
    final = int(event['bill']) - result

    # return a properly formatted JSON object
    return {
    'statusCode': 200,
    'body': json.dumps('Discounted Total is ' + str(final))
    }

# config test event
# {
#   "bill": 200,
#   "disc": 10
# }