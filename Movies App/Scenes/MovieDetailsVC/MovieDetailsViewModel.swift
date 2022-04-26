//
//  MovieDetailsViewModel.swift
//  Movies App
//
//  Created by Eslam Mostafa on 27/04/2022.
//

import Foundation

protocol MovieDetailsViewModelProtocol {
    func getMovieDetailsApi()
    var getMovieDetailClosure: ((_ movie: MovieDetailsModel)->())? {get set}
    var updateLoadingStatus: ((_ status: Bool)->())? {get set}
    var showAlertClosure: ((_ message: String)->())? {get set}
}

class MovieDetailsViewModel: MovieDetailsViewModelProtocol {
    // MARK: - Properties
    private var movieDetailsAPI: ApiClientProtocol
    var getMovieDetailClosure: ((MovieDetailsModel) -> ())?
    var updateLoadingStatus: ((Bool) -> ())?
    var showAlertClosure: ((String) -> ())?
    private var movieId : Int
    
    // MARK: - Initialization
    init(movieDetailsAPI: ApiClientProtocol = ApiClient(), movieId: Int) {
        self.movieDetailsAPI = movieDetailsAPI
        self.movieId = movieId
    }
    
    // MARK: - Methods
    func getMovieDetailsApi() {
        updateLoadingStatus?(true)
        self.movieDetailsAPI.sendRequest(MovieDetailsAPI.movieDetails(id: self.movieId), decadoingType: MovieDetailsModel.self) { result in
            self.updateLoadingStatus?(false)
            switch result {
            case .success(let model):
                self.getMovieDetailClosure?(model)
            case .failure(let error):
                self.showAlertClosure?(error.localizedDescription)
                break
            }
        }
    }
}
