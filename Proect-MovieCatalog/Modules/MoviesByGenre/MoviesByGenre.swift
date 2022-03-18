//
//  MoviesByGenre.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 17.03.22.
//

import UIKit

class MoviesByGenre: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    var moviesByGenre: [MovieMDB] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return moviesByGenre.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ByGenreCollectViewCell", for: indexPath) as? ByGenreCollectViewCell
        
                 cell?.setup(movie: moviesByGenre[indexPath.row])
             
             return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
            return CGSize(width: 118.0, height: 268.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
            let selectedMovie = moviesByGenre[indexPath.row]
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC = storyboard.instantiateViewController(withIdentifier: "TheMovieVC") as! TheMovieVC
            nextVC.movie = selectedMovie
            navigationController?.pushViewController(nextVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }

}
