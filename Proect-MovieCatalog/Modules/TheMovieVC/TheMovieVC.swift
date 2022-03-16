//
//  TheMovieVC.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 21.02.22.
//

import UIKit

class TheMovieVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet private weak var tableView: UITableView!
    
    var movie: MovieMDB!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4  //  пока 4, - будет больше
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannerTablVwCell", for: indexPath) as? BannerTablVwCell
            cell?.setup(movie: movie)
            
            
                return cell ?? UITableViewCell()
            
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTablViwCell", for: indexPath) as? DescriptionTablViwCell
            cell?.descriptionTextView.text = movie.overview // movie.description
            
                return cell ?? UITableViewCell()
            
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TrailersTablViwCell", for: indexPath) as? TrailersTablViwCell
            //сюда CollectionView нужно вставить с трейлерами или скриншотами
                
            return cell ?? UITableViewCell()
            
        } else { // так актуально пока секций только 4
        let cell = tableView.dequeueReusableCell(withIdentifier: "RatingTablViwCell", for: indexPath) as? RatingTablViwCell
            cell?.setup(movie: movie)
           
            
            return cell ?? UITableViewCell()
        }
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 550.0
            
        } else if indexPath.section == 1 {
            return 120.0
            
        } else if indexPath.section == 2 {
            return 120.0
            
        } else {
            return 120.0
    }
}

 

}
