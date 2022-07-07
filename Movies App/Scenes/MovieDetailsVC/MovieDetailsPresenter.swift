//
//  MovieDetailsPresenter.swift
//  Movies App
//
//  Created by Eslam Mostafa on 07/07/2022.
//

import Foundation

class MovieDetailsPresenter: MovieDetailsPresenterProtocol, MovieDetailsInteractorOutputProtocol {
    weak var view: MovieDetailsViewProtocol?
    private let router: MovieDetailsRouterProtocol
    private let interactor: MovieDetailsInteractorInputProtocol
    private let movieId: Int
    
    init(view: MovieDetailsViewProtocol, router: MovieDetailsRouterProtocol, interactor: MovieDetailsInteractorInputProtocol, movieId: Int) {
        self.view = view
        self.router = router
        self.interactor = interactor
        self.movieId = movieId
    }
    
    func viewDidLoad() {
        view?.showLoadingIndicator()
        interactor.getMovieDetails(movieId: self.movieId)
    }
    
    func movieDetailsFetchedSuccessfully(movieDetails: MovieDetailsModel) {
        view?.hideLoadingIndicator()
        view?.showData(model: movieDetails)
    }
    
    func movieDetailsFetchingFailed(withError error: Error) {
        view?.hideLoadingIndicator()
        router.showAlert(title: "Error!!!", message: error.localizedDescription)
    }
}
