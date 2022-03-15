//
//  FirstViewModel.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 8.03.22.
//

import Foundation


protocol FirstViewModelProtocol: AnyObject {
    
    
    var movies: [MovieMDB] { get set }
    
    func getMovies()
    
    var moviesDidLoad: (() -> Void)? { get set }
}

final class FirstViewModel: FirstViewModelProtocol {
    
    private var topFilmsMDB: [MovieMDB] = []
    private var newFilmsMDB: [MovieMDB] = []
    private var spanishFilmsMDB: [MovieMDB] = []
    private var actionFilmsMDB: [MovieMDB] = []
    
    private var moviesInSectionsMDB = [[MovieMDB]]()
    
    
    var movies: [MovieMDB] = []
    var moviesDidLoad: (() -> Void)?
    
    private lazy var networkService = NetworkService()
    
    func getMovies() {
        
 /*       networkService.getMovies { [weak self] movies in
        
            if !movies.isEmpty {
               // self?.movies = movies
                
                print("111111: \(movies.count)")
                
                self?.topFilmsMDB = movies
                print("222222: \(self?.topFilmsMDB[0].original_title)")
                moviesInSectionsMDB.append(self?.topFilmsMDB ?? [])
                DispatchQueue.main.async {  // НУЖНО ЛИ ВЫХОДИТЬ В main ???
                    self?.moviesDidLoad?()
                }
            } else {
                print("3333333")
            }
        }     */
        
       
        
        let imageBaseHost = "https://image.tmdb.org/t/p/w500/"
        guard let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=64bd7aebee16952871cba9199b823dd7&primary_release_date.gte=1985-01-01&sort_by=vote_average.desc&&vote_count.gte=20000") else {return}
        print("Тест URL 1: 01010101010101")
        
       var request = URLRequest(url: url, timeoutInterval: 30.0)
       request.httpMethod = "GET"
        print("Тест URL 2: \(url)")
       
       URLSession.shared.dataTask(with: request) { responseData, response, error in
           if let data = responseData {
               print("5555555")
               
               let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data)
              
               self.movies = movieResponse?.results ?? []
               //moviesInSectionsMDB.append(movieResponse?.results ?? [])
               print("ПРОВЕРКА moviesWithPoster: \(movieResponse?.results.count)")
           } else {
               print(0001110001)
               
           }
               //DispatchQueue.main.async {
               //}
       }.resume()
        
        if !self.movies.isEmpty {
            self.topFilmsMDB = self.movies
            DispatchQueue.main.async {
                self.moviesDidLoad?()
            
            }
        }

        
        
        
        
        
        
   /*
        networkService.getMovies(.top) { [weak self] movies, error in
            if let error = error {
                print("Error: \(#function) \(error.localizedDescription)")
                return
            }
            if !movies.isEmpty {
               // self?.movies = movies
                
                print("111111: \(movies.count)")
                
                topFilmsMDB = movies
                print("222222: \(topFilmsMDB[0].original_title)")
                moviesInSectionsMDB.append(topFilmsMDB)
                DispatchQueue.main.async {  // НУЖНО ЛИ ВЫХОДИТЬ В main ???
                    self?.moviesDidLoad?()
                }
            } else{
                print("3333333")
            }
        }  */
        
 /*
        networkService.getMovies(.newFilms) { [weak self] movies, error in
            if let error = error {
                print("Error: \(#function) \(error.localizedDescription)")
                return
            }
            if !movies.isEmpty {
              //  self?.movies = movies
                newFilmsMDB = movies
                moviesInSectionsMDB.append(newFilmsMDB)
                DispatchQueue.main.async {       // НУЖНО ЛИ ВЫХОДИТЬ В main ???
                    self?.moviesDidLoad?()
                }
            }
        }
        
        networkService.getMovies(.spanishFilms) { [weak self] movies, error in
            if let error = error {
                print("Error: \(#function) \(error.localizedDescription)")
                return
            }
            if !movies.isEmpty {
              //  self?.movies = movies
                spanishFilmsMDB = movies
                moviesInSectionsMDB.append(spanishFilmsMDB)
                DispatchQueue.main.async {    // НУЖНО ЛИ ВЫХОДИТЬ В main ???
                    self?.moviesDidLoad?()
                }
            }
        }
        
        networkService.getMovies(.actionFilms) { [weak self] movies, error in
            if let error = error {
                print("Error: \(#function) \(error.localizedDescription)")
                return
            }
            if !movies.isEmpty {
              //  self?.movies = movies
                actionFilmsMDB = movies
                moviesInSectionsMDB.append(actionFilmsMDB)
                DispatchQueue.main.async {
                    self?.moviesDidLoad?()
                }
            }
        }
  */
        print("Точка FirstViewModel.getMovies: \(self.movies.count)")
        print("Точка FirstViewModel.getMovies: \(topFilmsMDB.count)")
        //print("Точка FirstViewModel.getMovies: \(moviesInSectionsMDB)")   // TEST
    }
    
}
