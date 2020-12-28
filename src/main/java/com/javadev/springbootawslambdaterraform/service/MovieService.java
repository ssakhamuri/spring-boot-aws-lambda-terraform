package com.javadev.springbootawslambdaterraform.service;

import com.javadev.springbootawslambdaterraform.model.Movie;
import com.javadev.springbootawslambdaterraform.repository.MovieRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MovieService {

    @Autowired
    private MovieRepository movieRepository;

    public List<Movie> findAllMovies() {
        return movieRepository.findAllMovies();
    }

    public Movie saveOrUpdateMovie(Movie movie) {
        return movieRepository.saveOrUpdateMovie(movie);
    }
}
