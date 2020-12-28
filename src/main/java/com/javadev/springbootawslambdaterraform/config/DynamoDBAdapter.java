package com.javadev.springbootawslambdaterraform.config;

import com.amazonaws.regions.Regions;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDB;
import com.amazonaws.services.dynamodbv2.AmazonDynamoDBClientBuilder;
import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBMapper;

public class DynamoDBAdapter {

    private static volatile DynamoDBAdapter dynamoDBAdapter;
    private static DynamoDBMapper dynamoDBMapper;

    private DynamoDBAdapter() {
        AmazonDynamoDB amazonDynamoDBClient = AmazonDynamoDBClientBuilder.standard().withRegion(Regions.US_EAST_2).build();
        dynamoDBMapper = new DynamoDBMapper(amazonDynamoDBClient);
    }
    public static DynamoDBAdapter getInstance() {
        if (dynamoDBAdapter == null) {
            synchronized(DynamoDBAdapter.class) {
                if (dynamoDBAdapter == null)
                    dynamoDBAdapter = new DynamoDBAdapter();
            }
        }
        return dynamoDBAdapter;
    }

    public static DynamoDBMapper dynamoDBMapper() {
        DynamoDBAdapter dynamoDBAdapter = getInstance();
        return dynamoDBAdapter.dynamoDBMapper;
    }
}
