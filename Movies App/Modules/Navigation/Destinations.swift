//
//  Destinations.swift
//  Cars
//
//  Created by Eslam Mostafa on 15/02/2022.
//

import UIKit

enum Destinations {
    case moviesVC

    var viewcontroller: UIViewController {
        switch self {
        case .moviesVC:
            return MoviesViewController(with: MoviesViewModel())
        }
    }
}
