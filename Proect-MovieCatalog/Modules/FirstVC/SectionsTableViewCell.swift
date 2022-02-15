//
//  SectionsTableViewCell.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 31.01.22.
//

import UIKit

protocol SectionButtonDelegate {
    func openFilmsOfSection(at index:IndexPath)
}

class SectionsTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
   
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var seeAllLabel: UILabel!
    @IBOutlet weak var sectionButton: UIButton!
    
    var delegate: SectionButtonDelegate!
    var indexPath: IndexPath!
    
    var currentSectionOfTable: Int!
    
    
    @IBAction func sectionButton(_ sender: UIButton) {
        self.delegate.openFilmsOfSection(at: indexPath)
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if currentSectionOfTable != SectionsOfMain.allStringCases.firstIndex(of: "Жанры") {
            return moviesInSections[currentSectionOfTable].count
        } else {
            return Genres.allStringCases.count
        }
    } 

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionsCollectionViewCell", for: indexPath) as? SectionsCollectionViewCell
       
          // cell?.setup(movie: moviesInSections[currentSectionOfTable][indexPath.row])
          //  return cell ?? UICollectionViewCell()
    
             if currentSectionOfTable != SectionsOfMain.allStringCases.firstIndex(of: "Жанры") {
                 cell?.setup(movie: moviesInSections[currentSectionOfTable][indexPath.row])
             } else {
                 cell?.setup2(genre: Genres.allCases[indexPath.row])
             }
             return cell ?? UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if currentSectionOfTable != SectionsOfMain.allStringCases.firstIndex(of: "Жанры") {
            return CGSize(width: 118.0, height: 268.0)
        } else {
            return CGSize(width: 240.0, height: 240.0)
        }
       // return CGSize(width: (UIScreen.main.bounds.width - 30.0 - 15*2) / 3, height: 210)
    }
}



/*  может пригодиться
 /// Returns the index path that corresponds to the given title / index. (e.g. "B",1)
 /// Return an index path with a single index to indicate an entire section, instead of a specific item.

func collectionView(_ collectionView: UICollectionView, indexPathForIndexTitle title: String, at index: Int) -> IndexPath
}
 */
