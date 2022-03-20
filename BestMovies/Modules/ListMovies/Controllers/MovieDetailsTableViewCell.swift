//
//  MovieDetailsTableViewCell.swift
//  BestMovies
//
//  Created by HaniMac on 19/03/2022.
//

import UIKit
import Kingfisher

class MovieDetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var noteMovie: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(movie: Movie) {
        movieName.text = movie.nameMovie
        noteMovie.text = String(movie.dateMovie)
        let url = URL(string: "https://image.tmdb.org/t/p/w500/\(movie.urlImageMovie)")
        movieImage.kf.setImage(with: url)
    }
}
