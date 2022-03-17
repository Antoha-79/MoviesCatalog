//
//  listOfMoviesCollectVCell.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 10.02.22.
//

import UIKit

class listOfMoviesCollectVCell: UICollectionViewCell {
    
    
    @IBOutlet private weak var imageView: DownloadPoster!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

func setup(movie: MovieMDB) {
    //imageView.image = UIImage(named: "TestImage") // movie.image // ВРЕМЕННО, пока нет сохраненных
    imageView.load(imageURLStr: movie.poster_path) { image in
        self.imageView?.image = image
    }
    
    titleLabel.text = movie.title
    descriptionLabel.text = "ПОКА ТЕСТ" // movie.genre[0].rawValue//  ВРЕМЕННО
    
    // не уверен!!! Продумать когда какой description  !!!!!!!!
}
    func setup2(genre: GenresMDB) {
        imageView.image = genre.picture 
        titleLabel.text = ""
        descriptionLabel.text = ""
        
        // не уверен!!! Продумать когда какой description  !!!!!!!!
    }
    
    
    
}
