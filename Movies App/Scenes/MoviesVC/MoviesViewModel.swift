//
//  MoviesViewModel.swift
//  Movies App
//
//  Created by Eslam Mostafa on 26/04/2022.
//

import Foundation

protocol MoviesViewModelProtocol {
    func getNumberOfCells() -> Int
    func getCellAt(index: Int) -> Movies
    func checkIsHasNext() -> Bool
    func navigateToDetails(movieId: Int)
    func getMoviesApi()
    var reloadTableClosure: (()->())? {get set}
    var updateLoadingStatus : ((_ status: Bool)->())? {get set}
    var showAlertClosure : ((_ message: String)->())? {get set}
}

class MoviesViewModel: MoviesViewModelProtocol {
    // MARK: - Properties
    private var totalPages: Int = 0
    private var pageNumber: Int = 1
    private var moviesAPI: ApiClientProtocol
    var reloadTableClosure: (() -> ())?
    var updateLoadingStatus: ((Bool) -> ())?
    var showAlertClosure: ((String) -> ())?
    private var moviesList: [Movies] = [] {
        didSet {
            reloadTableClosure?()
        }
    }
    
    // MARK: - Initialization
    init(moviesAPI: ApiClientProtocol = ApiClient()) {
        self.moviesAPI = moviesAPI
    }
    
    // MARK: - Methods
    func getNumberOfCells() -> Int {
        return moviesList.count
    }
    
    func getCellAt(index: Int) -> Movies {
        return moviesList[index]
    }
    
    func checkIsHasNext() -> Bool {
        return (pageNumber > totalPages) ? false : true
    }
    
    func navigateToDetails(movieId: Int) {
        try? AppNavigator().push(.movieDetailsVC(movieId: movieId))
    }
    
    func getMoviesApi() {
        updateLoadingStatus?(true)
        self.moviesAPI.sendRequest(MoviesAPI.movies(page: pageNumber), decadoingType: MoviesModel.self) { result in
            self.updateLoadingStatus?(false)
            switch result {
            case .success(let model):
                self.moviesList.append(contentsOf: model.results ?? [])
                self.totalPages = model.total_pages ?? 0
                self.pageNumber += 1
            case .failure(let error):
                self.showAlertClosure?(error.localizedDescription)
                break
            }
        }
    }
}
