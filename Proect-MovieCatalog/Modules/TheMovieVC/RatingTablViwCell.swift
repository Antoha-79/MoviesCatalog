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

    var movieRating: Double! //= 0.0
    var movieRatingCount: Int! //= 0

    override func awakeFromNib() {
        super.awakeFromNib()
        
       print(" ")
       print("TEST!: \(movieRating)")
       print(" ")
        
        imdbRating.text = "\(movieRating)"
        imdbCount.text = "\(movieRatingCount) оценок"
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
