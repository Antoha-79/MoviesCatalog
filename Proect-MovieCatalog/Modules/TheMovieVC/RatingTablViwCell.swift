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

    func setup(movie: Movie) {
        imdbRating.text = "8.0"//"\(movie.vote_average)"
        imdbCount.text = "7860"//"\(movie.vote_count)"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
