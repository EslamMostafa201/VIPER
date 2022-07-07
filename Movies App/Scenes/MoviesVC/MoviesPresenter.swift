//
//  MoviesPresenter.swift
//  Movies App
//
//  Created by Eslam Mostafa on 07/07/2022.
//

import Foundation

class MoviesPresenter: MoviesPresenterProtocol, MoviesInteractorOutputProtocol  {
    weak var view: MoviesViewProtocol?
    private let interactor: MoviesInteractorInputProtocol
    private let router: MoviesRouterProtocol
    private var movies: [Movies] = []
    var numberOfMovies: Int {
        return movies.count
    }
    private var totalPages: Int = 0
    private var pageNumber: Int = 1
    
    init(view: MoviesViewProtocol, interactor: MoviesInteractorInputProtocol, router: MoviesRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router 
    }
    
    func viewDidLoad() {
        // Get Data
        view?.showLoadingIndicator()
        interactor.getMovies(pageNumber: self.pageNumber)
    }
    
    func configure(cell: MovieCellView, index: Int) {
        let movie = movies[index]
        let viewModel = MoviesViewModel(movie: movie)
        cell.congigureCell(viewModel: viewModel)
    }
    
    func moviesFetchesSuccessfully(moviesModel: MoviesModel) {
        view?.hideLoadingIndicator()
        self.movies.append(contentsOf: moviesModel.results ?? [])
        self.totalPages = moviesModel.total_pages ?? 0
        self.pageNumber += 1
        view?.reloadData()
    }
    
    func moviesFetchingFailed(withError error: Error) {
        view?.hideLoadingIndicator()
        router.showAlert(title: "Error!!!", message: error.localizedDescription)
    }
    
    func checkIsHasNext() {
        if (pageNumber <= totalPages) {
            viewDidLoad()
        }
    }
    
    func showMovieDetails(index: Int) {
        router.navigateToMovieDetails(movieId: movies[index].id ?? 0)
    }
}

