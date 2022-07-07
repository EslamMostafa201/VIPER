//
//  MovieDetailsProtocols.swift
//  Movies App
//
//  Created by Eslam Mostafa on 07/07/2022.
//

import Foundation

protocol MovieDetailsViewProtocol: AnyObject {
    var presenter: MovieDetailsPresenterProtocol? { get set }
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func showData(model: MovieDetailsModel)
}

protocol MovieDetailsPresenterProtocol: AnyObject {
    var view: MovieDetailsViewProtocol? { get set }
    func viewDidLoad()
}

protocol MovieDetailsRouterProtocol {
    func showAlert(title: String, message: String)
}

protocol MovieDetailsInteractorInputProtocol {
    var presenter: MovieDetailsInteractorOutputProtocol? { get set }
    func getMovieDetails(movieId: Int)
}

protocol MovieDetailsInteractorOutputProtocol: AnyObject {
    func movieDetailsFetchedSuccessfully(movieDetails: MovieDetailsModel)
    func movieDetailsFetchingFailed(withError error: Error)
}
