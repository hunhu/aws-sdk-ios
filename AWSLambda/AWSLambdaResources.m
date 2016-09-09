//
// Copyright 2010-2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSLambdaResources.h"
#import "AWSLogging.h"

@interface AWSLambdaResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSLambdaResources

+ (instancetype)sharedInstance {
    static AWSLambdaResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSLambdaResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2015-03-31\",\
    \"endpointPrefix\":\"lambda\",\
    \"protocol\":\"rest-json\",\
    \"serviceFullName\":\"AWS Lambda\",\
    \"signatureVersion\":\"v4\"\
  },\
  \"operations\":{\
    \"AddPermission\":{\
      \"name\":\"AddPermission\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/policy\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"AddPermissionRequest\"},\
      \"output\":{\"shape\":\"AddPermissionResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"PolicyLengthExceededException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Adds a permission to the resource policy associated with the specified AWS Lambda function. You use resource policies to grant permissions to event sources that use <i>push</i> model. In a <i>push</i> model, event sources (such as Amazon S3 and custom applications) invoke your Lambda function. Each permission you add to the resource policy allows an event source, permission to invoke the Lambda function. </p> <p>For information about the push model, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/lambda-introduction.html\\\">AWS Lambda: How it Works</a>. </p> <p>If you are using versioning, the permissions you add are specific to the Lambda function version or alias you specify in the <code>AddPermission</code> request via the <code>Qualifier</code> parameter. For more information about versioning, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">AWS Lambda Function Versioning and Aliases</a>. </p> <p>This operation requires permission for the <code>lambda:AddPermission</code> action.</p>\"\
    },\
    \"CreateAlias\":{\
      \"name\":\"CreateAlias\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/aliases\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"CreateAliasRequest\"},\
      \"output\":{\"shape\":\"AliasConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Creates an alias that points to the specified Lambda function version. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/aliases-intro.html\\\">Introduction to AWS Lambda Aliases</a>.</p> Alias names are unique for a given function. <p>This requires permission for the lambda:CreateAlias action.</p>\"\
    },\
    \"CreateEventSourceMapping\":{\
      \"name\":\"CreateEventSourceMapping\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2015-03-31/event-source-mappings/\",\
        \"responseCode\":202\
      },\
      \"input\":{\"shape\":\"CreateEventSourceMappingRequest\"},\
      \"output\":{\"shape\":\"EventSourceMappingConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Identifies a stream as an event source for a Lambda function. It can be either an Amazon Kinesis stream or an Amazon DynamoDB stream. AWS Lambda invokes the specified function when records are posted to the stream.</p> <p>This association between a stream source and a Lambda function is called the event source mapping. </p> <important>This event source mapping is relevant only in the AWS Lambda pull model, where AWS Lambda invokes the function. For more information, go to <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/lambda-introduction.html\\\">AWS Lambda: How it Works</a> in the <i>AWS Lambda Developer Guide</i>.</important> <p> You provide mapping information (for example, which stream to read from and which Lambda function to invoke) in the request body. </p> <p> Each event source, such as an Amazon Kinesis or a DynamoDB stream, can be associated with multiple AWS Lambda function. A given Lambda function can be associated with multiple AWS event sources. </p> <p> <p>If you are using versioning, you can specify a specific function version or an alias via the function name parameter. For more information about versioning, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">AWS Lambda Function Versioning and Aliases</a>. </p> </p> <p>This operation requires permission for the <code>lambda:CreateEventSourceMapping</code> action.</p>\"\
    },\
    \"CreateFunction\":{\
      \"name\":\"CreateFunction\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2015-03-31/functions\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"CreateFunctionRequest\"},\
      \"output\":{\"shape\":\"FunctionConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceConflictException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"CodeStorageExceededException\"}\
      ],\
      \"documentation\":\"<p>Creates a new Lambda function. The function metadata is created from the request parameters, and the code for the function is provided by a .zip file in the request body. If the function name already exists, the operation will fail. Note that the function name is case-sensitive. </p> <p> If you are using versioning, you can also publish a version of the Lambda function you are creating using the <code>Publish</code> parameter. For more information about versioning, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">AWS Lambda Function Versioning and Aliases</a>. </p> <p>This operation requires permission for the <code>lambda:CreateFunction</code> action.</p>\"\
    },\
    \"DeleteAlias\":{\
      \"name\":\"DeleteAlias\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/aliases/{Name}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"DeleteAliasRequest\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified Lambda function alias. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/aliases-intro.html\\\">Introduction to AWS Lambda Aliases</a>.</p> <p>This requires permission for the lambda:DeleteAlias action.</p>\"\
    },\
    \"DeleteEventSourceMapping\":{\
      \"name\":\"DeleteEventSourceMapping\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/2015-03-31/event-source-mappings/{UUID}\",\
        \"responseCode\":202\
      },\
      \"input\":{\"shape\":\"DeleteEventSourceMappingRequest\"},\
      \"output\":{\"shape\":\"EventSourceMappingConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Removes an event source mapping. This means AWS Lambda will no longer invoke the function for events in the associated source.</p> <p>This operation requires permission for the <code>lambda:DeleteEventSourceMapping</code> action.</p>\"\
    },\
    \"DeleteFunction\":{\
      \"name\":\"DeleteFunction\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"DeleteFunctionRequest\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"ResourceConflictException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified Lambda function code and configuration.</p> <p>If you are using the versioning feature and you don't specify a function version in your <code>DeleteFunction</code> request, AWS Lambda will delete the function, including all its versions, and any aliases pointing to the function versions. To delete a specific function version, you must provide the function version via the <code>Qualifier</code> parameter. For information about function versioning, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">AWS Lambda Function Versioning and Aliases</a>. </p> <p>When you delete a function the associated resource policy is also deleted. You will need to delete the event source mappings explicitly.</p> <p>This operation requires permission for the <code>lambda:DeleteFunction</code> action.</p>\"\
    },\
    \"GetAlias\":{\
      \"name\":\"GetAlias\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/aliases/{Name}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetAliasRequest\"},\
      \"output\":{\"shape\":\"AliasConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Returns the specified alias information such as the alias ARN, description, and function version it is pointing to. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/aliases-intro.html\\\">Introduction to AWS Lambda Aliases</a>.</p> <p>This requires permission for the <code>lambda:GetAlias</code> action.</p>\"\
    },\
    \"GetEventSourceMapping\":{\
      \"name\":\"GetEventSourceMapping\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2015-03-31/event-source-mappings/{UUID}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetEventSourceMappingRequest\"},\
      \"output\":{\"shape\":\"EventSourceMappingConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Returns configuration information for the specified event source mapping (see <a>CreateEventSourceMapping</a>).</p> <p>This operation requires permission for the <code>lambda:GetEventSourceMapping</code> action.</p>\"\
    },\
    \"GetFunction\":{\
      \"name\":\"GetFunction\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetFunctionRequest\"},\
      \"output\":{\"shape\":\"GetFunctionResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidParameterValueException\"}\
      ],\
      \"documentation\":\"<p>Returns the configuration information of the Lambda function and a presigned URL link to the .zip file you uploaded with <a>CreateFunction</a> so you can download the .zip file. Note that the URL is valid for up to 10 minutes. The configuration information is the same information you provided as parameters when uploading the function.</p> <p>Using the optional <code>Qualifier</code> parameter, you can specify a specific function version for which you want this information. If you don't specify this parameter, the API uses unqualified function ARN which return information about the <code>$LATEST</code> version of the Lambda function. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">AWS Lambda Function Versioning and Aliases</a>.</p> <p>This operation requires permission for the <code>lambda:GetFunction</code> action.</p>\"\
    },\
    \"GetFunctionConfiguration\":{\
      \"name\":\"GetFunctionConfiguration\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/configuration\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetFunctionConfigurationRequest\"},\
      \"output\":{\"shape\":\"FunctionConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidParameterValueException\"}\
      ],\
      \"documentation\":\"<p>Returns the configuration information of the Lambda function. This the same information you provided as parameters when uploading the function by using <a>CreateFunction</a>.</p> <p>If you are using the versioning feature, you can retrieve this information for a specific function version by using the optional <code>Qualifier</code> parameter and specifying the function version or alias that points to it. If you don't provide it, the API returns information about the $LATEST version of the function. For more information about versioning, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">AWS Lambda Function Versioning and Aliases</a>.</p> <p>This operation requires permission for the <code>lambda:GetFunctionConfiguration</code> operation.</p>\"\
    },\
    \"GetPolicy\":{\
      \"name\":\"GetPolicy\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/policy\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"GetPolicyRequest\"},\
      \"output\":{\"shape\":\"GetPolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidParameterValueException\"}\
      ],\
      \"documentation\":\"<p>Returns the resource policy associated with the specified Lambda function.</p> <p> If you are using the versioning feature, you can get the resource policy associated with the specific Lambda function version or alias by specifying the version or alias name using the <code>Qualifier</code> parameter. For more information about versioning, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">AWS Lambda Function Versioning and Aliases</a>. </p> <p>For information about adding permissions, see <a>AddPermission</a>.</p> <p>You need permission for the <code>lambda:GetPolicy action.</code></p>\"\
    },\
    \"Invoke\":{\
      \"name\":\"Invoke\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/invocations\"\
      },\
      \"input\":{\"shape\":\"InvocationRequest\"},\
      \"output\":{\"shape\":\"InvocationResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestContentException\"},\
        {\"shape\":\"RequestTooLargeException\"},\
        {\"shape\":\"UnsupportedMediaTypeException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"EC2UnexpectedException\"},\
        {\"shape\":\"SubnetIPAddressLimitReachedException\"},\
        {\"shape\":\"ENILimitReachedException\"},\
        {\"shape\":\"EC2ThrottledException\"},\
        {\"shape\":\"EC2AccessDeniedException\"},\
        {\"shape\":\"InvalidSubnetIDException\"},\
        {\"shape\":\"InvalidSecurityGroupIDException\"}\
      ],\
      \"documentation\":\"<p> Invokes a specific Lambda function. </p> <p>If you are using the versioning feature, you can invoke the specific function version by providing function version or alias name that is pointing to the function version using the <code>Qualifier</code> parameter in the request. If you don't provide the <code>Qualifier</code> parameter, the <code>$LATEST</code> version of the Lambda function is invoked. For information about the versioning feature, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">AWS Lambda Function Versioning and Aliases</a>. </p> <p>This operation requires permission for the <code>lambda:InvokeFunction</code> action.</p>\"\
    },\
    \"InvokeAsync\":{\
      \"name\":\"InvokeAsync\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2014-11-13/functions/{FunctionName}/invoke-async/\",\
        \"responseCode\":202\
      },\
      \"input\":{\"shape\":\"InvokeAsyncRequest\"},\
      \"output\":{\"shape\":\"InvokeAsyncResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidRequestContentException\"}\
      ],\
      \"documentation\":\"<important>This API is deprecated. We recommend you use <code>Invoke</code> API (see <a>Invoke</a>).</important> <p>Submits an invocation request to AWS Lambda. Upon receiving the request, Lambda executes the specified function asynchronously. To see the logs generated by the Lambda function execution, see the CloudWatch Logs console.</p> <p>This operation requires permission for the <code>lambda:InvokeFunction</code> action.</p>\",\
      \"deprecated\":true\
    },\
    \"ListAliases\":{\
      \"name\":\"ListAliases\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/aliases\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListAliasesRequest\"},\
      \"output\":{\"shape\":\"ListAliasesResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Returns list of aliases created for a Lambda function. For each alias, the response includes information such as the alias ARN, description, alias name, and the function version to which it points. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/aliases-intro.html\\\">Introduction to AWS Lambda Aliases</a>.</p> <p>This requires permission for the lambda:ListAliases action.</p>\"\
    },\
    \"ListEventSourceMappings\":{\
      \"name\":\"ListEventSourceMappings\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2015-03-31/event-source-mappings/\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListEventSourceMappingsRequest\"},\
      \"output\":{\"shape\":\"ListEventSourceMappingsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of event source mappings you created using the <code>CreateEventSourceMapping</code> (see <a>CreateEventSourceMapping</a>). </p> <p>For each mapping, the API returns configuration information. You can optionally specify filters to retrieve specific event source mappings.</p> <p>If you are using the versioning feature, you can get list of event source mappings for a specific Lambda function version or an alias as described in the <code>FunctionName</code> parameter. For information about the versioning feature, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">AWS Lambda Function Versioning and Aliases</a>. </p> <p>This operation requires permission for the <code>lambda:ListEventSourceMappings</code> action.</p>\"\
    },\
    \"ListFunctions\":{\
      \"name\":\"ListFunctions\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2015-03-31/functions/\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListFunctionsRequest\"},\
      \"output\":{\"shape\":\"ListFunctionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of your Lambda functions. For each function, the response includes the function configuration information. You must use <a>GetFunction</a> to retrieve the code for your function.</p> <p>This operation requires permission for the <code>lambda:ListFunctions</code> action.</p> <p>If you are using versioning feature, the response returns list of $LATEST versions of your functions. For information about the versioning feature, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">AWS Lambda Function Versioning and Aliases</a>. </p>\"\
    },\
    \"ListVersionsByFunction\":{\
      \"name\":\"ListVersionsByFunction\",\
      \"http\":{\
        \"method\":\"GET\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/versions\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"ListVersionsByFunctionRequest\"},\
      \"output\":{\"shape\":\"ListVersionsByFunctionResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>List all versions of a function. For information about the versioning feature, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">AWS Lambda Function Versioning and Aliases</a>. </p>\"\
    },\
    \"PublishVersion\":{\
      \"name\":\"PublishVersion\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/versions\",\
        \"responseCode\":201\
      },\
      \"input\":{\"shape\":\"PublishVersionRequest\"},\
      \"output\":{\"shape\":\"FunctionConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"CodeStorageExceededException\"}\
      ],\
      \"documentation\":\"<p>Publishes a version of your function from the current snapshot of $LATEST. That is, AWS Lambda takes a snapshot of the function code and configuration information from $LATEST and publishes a new version. The code and configuration cannot be modified after publication. For information about the versioning feature, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">AWS Lambda Function Versioning and Aliases</a>. </p>\"\
    },\
    \"RemovePermission\":{\
      \"name\":\"RemovePermission\",\
      \"http\":{\
        \"method\":\"DELETE\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/policy/{StatementId}\",\
        \"responseCode\":204\
      },\
      \"input\":{\"shape\":\"RemovePermissionRequest\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>You can remove individual permissions from an resource policy associated with a Lambda function by providing a statement ID that you provided when you added the permission. </p> <p>If you are using versioning, the permissions you remove are specific to the Lambda function version or alias you specify in the <code>AddPermission</code> request via the <code>Qualifier</code> parameter. For more information about versioning, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">AWS Lambda Function Versioning and Aliases</a>. </p> <p>Note that removal of a permission will cause an active event source to lose permission to the function. </p> <p>You need permission for the <code>lambda:RemovePermission</code> action.</p>\"\
    },\
    \"UpdateAlias\":{\
      \"name\":\"UpdateAlias\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/aliases/{Name}\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"UpdateAliasRequest\"},\
      \"output\":{\"shape\":\"AliasConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Using this API you can update the function version to which the alias points and the alias description. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/aliases-intro.html\\\">Introduction to AWS Lambda Aliases</a>.</p> <p>This requires permission for the lambda:UpdateAlias action.</p>\"\
    },\
    \"UpdateEventSourceMapping\":{\
      \"name\":\"UpdateEventSourceMapping\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/2015-03-31/event-source-mappings/{UUID}\",\
        \"responseCode\":202\
      },\
      \"input\":{\"shape\":\"UpdateEventSourceMappingRequest\"},\
      \"output\":{\"shape\":\"EventSourceMappingConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceConflictException\"}\
      ],\
      \"documentation\":\"<p>You can update an event source mapping. This is useful if you want to change the parameters of the existing mapping without losing your position in the stream. You can change which function will receive the stream records, but to change the stream itself, you must create a new mapping. </p> <p>If you are using the versioning feature, you can update the event source mapping to map to a specific Lambda function version or alias as described in the <code>FunctionName</code> parameter. For information about the versioning feature, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">AWS Lambda Function Versioning and Aliases</a>. </p> <p>If you disable the event source mapping, AWS Lambda stops polling. If you enable again, it will resume polling from the time it had stopped polling, so you don't lose processing of any records. However, if you delete event source mapping and create it again, it will reset.</p> <p>This operation requires permission for the <code>lambda:UpdateEventSourceMapping</code> action.</p>\"\
    },\
    \"UpdateFunctionCode\":{\
      \"name\":\"UpdateFunctionCode\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/code\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"UpdateFunctionCodeRequest\"},\
      \"output\":{\"shape\":\"FunctionConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"CodeStorageExceededException\"}\
      ],\
      \"documentation\":\"<p> Updates the code for the specified Lambda function. This operation must only be used on an existing Lambda function and cannot be used to update the function configuration. </p> <p>If you are using the versioning feature, note this API will always update the $LATEST version of your Lambda function. For information about the versioning feature, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">AWS Lambda Function Versioning and Aliases</a>. </p> <p>This operation requires permission for the <code>lambda:UpdateFunctionCode</code> action.</p>\"\
    },\
    \"UpdateFunctionConfiguration\":{\
      \"name\":\"UpdateFunctionConfiguration\",\
      \"http\":{\
        \"method\":\"PUT\",\
        \"requestUri\":\"/2015-03-31/functions/{FunctionName}/configuration\",\
        \"responseCode\":200\
      },\
      \"input\":{\"shape\":\"UpdateFunctionConfigurationRequest\"},\
      \"output\":{\"shape\":\"FunctionConfiguration\"},\
      \"errors\":[\
        {\"shape\":\"ServiceException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterValueException\"},\
        {\"shape\":\"TooManyRequestsException\"}\
      ],\
      \"documentation\":\"<p>Updates the configuration parameters for the specified Lambda function by using the values provided in the request. You provide only the parameters you want to change. This operation must only be used on an existing Lambda function and cannot be used to update the function's code. </p> <p>If you are using the versioning feature, note this API will always update the $LATEST version of your Lambda function. For information about the versioning feature, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">AWS Lambda Function Versioning and Aliases</a>. </p> <p>This operation requires permission for the <code>lambda:UpdateFunctionConfiguration</code> action.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"Action\":{\
      \"type\":\"string\",\
      \"pattern\":\"(lambda:[*]|lambda:[a-zA-Z]+|[*])\"\
    },\
    \"AddPermissionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionName\",\
        \"StatementId\",\
        \"Action\",\
        \"Principal\"\
      ],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>Name of the Lambda function whose resource policy you are updating by adding a new permission.</p> <p> You can specify a function name (for example, <code>Thumbnail</code>) or you can specify Amazon Resource Name (ARN) of the function (for example, <code>arn:aws:lambda:us-west-2:account-id:function:ThumbNail</code>). AWS Lambda also allows you to specify partial ARN (for example, <code>account-id:Thumbnail</code>). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"StatementId\":{\
          \"shape\":\"StatementId\",\
          \"documentation\":\"<p>A unique statement identifier.</p>\"\
        },\
        \"Action\":{\
          \"shape\":\"Action\",\
          \"documentation\":\"<p>The AWS Lambda action you want to allow in this statement. Each Lambda action is a string starting with <code>lambda:</code> followed by the API name (see <a>Operations</a>). For example, <code>lambda:CreateFunction</code>. You can use wildcard (<code>lambda:*</code>) to grant permission for all AWS Lambda actions. </p>\"\
        },\
        \"Principal\":{\
          \"shape\":\"Principal\",\
          \"documentation\":\"<p>The principal who is getting this permission. It can be Amazon S3 service Principal (<code>s3.amazonaws.com</code>) if you want Amazon S3 to invoke the function, an AWS account ID if you are granting cross-account permission, or any valid AWS service principal such as <code>sns.amazonaws.com</code>. For example, you might want to allow a custom application in another AWS account to push events to AWS Lambda by invoking your function. </p>\"\
        },\
        \"SourceArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>This is optional; however, when granting Amazon S3 permission to invoke your function, you should specify this field with the bucket Amazon Resource Name (ARN) as its value. This ensures that only events generated from the specified bucket can invoke the function. </p> <important>If you add a permission for the Amazon S3 principal without providing the source ARN, any AWS account that creates a mapping to your function ARN can send events to invoke your Lambda function from Amazon S3.</important>\"\
        },\
        \"SourceAccount\":{\
          \"shape\":\"SourceOwner\",\
          \"documentation\":\"<p>The AWS account ID (without a hyphen) of the source owner. For example, if the <code>SourceArn</code> identifies a bucket, then this is the bucket owner's account ID. You can use this additional condition to ensure the bucket you specify is owned by a specific account (it is possible the bucket owner deleted the bucket and some other AWS account created the bucket). You can also use this condition to specify all sources (that is, you don't specify the <code>SourceArn</code>) owned by a specific account. </p>\"\
        },\
        \"EventSourceToken\":{\"shape\":\"EventSourceToken\"},\
        \"Qualifier\":{\
          \"shape\":\"Qualifier\",\
          \"documentation\":\"<p>You can use this optional query parameter to describe a qualified ARN using a function version or an alias name. The permission will then apply to the specific qualified ARN. For example, if you specify function version 2 as the qualifier, then permission applies only when request is made using qualified function ARN: </p> <p><code>arn:aws:lambda:aws-region:acct-id:function:function-name:2</code></p> <p>If you specify an alias name, for example <code>PROD</code>, then the permission is valid only for requests made using the alias ARN:</p> <p><code>arn:aws:lambda:aws-region:acct-id:function:function-name:PROD</code></p> <p>If the qualifier is not specified, the permission is valid only when requests is made using unqualified function ARN. </p> <p><code>arn:aws:lambda:aws-region:acct-id:function:function-name</code></p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        }\
      }\
    },\
    \"AddPermissionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Statement\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The permission statement you specified in the request. The response returns the same as a string using a backslash (\\\"\\\\\\\") as an escape character in the JSON. </p>\"\
        }\
      }\
    },\
    \"Alias\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"(?!^[0-9]+$)([a-zA-Z0-9-_]+)\"\
    },\
    \"AliasConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"AliasArn\":{\
          \"shape\":\"FunctionArn\",\
          \"documentation\":\"<p>Lambda function ARN that is qualified using the alias name as the suffix. For example, if you create an alias called <code>BETA</code> that points to a helloworld function version, the ARN is <code>arn:aws:lambda:aws-regions:acct-id:function:helloworld:BETA</code>.</p>\"\
        },\
        \"Name\":{\
          \"shape\":\"Alias\",\
          \"documentation\":\"<p>Alias name.</p>\"\
        },\
        \"FunctionVersion\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>Function version to which the alias points.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>Alias description.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides configuration information about a Lambda function version alias.</p>\"\
    },\
    \"AliasList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AliasConfiguration\"}\
    },\
    \"Arn\":{\
      \"type\":\"string\",\
      \"pattern\":\"arn:aws:([a-zA-Z0-9\\\\-])+:([a-z]{2}-[a-z]+-\\\\d{1})?:(\\\\d{12})?:(.*)\"\
    },\
    \"BatchSize\":{\
      \"type\":\"integer\",\
      \"max\":10000,\
      \"min\":1\
    },\
    \"Blob\":{\"type\":\"blob\"},\
    \"BlobStream\":{\
      \"type\":\"blob\",\
      \"streaming\":true\
    },\
    \"Boolean\":{\"type\":\"boolean\"},\
    \"CodeStorageExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>You have exceeded your maximum total code size per account. <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/limits.html\\\">Limits</a> </p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"CreateAliasRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionName\",\
        \"Name\",\
        \"FunctionVersion\"\
      ],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>Name of the Lambda function for which you want to create an alias. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Name\":{\
          \"shape\":\"Alias\",\
          \"documentation\":\"<p>Name for the alias you are creating.</p>\"\
        },\
        \"FunctionVersion\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>Lambda function version for which you are creating the alias.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>Description of the alias.</p>\"\
        }\
      }\
    },\
    \"CreateEventSourceMappingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EventSourceArn\",\
        \"FunctionName\",\
        \"StartingPosition\"\
      ],\
      \"members\":{\
        \"EventSourceArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Kinesis or the Amazon DynamoDB stream that is the event source. Any record added to this stream could cause AWS Lambda to invoke your Lambda function, it depends on the <code>BatchSize</code>. AWS Lambda POSTs the Amazon Kinesis event, containing records, to your Lambda function as JSON.</p>\"\
        },\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The Lambda function to invoke when AWS Lambda detects an event on the stream.</p> <p> You can specify the function name (for example, <code>Thumbnail</code>) or you can specify Amazon Resource Name (ARN) of the function (for example, <code>arn:aws:lambda:us-west-2:account-id:function:ThumbNail</code>). </p> <p> If you are using versioning, you can also provide a qualified function ARN (ARN that is qualified with function version or alias name as suffix). For more information about versioning, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">AWS Lambda Function Versioning and Aliases</a> </p> <p>AWS Lambda also allows you to specify only the function name with the account ID qualifier (for example, <code>account-id:Thumbnail</code>). </p> <p> Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\"\
        },\
        \"Enabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Indicates whether AWS Lambda should begin polling the event source. By default, <code>Enabled</code> is true. </p>\"\
        },\
        \"BatchSize\":{\
          \"shape\":\"BatchSize\",\
          \"documentation\":\"<p>The largest number of records that AWS Lambda will retrieve from your event source at the time of invoking your function. Your function receives an event with all the retrieved records. The default is 100 records.</p>\"\
        },\
        \"StartingPosition\":{\
          \"shape\":\"EventSourcePosition\",\
          \"documentation\":\"<p>The position in the stream where AWS Lambda should start reading. For more information, go to <a href=\\\"http://docs.aws.amazon.com/kinesis/latest/APIReference/API_GetShardIterator.html#Kinesis-GetShardIterator-request-ShardIteratorType\\\">ShardIteratorType</a> in the <i>Amazon Kinesis API Reference</i>. </p>\"\
        }\
      }\
    },\
    \"CreateFunctionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionName\",\
        \"Runtime\",\
        \"Role\",\
        \"Handler\",\
        \"Code\"\
      ],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name you want to assign to the function you are uploading. The function names appear in the console and are returned in the <a>ListFunctions</a> API. Function names are used to specify functions to other AWS Lambda APIs, such as <a>Invoke</a>. </p>\"\
        },\
        \"Runtime\":{\
          \"shape\":\"Runtime\",\
          \"documentation\":\"<p>The runtime environment for the Lambda function you are uploading. </p>\"\
        },\
        \"Role\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the IAM role that Lambda assumes when it executes your function to access any other Amazon Web Services (AWS) resources. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/lambda-introduction.html\\\">AWS Lambda: How it Works</a>. </p>\"\
        },\
        \"Handler\":{\
          \"shape\":\"Handler\",\
          \"documentation\":\"<p>The function within your code that Lambda calls to begin execution. For Node.js, it is the <i>module-name</i>.<i>export</i> value in your function. For Java, it can be <code>package.class-name::handler</code> or <code>package.class-name</code>. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/java-programming-model-handler-types.html\\\">Lambda Function Handler (Java)</a>. </p>\"\
        },\
        \"Code\":{\
          \"shape\":\"FunctionCode\",\
          \"documentation\":\"<p>The code for the Lambda function. </p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A short, user-defined function description. Lambda does not use this value. Assign a meaningful description as you see fit.</p>\"\
        },\
        \"Timeout\":{\
          \"shape\":\"Timeout\",\
          \"documentation\":\"<p>The function execution time at which Lambda should terminate the function. Because the execution time has cost implications, we recommend you set this value based on your expected execution time. The default is 3 seconds. </p>\"\
        },\
        \"MemorySize\":{\
          \"shape\":\"MemorySize\",\
          \"documentation\":\"<p>The amount of memory, in MB, your Lambda function is given. Lambda uses this memory size to infer the amount of CPU and memory allocated to your function. Your function use-case determines your CPU and memory requirements. For example, a database operation might need less memory compared to an image processing function. The default value is 128 MB. The value must be a multiple of 64 MB.</p>\"\
        },\
        \"Publish\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>This boolean parameter can be used to request AWS Lambda to create the Lambda function and publish a version as an atomic operation. </p>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p>If your Lambda function accesses resources in a VPC, you provide this parameter identifying the list of security group IDs and subnet IDs. These must belong to the same VPC. You must provide at least one security group and one subnet ID.</p>\"\
        }\
      }\
    },\
    \"Date\":{\"type\":\"timestamp\"},\
    \"DeleteAliasRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionName\",\
        \"Name\"\
      ],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The Lambda function name for which the alias is created. Deleting an alias does not delete the function version to which it is pointing. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Name\":{\
          \"shape\":\"Alias\",\
          \"documentation\":\"<p>Name of the alias to delete.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Name\"\
        }\
      }\
    },\
    \"DeleteEventSourceMappingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UUID\"],\
      \"members\":{\
        \"UUID\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The event source mapping ID.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UUID\"\
        }\
      }\
    },\
    \"DeleteFunctionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The Lambda function to delete.</p> <p> You can specify the function name (for example, <code>Thumbnail</code>) or you can specify Amazon Resource Name (ARN) of the function (for example, <code>arn:aws:lambda:us-west-2:account-id:function:ThumbNail</code>). If you are using versioning, you can also provide a qualified function ARN (ARN that is qualified with function version or alias name as suffix). AWS Lambda also allows you to specify only the function name with the account ID qualifier (for example, <code>account-id:Thumbnail</code>). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Qualifier\":{\
          \"shape\":\"Qualifier\",\
          \"documentation\":\"<p>Using this optional parameter you can specify a function version (but not the <code>$LATEST</code> version) to direct AWS Lambda to delete a specific function version. If the function version has one or more aliases pointing to it, you will get an error because you cannot have aliases pointing to it. You can delete any function version but not the <code>$LATEST</code>, that is, you cannot specify <code>$LATEST</code> as the value of this parameter. The <code>$LATEST</code> version can be deleted only when you want to delete all the function versions and aliases.</p> <p>You can only specify a function version, not an alias name, using this parameter. You cannot delete a function version using its alias.</p> <p>If you don't specify this parameter, AWS Lambda will delete the function, including all of its versions and aliases.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        }\
      }\
    },\
    \"Description\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0\
    },\
    \"EC2AccessDeniedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"EC2ThrottledException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>AWS Lambda was throttled by Amazon EC2 during Lambda function initiatization using the execution role provided for the Lambda function. </p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"EC2UnexpectedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"},\
        \"EC2ErrorCode\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>AWS Lambda received an unexpected EC2 client exception while setting up for the Lambda function. </p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"ENILimitReachedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>AWS Lambda was not able to create an Elastic Network Interface (ENI) in the VPC, specified as part of Lambda function configuration, because the limit for network interfaces has been reached. </p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"Enabled\":{\"type\":\"boolean\"},\
    \"EventSourceMappingConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"UUID\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS Lambda assigned opaque identifier for the mapping.</p>\"\
        },\
        \"BatchSize\":{\
          \"shape\":\"BatchSize\",\
          \"documentation\":\"<p>The largest number of records that AWS Lambda will retrieve from your event source at the time of invoking your function. Your function receives an event with all the retrieved records.</p>\"\
        },\
        \"EventSourceArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Kinesis stream that is the source of events.</p>\"\
        },\
        \"FunctionArn\":{\
          \"shape\":\"FunctionArn\",\
          \"documentation\":\"<p>The Lambda function to invoke when AWS Lambda detects an event on the stream.</p>\"\
        },\
        \"LastModified\":{\
          \"shape\":\"Date\",\
          \"documentation\":\"<p>The UTC time string indicating the last time the event mapping was updated.</p>\"\
        },\
        \"LastProcessingResult\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The result of the last AWS Lambda invocation of your Lambda function.</p>\"\
        },\
        \"State\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The state of the event source mapping. It can be <code>Creating</code>, <code>Enabled</code>, <code>Disabled</code>, <code>Enabling</code>, <code>Disabling</code>, <code>Updating</code>, or <code>Deleting</code>.</p>\"\
        },\
        \"StateTransitionReason\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The reason the event source mapping is in its current state. It is either user-requested or an AWS Lambda-initiated state transition.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes mapping between an Amazon Kinesis stream and a Lambda function.</p>\"\
    },\
    \"EventSourceMappingsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EventSourceMappingConfiguration\"}\
    },\
    \"EventSourcePosition\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"TRIM_HORIZON\",\
        \"LATEST\"\
      ]\
    },\
    \"EventSourceToken\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0,\
      \"pattern\":\"[a-zA-Z0-9._\\\\-]+\"\
    },\
    \"FunctionArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"arn:aws:lambda:[a-z]{2}-[a-z]+-\\\\d{1}:\\\\d{12}:function:[a-zA-Z0-9-_]+(:(\\\\$LATEST|[a-zA-Z0-9-_]+))?\"\
    },\
    \"FunctionCode\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ZipFile\":{\
          \"shape\":\"Blob\",\
          \"documentation\":\"<p>A zip file containing your deployment package. If you are using the API directly, the zip file must be base64-encoded (if you are using the AWS SDKs or the AWS CLI, the SDKs or CLI will do the encoding for you). For more information about creating a .zip file, go to <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/intro-permission-model.html#lambda-intro-execution-role.html\\\">Execution Permissions</a> in the <i>AWS Lambda Developer Guide</i>. </p>\"\
        },\
        \"S3Bucket\":{\
          \"shape\":\"S3Bucket\",\
          \"documentation\":\"<p>Amazon S3 bucket name where the .zip file containing your deployment package is stored. This bucket must reside in the same AWS region where you are creating the Lambda function. </p>\"\
        },\
        \"S3Key\":{\
          \"shape\":\"S3Key\",\
          \"documentation\":\"<p>The Amazon S3 object (the deployment package) key name you want to upload. </p>\"\
        },\
        \"S3ObjectVersion\":{\
          \"shape\":\"S3ObjectVersion\",\
          \"documentation\":\"<p>The Amazon S3 object (the deployment package) version you want to upload.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The code for the Lambda function.</p>\"\
    },\
    \"FunctionCodeLocation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RepositoryType\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The repository from which you can download the function.</p>\"\
        },\
        \"Location\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The presigned URL you can use to download the function's .zip file that you previously uploaded. The URL is valid for up to 10 minutes.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The object for the Lambda function location.</p>\"\
    },\
    \"FunctionConfiguration\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the function.</p>\"\
        },\
        \"FunctionArn\":{\
          \"shape\":\"FunctionArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) assigned to the function.</p>\"\
        },\
        \"Runtime\":{\
          \"shape\":\"Runtime\",\
          \"documentation\":\"<p>The runtime environment for the Lambda function.</p>\"\
        },\
        \"Role\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the IAM role that Lambda assumes when it executes your function to access any other Amazon Web Services (AWS) resources. </p>\"\
        },\
        \"Handler\":{\
          \"shape\":\"Handler\",\
          \"documentation\":\"<p>The function Lambda calls to begin executing your function.</p>\"\
        },\
        \"CodeSize\":{\
          \"shape\":\"Long\",\
          \"documentation\":\"<p>The size, in bytes, of the function .zip file you uploaded.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>The user-provided description.</p>\"\
        },\
        \"Timeout\":{\
          \"shape\":\"Timeout\",\
          \"documentation\":\"<p>The function execution time at which Lambda should terminate the function. Because the execution time has cost implications, we recommend you set this value based on your expected execution time. The default is 3 seconds. </p>\"\
        },\
        \"MemorySize\":{\
          \"shape\":\"MemorySize\",\
          \"documentation\":\"<p>The memory size, in MB, you configured for the function. Must be a multiple of 64 MB.</p>\"\
        },\
        \"LastModified\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time stamp of the last time you updated the function.</p>\"\
        },\
        \"CodeSha256\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>It is the SHA256 hash of your function deployment package.</p>\"\
        },\
        \"Version\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>The version of the Lambda function.</p>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfigResponse\",\
          \"documentation\":\"<p>VPC configuration associated with your Lambda function.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A complex type that describes function metadata.</p>\"\
    },\
    \"FunctionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FunctionConfiguration\"}\
    },\
    \"FunctionName\":{\
      \"type\":\"string\",\
      \"max\":140,\
      \"min\":1,\
      \"pattern\":\"(arn:aws:lambda:)?([a-z]{2}-[a-z]+-\\\\d{1}:)?(\\\\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\\\\$LATEST|[a-zA-Z0-9-_]+))?\"\
    },\
    \"GetAliasRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionName\",\
        \"Name\"\
      ],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>Function name for which the alias is created. An alias is a subresource that exists only in the context of an existing Lambda function so you must specify the function name.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Name\":{\
          \"shape\":\"Alias\",\
          \"documentation\":\"<p>Name of the alias for which you want to retrieve information.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Name\"\
        }\
      }\
    },\
    \"GetEventSourceMappingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UUID\"],\
      \"members\":{\
        \"UUID\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The AWS Lambda assigned ID of the event source mapping.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UUID\"\
        }\
      }\
    },\
    \"GetFunctionConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function for which you want to retrieve the configuration information.</p> <p> You can specify a function name (for example, <code>Thumbnail</code>) or you can specify Amazon Resource Name (ARN) of the function (for example, <code>arn:aws:lambda:us-west-2:account-id:function:ThumbNail</code>). AWS Lambda also allows you to specify a partial ARN (for example, <code>account-id:Thumbnail</code>). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Qualifier\":{\
          \"shape\":\"Qualifier\",\
          \"documentation\":\"<p>Using this optional parameter you can specify a function version or an alias name. If you specify function version, the API uses qualified function ARN and returns information about the specific function version. If you specify an alias name, the API uses the alias ARN and returns information about the function version to which the alias points.</p> <p>If you don't specify this parameter, the API uses unqualified function ARN, and returns information about the <code>$LATEST</code> function version.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        }\
      }\
    },\
    \"GetFunctionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The Lambda function name. </p> <p> You can specify a function name (for example, <code>Thumbnail</code>) or you can specify Amazon Resource Name (ARN) of the function (for example, <code>arn:aws:lambda:us-west-2:account-id:function:ThumbNail</code>). AWS Lambda also allows you to specify a partial ARN (for example, <code>account-id:Thumbnail</code>). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Qualifier\":{\
          \"shape\":\"Qualifier\",\
          \"documentation\":\"<p>Using this optional parameter to specify a function version or an alias name. If you specify function version, the API uses qualified function ARN for the request and returns information about the specific Lambda function version. If you specify an alias name, the API uses the alias ARN and returns information about the function version to which the alias points. If you don't provide this parameter, the API uses unqualified function ARN and returns information about the <code>$LATEST</code> version of the Lambda function.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        }\
      }\
    },\
    \"GetFunctionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Configuration\":{\"shape\":\"FunctionConfiguration\"},\
        \"Code\":{\"shape\":\"FunctionCodeLocation\"}\
      },\
      \"documentation\":\"<p>This response contains the object for the Lambda function location (see <a>API_FunctionCodeLocation</a>.</p>\"\
    },\
    \"GetPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>Function name whose resource policy you want to retrieve. </p> <p> You can specify the function name (for example, <code>Thumbnail</code>) or you can specify Amazon Resource Name (ARN) of the function (for example, <code>arn:aws:lambda:us-west-2:account-id:function:ThumbNail</code>). If you are using versioning, you can also provide a qualified function ARN (ARN that is qualified with function version or alias name as suffix). AWS Lambda also allows you to specify only the function name with the account ID qualifier (for example, <code>account-id:Thumbnail</code>). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Qualifier\":{\
          \"shape\":\"Qualifier\",\
          \"documentation\":\"<p>You can specify this optional query parameter to specify a function version or an alias name in which case this API will return all permissions associated with the specific qualified ARN. If you don't provide this parameter, the API will return permissions that apply to the unqualified function ARN. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        }\
      }\
    },\
    \"GetPolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Policy\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The resource policy associated with the specified function. The response returns the same as a string using a backslash (\\\"\\\\\\\") as an escape character in the JSON. </p>\"\
        }\
      }\
    },\
    \"Handler\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"pattern\":\"[^\\\\s]+\"\
    },\
    \"HttpStatus\":{\"type\":\"integer\"},\
    \"Integer\":{\"type\":\"integer\"},\
    \"InvalidParameterValueException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>One of the parameters in the request is invalid. For example, if you provided an IAM role for AWS Lambda to assume in the <code>CreateFunction</code> or the <code>UpdateFunctionConfiguration</code> API, that AWS Lambda is unable to assume you will get this exception. </p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidRequestContentException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The request body could not be parsed as JSON.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"InvalidSecurityGroupIDException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The Security Group ID provided in the Lambda function VPC configuration is invalid.</p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"InvalidSubnetIDException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The Subnet ID provided in the Lambda function VPC configuration is invalid.</p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"InvocationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The Lambda function name. </p> <p> You can specify a function name (for example, <code>Thumbnail</code>) or you can specify Amazon Resource Name (ARN) of the function (for example, <code>arn:aws:lambda:us-west-2:account-id:function:ThumbNail</code>). AWS Lambda also allows you to specify a partial ARN (for example, <code>account-id:Thumbnail</code>). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"InvocationType\":{\
          \"shape\":\"InvocationType\",\
          \"documentation\":\"<p>By default, the <code>Invoke</code> API assumes <code>RequestResponse</code> invocation type. You can optionally request asynchronous execution by specifying <code>Event</code> as the <code>InvocationType</code>. You can also use this parameter to request AWS Lambda to not execute the function but do some verification, such as if the caller is authorized to invoke the function and if the inputs are valid. You request this by specifying <code>DryRun</code> as the <code>InvocationType</code>. This is useful in a cross-account scenario when you want to verify access to a function without running it. </p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amz-Invocation-Type\"\
        },\
        \"LogType\":{\
          \"shape\":\"LogType\",\
          \"documentation\":\"<p>You can set this optional parameter to <code>Tail</code> in the request only if you specify the <code>InvocationType</code> parameter with value <code>RequestResponse</code>. In this case, AWS Lambda returns the base64-encoded last 4 KB of log data produced by your Lambda function in the <code>x-amz-log-results</code> header. </p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amz-Log-Type\"\
        },\
        \"ClientContext\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Using the <code>ClientContext</code> you can pass client-specific information to the Lambda function you are invoking. You can then process the client information in your Lambda function as you choose through the context variable. For an example of a <code>ClientContext</code> JSON, see <a href=\\\"http://docs.aws.amazon.com/mobileanalytics/latest/ug/PutEvents.html\\\">PutEvents</a> in the <i>Amazon Mobile Analytics API Reference and User Guide</i>.</p> <p>The ClientContext JSON must be base64-encoded.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amz-Client-Context\"\
        },\
        \"Payload\":{\
          \"shape\":\"Blob\",\
          \"documentation\":\"<p>JSON that you want to provide to your Lambda function as input.</p>\"\
        },\
        \"Qualifier\":{\
          \"shape\":\"Qualifier\",\
          \"documentation\":\"<p>You can use this optional parameter to specify a Lambda function version or alias name. If you specify a function version, the API uses the qualified function ARN to invoke a specific Lambda function. If you specify an alias name, the API uses the alias ARN to invoke the Lambda function version to which the alias points.</p> <p>If you don't provide this parameter, then the API uses unqualified function ARN which results in invocation of the <code>$LATEST</code> version.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        }\
      },\
      \"payload\":\"Payload\"\
    },\
    \"InvocationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"StatusCode\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The HTTP status code will be in the 200 range for successful request. For the <code>RequestResonse</code> invocation type this status code will be 200. For the <code>Event</code> invocation type this status code will be 202. For the <code>DryRun</code> invocation type the status code will be 204. </p>\",\
          \"location\":\"statusCode\"\
        },\
        \"FunctionError\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Indicates whether an error occurred while executing the Lambda function. If an error occurred this field will have one of two values; <code>Handled</code> or <code>Unhandled</code>. <code>Handled</code> errors are errors that are reported by the function while the <code>Unhandled</code> errors are those detected and reported by AWS Lambda. Unhandled errors include out of memory errors and function timeouts. For information about how to report an <code>Handled</code> error, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/programming-model.html\\\">Programming Model</a>. </p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amz-Function-Error\"\
        },\
        \"LogResult\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p> It is the base64-encoded logs for the Lambda function invocation. This is present only if the invocation type is <code>RequestResponse</code> and the logs were requested. </p>\",\
          \"location\":\"header\",\
          \"locationName\":\"X-Amz-Log-Result\"\
        },\
        \"Payload\":{\
          \"shape\":\"Blob\",\
          \"documentation\":\"<p> It is the JSON representation of the object returned by the Lambda function. In This is present only if the invocation type is <code>RequestResponse</code>. </p> <p>In the event of a function error this field contains a message describing the error. For the <code>Handled</code> errors the Lambda function will report this message. For <code>Unhandled</code> errors AWS Lambda reports the message. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Upon success, returns an empty response. Otherwise, throws an exception.</p>\",\
      \"payload\":\"Payload\"\
    },\
    \"InvocationType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Event\",\
        \"RequestResponse\",\
        \"DryRun\"\
      ]\
    },\
    \"InvokeAsyncRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionName\",\
        \"InvokeArgs\"\
      ],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The Lambda function name.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"InvokeArgs\":{\
          \"shape\":\"BlobStream\",\
          \"documentation\":\"<p>JSON that you want to provide to your Lambda function as input.</p>\"\
        }\
      },\
      \"deprecated\":true,\
      \"payload\":\"InvokeArgs\"\
    },\
    \"InvokeAsyncResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"HttpStatus\",\
          \"documentation\":\"<p>It will be 202 upon success.</p>\",\
          \"location\":\"statusCode\"\
        }\
      },\
      \"documentation\":\"<p>Upon success, it returns empty response. Otherwise, throws an exception.</p>\",\
      \"deprecated\":true\
    },\
    \"ListAliasesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>Lambda function name for which the alias is created.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"FunctionVersion\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>If you specify this optional parameter, the API returns only the aliases that are pointing to the specific Lambda function version, otherwise the API returns all of the aliases created for the Lambda function.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"FunctionVersion\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Optional string. An opaque pagination token returned from a previous <code>ListAliases</code> operation. If present, indicates where to continue the listing.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Marker\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"MaxListItems\",\
          \"documentation\":\"<p>Optional integer. Specifies the maximum number of aliases to return in response. This parameter value must be greater than 0.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"MaxItems\"\
        }\
      }\
    },\
    \"ListAliasesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextMarker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A string, present if there are more aliases.</p>\"\
        },\
        \"Aliases\":{\
          \"shape\":\"AliasList\",\
          \"documentation\":\"<p>A list of aliases.</p>\"\
        }\
      }\
    },\
    \"ListEventSourceMappingsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EventSourceArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the Amazon Kinesis stream.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"EventSourceArn\"\
        },\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function.</p> <p> You can specify the function name (for example, <code>Thumbnail</code>) or you can specify Amazon Resource Name (ARN) of the function (for example, <code>arn:aws:lambda:us-west-2:account-id:function:ThumbNail</code>). If you are using versioning, you can also provide a qualified function ARN (ARN that is qualified with function version or alias name as suffix). AWS Lambda also allows you to specify only the function name with the account ID qualifier (for example, <code>account-id:Thumbnail</code>). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Optional string. An opaque pagination token returned from a previous <code>ListEventSourceMappings</code> operation. If present, specifies to continue the list from where the returning call left off. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Marker\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"MaxListItems\",\
          \"documentation\":\"<p>Optional integer. Specifies the maximum number of event sources to return in response. This value must be greater than 0.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"MaxItems\"\
        }\
      }\
    },\
    \"ListEventSourceMappingsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextMarker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A string, present if there are more event source mappings.</p>\"\
        },\
        \"EventSourceMappings\":{\
          \"shape\":\"EventSourceMappingsList\",\
          \"documentation\":\"<p>An array of <code>EventSourceMappingConfiguration</code> objects.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains a list of event sources (see <a>API_EventSourceMappingConfiguration</a>)</p>\"\
    },\
    \"ListFunctionsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Optional string. An opaque pagination token returned from a previous <code>ListFunctions</code> operation. If present, indicates where to continue the listing. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Marker\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"MaxListItems\",\
          \"documentation\":\"<p>Optional integer. Specifies the maximum number of AWS Lambda functions to return in response. This parameter value must be greater than 0.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"MaxItems\"\
        }\
      }\
    },\
    \"ListFunctionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextMarker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A string, present if there are more functions.</p>\"\
        },\
        \"Functions\":{\
          \"shape\":\"FunctionList\",\
          \"documentation\":\"<p>A list of Lambda functions.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains a list of AWS Lambda function configurations (see <a>FunctionConfiguration</a>.</p>\"\
    },\
    \"ListVersionsByFunctionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>Function name whose versions to list. You can specify a function name (for example, <code>Thumbnail</code>) or you can specify Amazon Resource Name (ARN) of the function (for example, <code>arn:aws:lambda:us-west-2:account-id:function:ThumbNail</code>). AWS Lambda also allows you to specify a partial ARN (for example, <code>account-id:Thumbnail</code>). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Marker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p> Optional string. An opaque pagination token returned from a previous <code>ListVersionsByFunction</code> operation. If present, indicates where to continue the listing. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Marker\"\
        },\
        \"MaxItems\":{\
          \"shape\":\"MaxListItems\",\
          \"documentation\":\"<p> Optional integer. Specifies the maximum number of AWS Lambda function versions to return in response. This parameter value must be greater than 0. </p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"MaxItems\"\
        }\
      }\
    },\
    \"ListVersionsByFunctionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextMarker\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A string, present if there are more function versions.</p>\"\
        },\
        \"Versions\":{\
          \"shape\":\"FunctionList\",\
          \"documentation\":\"<p>A list of Lambda function versions.</p>\"\
        }\
      }\
    },\
    \"LogType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"None\",\
        \"Tail\"\
      ]\
    },\
    \"Long\":{\"type\":\"long\"},\
    \"MaxListItems\":{\
      \"type\":\"integer\",\
      \"max\":10000,\
      \"min\":1\
    },\
    \"MemorySize\":{\
      \"type\":\"integer\",\
      \"max\":1536,\
      \"min\":128\
    },\
    \"PolicyLengthExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Lambda function access policy is limited to 20 KB.</p>\",\
      \"error\":{\"httpStatusCode\":400},\
      \"exception\":true\
    },\
    \"Principal\":{\
      \"type\":\"string\",\
      \"pattern\":\".*\"\
    },\
    \"PublishVersionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The Lambda function name. You can specify a function name (for example, <code>Thumbnail</code>) or you can specify Amazon Resource Name (ARN) of the function (for example, <code>arn:aws:lambda:us-west-2:account-id:function:ThumbNail</code>). AWS Lambda also allows you to specify a partial ARN (for example, <code>account-id:Thumbnail</code>). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"CodeSha256\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The SHA256 hash of the deployment package you want to publish. This provides validation on the code you are publishing. If you provide this parameter value must match the SHA256 of the $LATEST version for the publication to succeed. </p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p> The description for the version you are publishing. If not provided, AWS Lambda copies the description from the $LATEST version. </p>\"\
        }\
      }\
    },\
    \"Qualifier\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"(|[a-zA-Z0-9$_-]+)\"\
    },\
    \"RemovePermissionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionName\",\
        \"StatementId\"\
      ],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>Lambda function whose resource policy you want to remove a permission from.</p> <p> You can specify a function name (for example, <code>Thumbnail</code>) or you can specify Amazon Resource Name (ARN) of the function (for example, <code>arn:aws:lambda:us-west-2:account-id:function:ThumbNail</code>). AWS Lambda also allows you to specify a partial ARN (for example, <code>account-id:Thumbnail</code>). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"StatementId\":{\
          \"shape\":\"StatementId\",\
          \"documentation\":\"<p>Statement ID of the permission to remove.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"StatementId\"\
        },\
        \"Qualifier\":{\
          \"shape\":\"Qualifier\",\
          \"documentation\":\"<p>You can specify this optional parameter to remove permission associated with a specific function version or function alias. If you don't specify this parameter, the API removes permission associated with the unqualified function ARN.</p>\",\
          \"location\":\"querystring\",\
          \"locationName\":\"Qualifier\"\
        }\
      }\
    },\
    \"RequestTooLargeException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The request payload exceeded the <code>Invoke</code> request body JSON input limit. For more information, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/limits.html\\\">Limits</a>. </p>\",\
      \"error\":{\"httpStatusCode\":413},\
      \"exception\":true\
    },\
    \"ResourceConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The resource already exists.</p>\",\
      \"error\":{\"httpStatusCode\":409},\
      \"exception\":true\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The resource (for example, a Lambda function or access policy statement) specified in the request does not exist.</p>\",\
      \"error\":{\"httpStatusCode\":404},\
      \"exception\":true\
    },\
    \"RoleArn\":{\
      \"type\":\"string\",\
      \"pattern\":\"arn:aws:iam::\\\\d{12}:role/?[a-zA-Z_0-9+=,.@\\\\-_/]+\"\
    },\
    \"Runtime\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"nodejs\",\
        \"nodejs4.3\",\
        \"java8\",\
        \"python2.7\"\
      ]\
    },\
    \"S3Bucket\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"min\":3,\
      \"pattern\":\"^[0-9A-Za-z\\\\.\\\\-_]*(?<!\\\\.)$\"\
    },\
    \"S3Key\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"S3ObjectVersion\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1\
    },\
    \"SecurityGroupId\":{\"type\":\"string\"},\
    \"SecurityGroupIds\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SecurityGroupId\"},\
      \"max\":5\
    },\
    \"ServiceException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The AWS Lambda service encountered an internal error.</p>\",\
      \"error\":{\"httpStatusCode\":500},\
      \"exception\":true\
    },\
    \"SourceOwner\":{\
      \"type\":\"string\",\
      \"pattern\":\"\\\\d{12}\"\
    },\
    \"StatementId\":{\
      \"type\":\"string\",\
      \"max\":100,\
      \"min\":1,\
      \"pattern\":\"([a-zA-Z0-9-_]+)\"\
    },\
    \"String\":{\"type\":\"string\"},\
    \"SubnetIPAddressLimitReachedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>AWS Lambda was not able to set up VPC access for the Lambda function because one or more configured subnets has no available IP addresses. </p>\",\
      \"error\":{\"httpStatusCode\":502},\
      \"exception\":true\
    },\
    \"SubnetId\":{\"type\":\"string\"},\
    \"SubnetIds\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SubnetId\"},\
      \"max\":16\
    },\
    \"Timeout\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"Timestamp\":{\"type\":\"string\"},\
    \"TooManyRequestsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"retryAfterSeconds\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The number of seconds the caller should wait before retrying.</p>\",\
          \"location\":\"header\",\
          \"locationName\":\"Retry-After\"\
        },\
        \"Type\":{\"shape\":\"String\"},\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"error\":{\"httpStatusCode\":429},\
      \"exception\":true\
    },\
    \"UnsupportedMediaTypeException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\"shape\":\"String\"},\
        \"message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The content type of the <code>Invoke</code> request body is not JSON.</p>\",\
      \"error\":{\"httpStatusCode\":415},\
      \"exception\":true\
    },\
    \"UpdateAliasRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"FunctionName\",\
        \"Name\"\
      ],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The function name for which the alias is created.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Name\":{\
          \"shape\":\"Alias\",\
          \"documentation\":\"<p>The alias name.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"Name\"\
        },\
        \"FunctionVersion\":{\
          \"shape\":\"Version\",\
          \"documentation\":\"<p>Using this parameter you can change the Lambda function version to which the alias points.</p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>You can change the description of the alias using this parameter.</p>\"\
        }\
      }\
    },\
    \"UpdateEventSourceMappingRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"UUID\"],\
      \"members\":{\
        \"UUID\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The event source mapping identifier.</p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"UUID\"\
        },\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The Lambda function to which you want the stream records sent.</p> <p> You can specify a function name (for example, <code>Thumbnail</code>) or you can specify Amazon Resource Name (ARN) of the function (for example, <code>arn:aws:lambda:us-west-2:account-id:function:ThumbNail</code>). AWS Lambda also allows you to specify a partial ARN (for example, <code>account-id:Thumbnail</code>). </p> <p>If you are using versioning, you can also provide a qualified function ARN (ARN that is qualified with function version or alias name as suffix). For more information about versioning, see <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html\\\">AWS Lambda Function Versioning and Aliases</a></p> <p>Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length.</p>\"\
        },\
        \"Enabled\":{\
          \"shape\":\"Enabled\",\
          \"documentation\":\"<p>Specifies whether AWS Lambda should actively poll the stream or not. If disabled, AWS Lambda will not poll the stream.</p>\"\
        },\
        \"BatchSize\":{\
          \"shape\":\"BatchSize\",\
          \"documentation\":\"<p>The maximum number of stream records that can be sent to your Lambda function for a single invocation.</p>\"\
        }\
      }\
    },\
    \"UpdateFunctionCodeRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The existing Lambda function name whose code you want to replace.</p> <p> You can specify a function name (for example, <code>Thumbnail</code>) or you can specify Amazon Resource Name (ARN) of the function (for example, <code>arn:aws:lambda:us-west-2:account-id:function:ThumbNail</code>). AWS Lambda also allows you to specify a partial ARN (for example, <code>account-id:Thumbnail</code>). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"ZipFile\":{\
          \"shape\":\"Blob\",\
          \"documentation\":\"<p>Based64-encoded .zip file containing your packaged source code.</p>\"\
        },\
        \"S3Bucket\":{\
          \"shape\":\"S3Bucket\",\
          \"documentation\":\"<p>Amazon S3 bucket name where the .zip file containing your deployment package is stored. This bucket must reside in the same AWS region where you are creating the Lambda function.</p>\"\
        },\
        \"S3Key\":{\
          \"shape\":\"S3Key\",\
          \"documentation\":\"<p>The Amazon S3 object (the deployment package) key name you want to upload. </p>\"\
        },\
        \"S3ObjectVersion\":{\
          \"shape\":\"S3ObjectVersion\",\
          \"documentation\":\"<p>The Amazon S3 object (the deployment package) version you want to upload.</p>\"\
        },\
        \"Publish\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>This boolean parameter can be used to request AWS Lambda to update the Lambda function and publish a version as an atomic operation. </p>\"\
        }\
      }\
    },\
    \"UpdateFunctionConfigurationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"FunctionName\"],\
      \"members\":{\
        \"FunctionName\":{\
          \"shape\":\"FunctionName\",\
          \"documentation\":\"<p>The name of the Lambda function.</p> <p> You can specify a function name (for example, <code>Thumbnail</code>) or you can specify Amazon Resource Name (ARN) of the function (for example, <code>arn:aws:lambda:us-west-2:account-id:function:ThumbNail</code>). AWS Lambda also allows you to specify a partial ARN (for example, <code>account-id:Thumbnail</code>). Note that the length constraint applies only to the ARN. If you specify only the function name, it is limited to 64 character in length. </p>\",\
          \"location\":\"uri\",\
          \"locationName\":\"FunctionName\"\
        },\
        \"Role\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the IAM role that Lambda will assume when it executes your function. </p>\"\
        },\
        \"Handler\":{\
          \"shape\":\"Handler\",\
          \"documentation\":\"<p>The function that Lambda calls to begin executing your function. For Node.js, it is the <code>module-name.export</code> value in your function. </p>\"\
        },\
        \"Description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A short user-defined function description. AWS Lambda does not use this value. Assign a meaningful description as you see fit.</p>\"\
        },\
        \"Timeout\":{\
          \"shape\":\"Timeout\",\
          \"documentation\":\"<p>The function execution time at which AWS Lambda should terminate the function. Because the execution time has cost implications, we recommend you set this value based on your expected execution time. The default is 3 seconds. </p>\"\
        },\
        \"MemorySize\":{\
          \"shape\":\"MemorySize\",\
          \"documentation\":\"<p>The amount of memory, in MB, your Lambda function is given. AWS Lambda uses this memory size to infer the amount of CPU allocated to your function. Your function use-case determines your CPU and memory requirements. For example, a database operation might need less memory compared to an image processing function. The default value is 128 MB. The value must be a multiple of 64 MB.</p>\"\
        },\
        \"VpcConfig\":{\"shape\":\"VpcConfig\"},\
        \"Runtime\":{\"shape\":\"Runtime\"}\
      }\
    },\
    \"Version\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"min\":1,\
      \"pattern\":\"(\\\\$LATEST|[0-9]+)\"\
    },\
    \"VpcConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SubnetIds\":{\
          \"shape\":\"SubnetIds\",\
          \"documentation\":\"<p>A list of one or more subnet IDs in your VPC.</p>\"\
        },\
        \"SecurityGroupIds\":{\
          \"shape\":\"SecurityGroupIds\",\
          \"documentation\":\"<p>A list of one or more security groups IDs in your VPC.</p>\"\
        }\
      },\
      \"documentation\":\"<p>If your Lambda function accesses resources in a VPC, you provide this parameter identifying the list of security group IDs and subnet IDs. These must belong to the same VPC. You must provide at least one security group and one subnet ID.</p>\"\
    },\
    \"VpcConfigResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SubnetIds\":{\
          \"shape\":\"SubnetIds\",\
          \"documentation\":\"<p>A list of subnet IDs associated with the Lambda function.</p>\"\
        },\
        \"SecurityGroupIds\":{\
          \"shape\":\"SecurityGroupIds\",\
          \"documentation\":\"<p>A list of security group IDs associated with the Lambda function.</p>\"\
        },\
        \"VpcId\":{\
          \"shape\":\"VpcId\",\
          \"documentation\":\"<p>The VPC ID associated with you Lambda function.</p>\"\
        }\
      },\
      \"documentation\":\"<p>VPC configuration associated with your Lambda function.</p>\"\
    },\
    \"VpcId\":{\"type\":\"string\"}\
  },\
  \"documentation\":\"<fullname>AWS Lambda</fullname> <p><b>Overview</b></p> <p>This is the <i>AWS Lambda API Reference</i>. The AWS Lambda Developer Guide provides additional information. For the service overview, go to <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/welcome.html\\\">What is AWS Lambda</a>, and for information about how the service works, go to <a href=\\\"http://docs.aws.amazon.com/lambda/latest/dg/lambda-introduction.html\\\">AWS Lambda: How it Works</a> in the <i>AWS Lambda Developer Guide</i>.</p>\"\
}\
";
}

@end
