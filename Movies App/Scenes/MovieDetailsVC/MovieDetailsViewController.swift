//
//  MovieDetailsViewController.swift
//  Movies App
//
//  Created by Eslam Mostafa on 27/04/2022.
//

import UIKit

class MovieDetailsViewController: UIViewController, Loadable {
    // MARK: - Outlets
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Properties
    private var viewModel: MovieDetailsViewModelProtocol
    
    // MARK: - Initialization
    init(with viewModel: MovieDetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBinding()
        viewModel.getMovieDetailsApi()
    }
    
    private func configureBinding() {
        self.title = "Details"
        
        viewModel.getMovieDetailClosure = { [weak self] movie in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.setMovieData(movie: movie)
            }
        }
        
        viewModel.updateLoadingStatus = { [weak self] status in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.showLoading(show: status)
            }
        }
        
        viewModel.showAlertClosure = { [weak self] message in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.showAlert(alertTitle: "Error !", alertMessge: message, actionTitle: "OK")
            }
        }
    }
    
    private func setMovieData(movie: MovieDetailsModel) {
        movieImageView.loadFromUrl(stringUrl: movie.poster_path ?? "")
        movieTitleLabel.text = movie.title ?? ""
        dateLabel.text = movie.release_date ?? ""
        descriptionLabel.text = movie.overview ?? ""
    }
}
