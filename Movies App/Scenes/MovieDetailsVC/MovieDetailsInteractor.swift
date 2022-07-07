//
//  MovieDetailsInteractor.swift
//  Movies App
//
//  Created by Eslam Mostafa on 07/07/2022.
//

import Foundation

class MovieDetailsInteractor: MovieDetailsInteractorInputProtocol {
    weak var presenter: MovieDetailsInteractorOutputProtocol?
    private let moviesWorker = MoviesWorker()
    
    func getMovieDetails(movieId: Int) {
        moviesWorker.getMovieDeailsApi(movieId: movieId) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let movieDetails):
                self.presenter?.movieDetailsFetchedSuccessfully(movieDetails: movieDetails)
            case .failure(let error):
                self.presenter?.movieDetailsFetchingFailed(withError: error)
            }
        }
    }
}
