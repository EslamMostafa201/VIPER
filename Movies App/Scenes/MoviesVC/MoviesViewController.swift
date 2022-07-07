//
//  MoviesViewController.swift
//  Movies App
//
//  Created by Eslam Mostafa on 26/04/2022.
//

import UIKit

class MoviesViewController: UIViewController, Loadable, MoviesViewProtocol {
    //MARK: - Outlets
    @IBOutlet weak var moviesTableView: UITableView!
    
    // MARK: - Properties
    var presenter: MoviesPresenterProtocol?
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter?.viewDidLoad()
    }
    
    //MARK: - Methods
    private func setupTableView() {
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        moviesTableView.register(MovieTableViewCell.nib, forCellReuseIdentifier: MovieTableViewCell.identifier)
    }
    
    func showLoadingIndicator() {
        self.showLoading(show: true)
    }
    
    func hideLoadingIndicator() {
        self.showLoading(show: false)
    }
    
    func reloadData() {
        moviesTableView.reloadData() 
    }
}

//MARK: - TableView Methods
extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfMovies ?? 0 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
        presenter?.configure(cell: cell, index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showMovieDetails(index: indexPath.row)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == self.moviesTableView {
            let endScrolling = (scrollView.contentOffset.y + scrollView.frame.size.height)
            
            if endScrolling >= scrollView.contentSize.height {
                presenter?.checkIsHasNext()
            }
        }
    }
}

