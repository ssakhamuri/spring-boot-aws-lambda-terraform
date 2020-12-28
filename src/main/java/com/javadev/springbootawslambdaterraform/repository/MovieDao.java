package com.javadev.springbootawslambdaterraform.repository;

import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBMapper;
import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBQueryExpression;
import com.amazonaws.services.dynamodbv2.datamodeling.DynamoDBScanExpression;
import com.amazonaws.services.dynamodbv2.model.AttributeValue;
import com.javadev.springbootawslambdaterraform.config.DynamoDBAdapter;
import com.javadev.springbootawslambdaterraform.model.Movie;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class MovieDao implements MovieRepository {

    private static Logger logger = LoggerFactory.getLogger(MovieDao.class);
    private static final DynamoDBMapper dynamoDBMapper = DynamoDBAdapter.dynamoDBMapper();

    @Override
    public List<Movie> findAllMovies() {
        logger.info("Finding the Movies List");
        return dynamoDBMapper.scan(Movie.class, new DynamoDBScanExpression());
    }

    @Override
    public Movie saveOrUpdateMovie(Movie movie) {
        logger.info("Movie - Save");
        dynamoDBMapper.save(movie);
        return movie;
    }

    /*@Override
    public List<Movie> findMoviesByYear(int year) {
        Map<String, AttributeValue> fy = new HashMap<>();
        fy.put(":v1", new AttributeValue().withN(String.valueOf(year)));

        DynamoDBQueryExpression<Movie> query = new DynamoDBQueryExpression<Movie>()
                .withIndexName("Year-Index")
                .withConsistentRead(false)
                .withKeyConditionExpression("year = :v1")
                .withExpressionAttributeValues(fy);

        List<Movie> movies = dynamoDBMapper.query(Movie.class, query);
        logger.info("Movies - By Year :: Results size "+ movies.size());
        return movies;
    }*/
}
