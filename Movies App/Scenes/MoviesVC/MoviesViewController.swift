//
//  MoviesViewController.swift
//  Movies App
//
//  Created by Eslam Mostafa on 26/04/2022.
//

import UIKit

class MoviesViewController: UIViewController, Loadable {
    //MARK: - Outlets
    @IBOutlet weak var moviesTableView: UITableView!
    
    // MARK: - Properties
    private var viewModel: MoviesViewModelProtocol
    
    // MARK: - Initialization
    init(with viewModel: MoviesViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        configureBinding()
        viewModel.getMoviesApi()
    }
    
    //MARK: - Methods
    private func setupTableView() {
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        moviesTableView.register(MovieTableViewCell.nib, forCellReuseIdentifier: MovieTableViewCell.identifier)
    }
    
    private func configureBinding() {
        self.title = "Movies"
        
        viewModel.reloadTableClosure = { [weak self] () in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.moviesTableView.reloadData()
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
}

//MARK: - TableView Methods
extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfCells()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
        cell.configureCell(model: viewModel.getCellAt(index: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.navigateToDetails(movieId: viewModel.getCellAt(index: indexPath.row).id ?? 0)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == self.moviesTableView {
            let endScrolling = (scrollView.contentOffset.y + scrollView.frame.size.height)
            
            if endScrolling >= scrollView.contentSize.height {
                if viewModel.checkIsHasNext() {
                    viewModel.getMoviesApi()
                }
            }
        }
    }
}
