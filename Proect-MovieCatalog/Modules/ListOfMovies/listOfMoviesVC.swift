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
            return moviesInSectionsMDB[currentSectionOfTable - 3].count
        } else {
            return GenresMDB.allStringCases.count  //ВНИМАНИЕ - переделать на список апо жанру
           
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listOfMoviesCollectVCell", for: indexPath) as? listOfMoviesCollectVCell
       
          // cell?.setup(movie: moviesInSections[currentSectionOfTable][indexPath.row])
          //  return cell ?? UICollectionViewCell()
    
             if currentSectionOfTable != SectionsOfMain.allStringCases.firstIndex(of: "Жанры") {
                 cell?.setup(movie: moviesInSectionsMDB[currentSectionOfTable - 3][indexPath.row])
             } else {
                // cell?.setup2(genre: Genres.allCases[indexPath.row]) //- переделать
                 cell?.setup(movie: moviesInSectionsMDB[currentSectionOfTable - 3][indexPath.row]) //временно
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMovie = moviesInSectionsMDB[currentSectionOfTable - 3][indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "TheMovieVC") as! TheMovieVC
        nextVC.movie = selectedMovie
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
   
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        

        setLeftAlignTitleView(font: .systemFont(ofSize: 20, weight: .bold), text: "На главную", textColor: .black)
 
  
    }
    
  
    func setLeftAlignTitleView(font: UIFont, text: String, textColor: UIColor) {
        guard let navFrame = navigationController?.navigationBar.frame else{
            return
        }
        
        let parentView = UIView(frame: CGRect(x: 0, y: 0, width: navFrame.width, height: navFrame.height))
        self.navigationItem.titleView = parentView
        
        let label = UILabel(frame: .init(x: parentView.frame.minX, y: parentView.frame.minY, width: parentView.frame.width, height: parentView.frame.height))
        label.backgroundColor = .clear
        label.numberOfLines = 1
        label.font = font
        label.textAlignment = .left
        label.textColor = textColor
        label.text = text
        
        parentView.addSubview(label)
    }
    
    @IBAction private func backDidTap() {
        
        navigationController?.popViewController(animated: true)
    }
    

}



