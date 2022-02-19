//
//  FirstVC.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 30.01.22.
//

import UIKit

class FirstVC: UIViewController, UITableViewDelegate, UITableViewDataSource, SectionButtonDelegate {
    
   
    @IBOutlet private weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    
        moviesInSections.append(topFilms)
        moviesInSections.append(newFilms)
        moviesInSections.append(serialsFilms)
        moviesInSections.append(actionFilms)
        moviesInSections.append(filmsByGenre(genre: .comedy))
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        SectionsOfMain.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == SectionsOfMain.allStringCases.firstIndex(of: "MyMovie") ?? 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AppNameTableViewCell", for: indexPath) as? AppNameTableViewCell
            
                return cell ?? UITableViewCell()
            
        } else if indexPath.section == SectionsOfMain.allStringCases.firstIndex(of: "mainMenu") ?? 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as? MenuTableViewCell
            cell?.currentSectionOfTable = indexPath.section
            cell?.indexPath = indexPath
            
                return cell ?? UITableViewCell()
            
            
        } else if indexPath.section == SectionsOfMain.allStringCases.firstIndex(of: "banner") ?? 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannerTableViewCell", for: indexPath) as? BannerTableViewCell
                
            return cell ?? UITableViewCell()
            
        } else {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SectionsTableViewCell", for: indexPath) as? SectionsTableViewCell

        cell?.sectionLabel.text = SectionsOfMain.allStringCases[indexPath.section]
        cell?.seeAllLabel.text = "Все"
        cell?.currentSectionOfTable = indexPath.section
        
        cell?.delegate = self
        cell?.indexPath = indexPath
        
            return cell ?? UITableViewCell()
        }
    }
    
    func openFilmsOfSection(at index: IndexPath) {
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
         let nextVC = storyboard.instantiateViewController(withIdentifier: "listOfMoviesVC") as! listOfMoviesVC
        nextVC.currentSectionOfTable = index.section
        navigationController?.pushViewController(nextVC, animated: true)
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 30.0
        } else if indexPath.section == 1 {
            return 30.0
            
        } else if indexPath.section == 2 {
            return 192.0
            
        } else {
            return 289.0
    }
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


