//
//  Destinations.swift
//  Cars
//
//  Created by Eslam Mostafa on 15/02/2022.
//

import UIKit

enum Destinations {
    case moviesVC
    case movieDetailsVC(movieId: Int)
    
    var viewcontroller: UIViewController {
        switch self {
        case .moviesVC:
            return MoviesViewController(with: MoviesViewModel())
        case .movieDetailsVC(let movieId):
            return MovieDetailsViewController(with: MovieDetailsViewModel(movieId: movieId))
        }
    }
}
