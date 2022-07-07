//
//  MoviesInteractor.swift
//  Movies App
//
//  Created by Eslam Mostafa on 07/07/2022.
//

import Foundation

class MoviesInteractor: MoviesInteractorInputProtocol {
    weak var presenter: MoviesInteractorOutputProtocol?
    private let moviesWorker = MoviesWorker()
    
    func getMovies(pageNumber: Int) {
        moviesWorker.getMoviesApi(pageNumber: pageNumber) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let movies):
                self.presenter?.moviesFetchesSuccessfully(moviesModel: movies)
            case .failure(let error):
                self.presenter?.moviesFetchingFailed(withError: error)
            }
        }
    }
}
