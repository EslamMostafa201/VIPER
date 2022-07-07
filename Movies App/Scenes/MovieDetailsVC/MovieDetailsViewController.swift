//
//  MovieDetailsViewController.swift
//  Movies App
//
//  Created by Eslam Mostafa on 27/04/2022.
//

import UIKit

class MovieDetailsViewController: UIViewController, Loadable, MovieDetailsViewProtocol {
    // MARK: - Outlets
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    // MARK: - Properties
    var presenter: MovieDetailsPresenterProtocol?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
    
    // MARK: - Methods
    private func setupUI() {
        self.title = "Details"
        containerView.isHidden = true
    }
    
    func showLoadingIndicator() {
        self.showLoading(show: true)
    }
    
    func hideLoadingIndicator() {
        self.showLoading(show: false)
    }
    
    func showData(model: MovieDetailsModel) {
        movieImageView.loadFromUrl(stringUrl: model.poster_path ?? "")
        movieTitleLabel.text = model.title ?? ""
        dateLabel.text = model.release_date ?? ""
        descriptionLabel.text = model.overview ?? ""
        containerView.isHidden = false
    }
}
