//
//  MenuTableViewCell.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 19.02.22.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var menuCollectionView: UICollectionView!
    
    var indexPath: IndexPath!
    var currentSectionOfTable: Int!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}


extension MenuTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainMenu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCollectionViewCell", for: indexPath) as? MenuCollectionViewCell
        cell?.menuLabel.text = mainMenu[indexPath.row]
        if indexPath.row == 0 {
            cell?.menuLabel.textColor = .black
        } else {
            cell?.menuLabel.textColor = .gray
        }

        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - 30.0) / 3.5, height: 30)
    }
  
 /*
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        indexPath.row
        
        
    }  */
    
}
