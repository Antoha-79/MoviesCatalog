//
//  FirstVC.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 30.01.22.
//

import UIKit

class FirstVC: UIViewController, UITableViewDelegate, UITableViewDataSource, SectionButtonDelegate, SelectedCollectionCellDelegate {
    
   
    @IBOutlet private weak var tableView: UITableView!
    
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

        let hideLeftButton: Bool = velocity.y < 0 ? true : false

        UIView.animate(withDuration: 0.1, delay: 0, options: UIView.AnimationOptions(), animations: {
            self.navigationItem.leftBarButtonItem?.customView?.isHidden = hideLeftButton

        }, completion: nil)
        
    }
    
    private var viewModel: FirstViewModelProtocol = FirstViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        bind()
        viewModel.getMovies()
    
        setupTitle()
        
    }
    
    
    
    
    private func bind() {
        viewModel.moviesDidLoad = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.leftBarButtonItem?.customView?.isHidden = true
    }
    
    func setupTitle() {
        let titleLabel = UILabel()
        titleLabel.text = "Главное"
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        titleLabel.sizeToFit()

            let leftItem = UIBarButtonItem(customView: titleLabel)
            self.navigationItem.leftBarButtonItem = leftItem
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //пока ничего не скачалось показываем пустую таблицу
        if viewModel.moviesInSectionsMDB.isEmpty {
            return 0
        }
        return SectionsOfMain.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
        cell?.cellDelegate = self
        cell?.indexPath = indexPath
        cell?.moviesInSections = viewModel.moviesInSectionsMDB
        
            return cell ?? UITableViewCell()
        }
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 50.0
        } else if indexPath.section == 1 {
            return 45.0
            
        } else if indexPath.section == 2 {
            return 192.0
            
        } else {
            return 289.0
    }
}
    
    func openFilmsOfSection(at index: IndexPath) {
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
         let nextVC = storyboard.instantiateViewController(withIdentifier: "listOfMoviesVC") as! listOfMoviesVC
        nextVC.currentSectionOfTable = index.section
        nextVC.moviesInSections = viewModel.moviesInSectionsMDB
        navigationController?.pushViewController(nextVC, animated: true)
       
    }
    
    func openFilm(_ movie: MovieMDB) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "TheMovieVC") as! TheMovieVC
        nextVC.movie = movie
        navigationController?.pushViewController(nextVC, animated: true)
        
}
  

}
