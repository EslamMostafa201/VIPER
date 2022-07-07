//
//  MoviesRouter.swift
//  Movies App
//
//  Created by Eslam Mostafa on 07/07/2022.
//

import Foundation
import UIKit

class MoviesRouter: MoviesRouterProtocol {
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = MoviesViewController()
        let interactor = MoviesInteractor()
        let router = MoviesRouter()
        let presenter = MoviesPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
    func navigateToMovieDetails(movieId: Int) {
        let vc = MovieDetailsRouter.createModule(movieId: movieId)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showAlert(title: String, message: String) {
        viewController?.showAlert(alertTitle: title, alertMessge: message, actionTitle: "Ok")
    }
}
