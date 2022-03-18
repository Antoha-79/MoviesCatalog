//
//  RatingTablViwCell.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 1.03.22.
//

import UIKit

class RatingTablViwCell: UITableViewCell {
    
    @IBOutlet private weak var imdbRating: UILabel!
    @IBOutlet private weak var imdbCount: UILabel!

    func setup(movie: MovieMDB) {
        imdbRating.text = "Rating IMDB: \(movie.vote_average)"
        imdbCount.text = "Проголосовало: \(movie.vote_count)"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
