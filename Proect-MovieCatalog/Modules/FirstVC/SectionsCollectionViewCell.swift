//
//  SectionsCollectionViewCell.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 31.01.22.
//

import UIKit

class SectionsCollectionViewCell: UICollectionViewCell {
    
     
     @IBOutlet private weak var imageView: DownloadPoster!
     @IBOutlet private weak var titleLabel: UILabel!
     @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.cancel()
        imageView.image = nil
    }
   
 
 func setup(movie: MovieMDB) {
     titleLabel.text = movie.original_title
     descriptionLabel.text = GenreString().genreName[movie.genre_ids?.first ?? 18]
     
     if let image = ImageCacheService.shared.load(movieId: String(movie.id)) {
         imageView.image = image
     } else {
         imageView.load(imageURLStr: movie.poster_path) { image in
             ImageCacheService.shared.save(movieId: String(movie.id), image: image)
         }
     }
  
 }
 
  
    func setup2(genre: GenresMDB) {   // ВНИМАНИЕ !!!! ЗАМЕНИТЬ НА MDB
        imageView.image = genre.picture
        titleLabel.text = GenreString().genreName[genre.rawValue]
        descriptionLabel.text = ""
        
        // не уверен!!! Продумать когда какой description  !!!!!!!!
    }    
    
}



