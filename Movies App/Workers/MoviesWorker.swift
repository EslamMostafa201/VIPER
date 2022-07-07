//
//  MoviesWorker.swift
//  Movies App
//
//  Created by Eslam Mostafa on 07/07/2022.
//

import Foundation

class MoviesWorker {
    private let networkLayer: ApiClientProtocol = ApiClient()
    
    func getMoviesApi(pageNumber: Int, completionHandler: @escaping (Result<MoviesModel, Error>) -> Void) {
        networkLayer.sendRequest(MoviesAPI.movies(page: pageNumber), decadoingType: MoviesModel.self, completion: completionHandler)
    }
    
    func getMovieDeailsApi(movieId: Int, completionHandler: @escaping (Result<MovieDetailsModel, Error>) -> Void) {
        networkLayer.sendRequest(MovieDetailsAPI.movieDetails(id: movieId), decadoingType: MovieDetailsModel.self, completion: completionHandler)
    }
}
