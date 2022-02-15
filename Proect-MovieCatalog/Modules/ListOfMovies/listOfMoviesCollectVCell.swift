//
//  listOfMoviesCollectVCell.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 10.02.22.
//

import UIKit

class listOfMoviesCollectVCell: UICollectionViewCell {
    
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

func setup(movie: Movie) {
    imageView.image = movie.image
    titleLabel.text = movie.nameRus
    descriptionLabel.text = movie.genre[0].rawValue
    
    // не уверен!!! Продумать когда какой description  !!!!!!!!
}
    func setup2(genre: Genres) {
        imageView.image = genre.picture
        titleLabel.text = ""
        descriptionLabel.text = ""
        
        // не уверен!!! Продумать когда какой description  !!!!!!!!
    }
    
    
    
}
