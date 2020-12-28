package com.javadev.springbootawslambdaterraform;

import com.amazonaws.serverless.exceptions.ContainerInitializationException;
import com.amazonaws.serverless.proxy.model.AwsProxyRequest;
import com.amazonaws.serverless.proxy.model.AwsProxyResponse;
import com.amazonaws.serverless.proxy.spring.SpringBootLambdaContainerHandler;
import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestStreamHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

@SpringBootApplication
public class AWSStreamLambdaHandler implements RequestStreamHandler {

    private static Logger logger = LoggerFactory.getLogger(AWSStreamLambdaHandler.class);
    public static final SpringBootLambdaContainerHandler<AwsProxyRequest, AwsProxyResponse> handler;

    static {
        try {
            handler = SpringBootLambdaContainerHandler.getAwsProxyHandler(SpringBootAwsLambdaTerraformApplication.class);
        } catch (ContainerInitializationException ex) {
            String errMsg = "Could not initialize Spring Boot application";
            logger.error(errMsg);
            throw new RuntimeException("Could not initialize Spring Boot application", ex);
        }
    }

    @Override
    public void handleRequest(InputStream inputStream, OutputStream outputStream, Context context) throws IOException {
        logger.info("Lambda function invoked..!!");
        handler.proxyStream(inputStream, outputStream, context);
        outputStream.close();
    }
}
