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
        
       // bind()
        viewModel.getMovies()
        
        
        
        
      //  testMovies(urlString: myUrl) { load, error in
       // }
        
       // testLoad()
        
        
        setupTitle()
        
        moviesInSections.append(topFilms)
        moviesInSections.append(newFilms)
        moviesInSections.append(serialsFilms)
        moviesInSections.append(actionFilms)
        moviesInSections.append(filmsByGenre(genre: .comedy))
        //moviesInSections.append(spanishFilms)
        
        
        //print("Точка FirstVC viewDidLoad: \(moviesInSections.count)")  // TEST
    }
    
    func testLoad() {
        
    let myUrl = "https://api.themoviedb.org/3/discover/movie?api_key=64bd7aebee16952871cba9199b823dd7&page=3&primary_release_date.gte=2022-02-15&primary_release_date.lte=2022-03-01&sort_by=popularity.desc"
        
    guard let url = URL(string: myUrl)  else { return }
    print(url)
        URLSession.shared.dataTask(with: url) { responseData, response, error in
                   if let error = error {
                       print(error.localizedDescription)
                   } else if let data = responseData {
                      // let jsonStr = String(data: data, encoding: .utf8) //  это работает
                     //  print("  ПРОБА п р о б а: \(jsonStr ?? "ОШИБКА")")
                       do {
                           let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                           //print("")
                           //moviesInSectionsMDB.append(movieResponse.results)
                           //print("Точка FirstVC viewDidLoad-2: \(moviesInSectionsMDB.count)")
                           print("")
                           movieResponse.results.forEach({ print("Название: \($0.original_title), Жанры   \($0.genre_ids)") })
                       } catch {
                           print("")
                           print("ВНИМАНИЕ !!  error")                        
                       }
                   }
               }.resume()
    }
    
  /* это был тест 1
    func testMovies(urlString: String, completion: @escaping ([MovieMDB], Error?) -> Void) {
        guard let url = URL(string: urlString)  else {
           //completion([], nil)
            print("ОШИБКА КАКАЯ-ТО")
           return
       }
     //  var request = URLRequest(url: url, timeoutInterval: 30.0)
     //  request.httpMethod = "GET"
        print(url)
       
      // URLSession.shared.dataTask(with: request) { responseData, response, error in
        URLSession.shared.dataTask(with: url) { responseData, response, error in
            DispatchQueue.main.async {
        if let error = error {
               print("Error 4444444")
               completion([], error)
            return
        }
            guard let data = responseData else { return}
            do {
                
                let someString = String(data: data, encoding: .utf8)
                print(someString ?? "НЕТ данных")
                
                   let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                print(movieResponse.results.count)
                completion(movieResponse.results, nil)
            } catch let jsonError {
              print("Ошибка декодирования JSON", jsonError)
                   completion([], jsonError)
               }
               }
       }.resume()
   }
    
   */
    
    
 /*   private func bind() {
        viewModel.moviesDidLoad = { [weak self] in
            self?.tableView.reloadData()
        }
    }*/
    
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
        SectionsOfMain.allCases.count
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
        navigationController?.pushViewController(nextVC, animated: true)
       
    }
    
    func openFilm(_ movie: Movie) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(withIdentifier: "TheMovieVC") as! TheMovieVC
        nextVC.movie = movie
        navigationController?.pushViewController(nextVC, animated: true)
        
}
  

}
