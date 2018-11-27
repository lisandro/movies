//
//  MovieTableViewCell.swift
//  movies
//
//  Created by Lisandro on 24/11/2018.
//  Copyright © 2018 Lisandro. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieTableViewCell: UITableViewCell {
    static let identifier = "MovieTableViewCell"
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    func setup(with movie: Movie) {
        if let posterPath = movie.posterPath, let url = URL(string: AppParameters.PosterImage.url + posterPath) {
            posterImageView.af_setImage(withURL: url)
        }
        genreLabel.text = "Drama"
        titleLabel.text = movie.title
    }
}
