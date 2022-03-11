//
//  SectionsCollectionViewCell.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 31.01.22.
//

import UIKit

class SectionsCollectionViewCell: UICollectionViewCell {
    
    // static let rowHeight: CGFloat = 100.0
     
     @IBOutlet private weak var imageView: DownloadPoster!
     @IBOutlet private weak var titleLabel: UILabel!
     @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.cancel()
        imageView.image = nil
    }
   
 
 func setup(movie: MovieMDB) {
     imageView.load(imageURLStr: movie.poster_path) { image in
         self.imageView.image = image
     }
     
     titleLabel.text = movie.original_title
     descriptionLabel.text = GenreString().genreName[movie.genre_ids.first ?? 18] // времнно
     
     // не уверен!!! Продумать когда какой description  !!!!!!!!
  
 }
 
  
    func setup2(genre: Genres) {   // ВНИМАНИЕ !!!! ЗАМЕНИТЬ НА MDB
        imageView.image = genre.picture
        titleLabel.text = ""
        descriptionLabel.text = ""
        
        // не уверен!!! Продумать когда какой description  !!!!!!!!
    }
    
}


// было так
/*
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

 */
