//
//  MovieTableViewCell.swift
//  Movies-DB
//
//  Created by Abdelrahman Sobhy on 3/12/21.
//

import UIKit
import Cosmos
import Kingfisher

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieRate: CosmosView!
    @IBOutlet weak var movieRateCount: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieOverview: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(cell: ResultViewModel){
        movieImage.kf.setImage(with: URL(string: cell.posterUrl))
        movieTitle.text = cell.movieTitle
        movieRate.rating = cell.movieRate
        movieRateCount.text = cell.movieRateCount
        movieReleaseDate.text = cell.movieReleaseDate
        movieOverview.text = cell.movieOverview
    }

}
