//
//  MoviesProtocols.swift
//  Movies App
//
//  Created by Eslam Mostafa on 07/07/2022.
//

import Foundation

protocol MoviesViewProtocol: AnyObject {
    var presenter: MoviesPresenterProtocol? { get set }
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func reloadData()
}

protocol MoviesPresenterProtocol {
    var view: MoviesViewProtocol? { get set }
    var numberOfMovies: Int { get }
    func viewDidLoad()
    func configure(cell: MovieCellView, index: Int)
    func checkIsHasNext()
    func showMovieDetails(index: Int)
}

protocol MoviesRouterProtocol {
    func navigateToMovieDetails(movieId: Int)
    func showAlert(title: String, message: String)
}

protocol MoviesInteractorInputProtocol {
    var presenter: MoviesInteractorOutputProtocol? { get set }
    func getMovies(pageNumber: Int)
}

protocol MoviesInteractorOutputProtocol: AnyObject {
    func moviesFetchesSuccessfully(moviesModel: MoviesModel)
    func moviesFetchingFailed(withError error: Error)
}

protocol MovieCellView {
    func congigureCell(viewModel: MoviesViewModel)
}
