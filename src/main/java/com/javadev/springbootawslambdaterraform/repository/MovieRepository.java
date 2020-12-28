package com.javadev.springbootawslambdaterraform.repository;

import com.javadev.springbootawslambdaterraform.model.Movie;

import java.util.List;


public interface MovieRepository {
    List<Movie> findAllMovies();
    Movie saveOrUpdateMovie(Movie movie);
}
