//
//  Constants.swift
//  MovieTest
//
//  Created by Denny Arfansyah on 25/06/21.
//

import Foundation

struct Constants {
    
    static let genreUrl = "https://api.themoviedb.org/3/genre/movie/list?api_key=\(apiKey)"
    static let moviesUrl = "https://api.themoviedb.org/3/discover/movie?api_key=\(apiKey)"
    static let generalError = "Something happend. Please try again later"
    static let reviewUrl = "https://api.themoviedb.org/3/movie/"
    static let backdropUrl = "https://image.tmdb.org/t/p/w300/gJckSA3Evn5gouT62rytjLbTzoj.jpg"
    static let noInternetConnection = "No Internet connection"
    static let movie = "/movie"
    static let baseUrl = "https://api.themoviedb.org/3"
    static let movieUrl = baseUrl + movie
    static let apiKey = "520609269154335cdfd2f418e3d8377f"
    static let noReviewFound = "No Review Found"
    
}
