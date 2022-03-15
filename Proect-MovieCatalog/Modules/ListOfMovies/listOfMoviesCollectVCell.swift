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
    imageView.image = movie.image // UIImage(named: "TestImage") // ВРЕМЕННО, пока нет сохраненных
    titleLabel.text = movie.nameRus // movie.title
    descriptionLabel.text = movie.genre[0].rawValue // "ПОКА ТЕСТ"//  ВРЕМЕННО
    
    // не уверен!!! Продумать когда какой description  !!!!!!!!
}
    func setup2(genre: Genres) {
        imageView.image = genre.picture // UIImage(named: "TestImage") // ВРЕМЕННО
        titleLabel.text = ""
        descriptionLabel.text = ""
        
        // не уверен!!! Продумать когда какой description  !!!!!!!!
    }
    
    
    
}
