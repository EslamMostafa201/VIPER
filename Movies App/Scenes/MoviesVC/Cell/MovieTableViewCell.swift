//
//  MovieTableViewCell.swift
//  Movies App
//
//  Created by Eslam Mostafa on 26/04/2022.
//

import UIKit

class MovieTableViewCell: UITableViewCell, MovieCellView {
    //MARK: - Outlets
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    //MARK: - Properties
    static var identifier: String {
        return String.init(describing: self)
    }
    
    static var nib: UINib {
        return UINib.init(nibName: String.init(describing: self), bundle: nil)
    }
    
    //MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    //MARK: - Methods
    func congigureCell(viewModel: MoviesViewModel) {
        movieTitleLabel.text = viewModel.title
        dateLabel.text = viewModel.date
        movieImageView.loadFromUrl(stringUrl: viewModel.avatar)
    }
}
