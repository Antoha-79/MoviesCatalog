//
//  listOfMoviesVC.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 10.02.22.
//

import UIKit

class listOfMoviesVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var currentSectionOfTable: Int!
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if currentSectionOfTable != SectionsOfMain.allStringCases.firstIndex(of: "Жанры") {
            return moviesInSections[currentSectionOfTable].count
        } else {
            //return Genres.allStringCases.count  //ВНИМАНИЕ - переделать на список апо жанру
            return moviesInSections[currentSectionOfTable].count // ВРЕМЕННО
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listOfMoviesCollectVCell", for: indexPath) as? listOfMoviesCollectVCell
       
          // cell?.setup(movie: moviesInSections[currentSectionOfTable][indexPath.row])
          //  return cell ?? UICollectionViewCell()
    
             if currentSectionOfTable != SectionsOfMain.allStringCases.firstIndex(of: "Жанры") {
                 cell?.setup(movie: moviesInSections[currentSectionOfTable][indexPath.row])
             } else {
                // cell?.setup2(genre: Genres.allCases[indexPath.row]) //- переделать
                 cell?.setup(movie: moviesInSections[currentSectionOfTable][indexPath.row]) //временно
             }
             return cell ?? UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if currentSectionOfTable != SectionsOfMain.allStringCases.firstIndex(of: "Жанры") {
            //return CGSize(width: 118.0, height: 268.0) // 143*210
            return CGSize(width: (UIScreen.main.bounds.width - 15.0*3) / 2, height: 243)
        } else {
            return CGSize(width: 118.0, height: 268.0)
        }
       // return CGSize(width: (UIScreen.main.bounds.width - 30.0 - 15*2) / 3, height: 210)
    }
    
    
    
   
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
       
    }
    

  

}
