//
//  FirstVC.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 30.01.22.
//

import UIKit

class FirstVC: UIViewController, UITableViewDelegate, UITableViewDataSource, SectionButtonDelegate {
    
    @IBOutlet private weak var menuCollectionView: UICollectionView!
    @IBOutlet private weak var tableView: UITableView!
    
    let mainMenu = ["Каталог", "Магазин", "Покупки", "Загрузки"]


    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        
    
        moviesInSections.append(topFilms)
        moviesInSections.append(newFilms)
        moviesInSections.append(serialsFilms)
        moviesInSections.append(actionFilms)
        moviesInSections.append(filmsByGenre(genre: .comedy))
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        SectionsOfMain.allCases.count
    }
    
/*   // решил заголовки секций через label сделать в таблице
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return SectionsOfMain.allStringCases[section]
    }


    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

    let myLabel = UILabel()
    myLabel.frame = CGRect(x: 0, y: 2, width: 200, height: 24)
    myLabel.font = UIFont.boldSystemFont(ofSize: 20)
    myLabel.text = self.tableView(tableView, titleForHeaderInSection: section)

    let headerView = UIView()
    headerView.addSubview(myLabel)

    return headerView
    }
*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SectionsTableViewCell", for: indexPath) as? SectionsTableViewCell

        cell?.sectionLabel.text = SectionsOfMain.allStringCases[indexPath.section]
        cell?.seeAllLabel.text = "Все"
        cell?.currentSectionOfTable = indexPath.section
        
        cell?.delegate = self
        cell?.indexPath = indexPath
        
        return cell ?? UITableViewCell()
    }
    
    func openFilmsOfSection(at index: IndexPath) {
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
         let nextVC = storyboard.instantiateViewController(withIdentifier: "listOfMoviesVC") as! listOfMoviesVC
        nextVC.currentSectionOfTable = index.section
        navigationController?.pushViewController(nextVC, animated: true)
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 289.0
    }
  
 /*  // ПРОПИСАТЬ как будет сверстан экран "о фильме"
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AboutMovieVC") as? AboutMovieVC
        nextVC?.person = persons[indexPath.row]
        present(nextVC!, animated: true, completion: nil)
    }
 */
    
    
  
    


}


extension FirstVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainMenu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCollectionViewCell", for: indexPath) as? MenuCollectionViewCell
        cell?.menuLabel.text = mainMenu[indexPath.row]
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - 30.0) / 3.5, height: 26)
    }
    
}
