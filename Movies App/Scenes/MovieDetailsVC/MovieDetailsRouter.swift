//
//  MovieDetailsRouter.swift
//  Movies App
//
//  Created by Eslam Mostafa on 07/07/2022.
//

import Foundation
import UIKit

class MovieDetailsRouter: MovieDetailsRouterProtocol {
    weak var viewController: UIViewController?
    
    static func createModule(movieId: Int) -> UIViewController {
        let view = MovieDetailsViewController()
        let interactor = MovieDetailsInteractor()
        let router = MovieDetailsRouter()
        let presenter = MovieDetailsPresenter(view: view, router: router, interactor: interactor, movieId: movieId)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
    func showAlert(title: String, message: String) {
        viewController?.showAlert(alertTitle: title, alertMessge: message, actionTitle: "Ok")
    }
}
