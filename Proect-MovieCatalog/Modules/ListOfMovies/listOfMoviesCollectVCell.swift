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
    
    titleLabel.text = movie.title
    descriptionLabel.text =  GenreString().genreName[movie.genre_ids?.first ?? 18]
    
    if let image = ImageCacheService.shared.load(movieId: String(movie.id)) {
        imageView.image = image
    } else {
        imageView.load(imageURLStr: movie.poster_path) { image in
            ImageCacheService.shared.save(movieId: String(movie.id), image: image)
        }
    }
    

}
    func setup2(genre: GenresMDB) {
        imageView.image = genre.picture 
        titleLabel.text = GenreString().genreName[genre.rawValue]
        descriptionLabel.text = ""
       // print(genre.rawValue)
        // не уверен!!! Продумать когда какой description  !!!!!!!!
    }
    
    
    
}
