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

protocol SelectedCollectionCellDelegate {
    func openFilm(_ movie: Movie)
}

class SectionsTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
   
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var seeAllLabel: UILabel!
    @IBOutlet weak var sectionButton: UIButton!
    
    var currentSectionOfTable: Int!
    var indexPath: IndexPath!
    
    var delegate: SectionButtonDelegate?
    var cellDelegate: SelectedCollectionCellDelegate?
    
    
    @IBAction func sectionButton(_ sender: UIButton) {
        self.delegate?.openFilmsOfSection(at: indexPath)
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       // print("ПРОВЕРКА collect.view: \(moviesInSectionsMDB.count)")
        print("")
        if currentSectionOfTable != SectionsOfMain.allStringCases.firstIndex(of: "Жанры") {
           
            print("ТЕСТ currentSectionOfTable:  \(currentSectionOfTable)")
            print("ТЕСТ moviesInSections:  \(moviesInSections.count)")
           
            return moviesInSections[currentSectionOfTable - 3].count
        } else {
            return Genres.allStringCases.count
    }
}

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SectionsCollectionViewCell", for: indexPath) as? SectionsCollectionViewCell
    
             if currentSectionOfTable != SectionsOfMain.allStringCases.firstIndex(of: "Жанры") {
                 cell?.setup(movie: moviesInSections[currentSectionOfTable - 3][indexPath.row])
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
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMovie: Movie!
        selectedMovie = moviesInSections[currentSectionOfTable - 3][indexPath.row]
        self.cellDelegate?.openFilm(selectedMovie)
       
    }
    
    
    
    
    
}

