//
//  FirstViewModel.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 8.03.22.
//

import Foundation


protocol FirstViewModelProtocol: AnyObject {
    
    
    var moviesInSectionsMDB: [[MovieMDB]] { get set }
    
    func getMovies()
    
    var moviesDidLoad: (() -> Void)? { get set }
}

final class FirstViewModel: FirstViewModelProtocol {
    
    // private var topFilmsMDB: [MovieMDB] = []
    // private var newFilmsMDB: [MovieMDB] = []
    // private var spanishFilmsMDB: [MovieMDB] = []
    // private var actionFilmsMDB: [MovieMDB] = []
    
    
    var moviesInSectionsMDB: [[MovieMDB]] = []  // тестовый пока
    var moviesDidLoad: (() -> Void)?
    
    private lazy var networkService = NetworkService()
    
    func getMovies() {
        
   /*     networkService.getMoviesTest { [weak self] movies, error in
            if let error = error {
                print("Error: \(#function) \(error.localizedDescription)")
                return
            }
            if !movies.isEmpty {
                self?.moviesInSectionsMDB.append(movies) //= moviesN
                
                print("111111: \(self?.moviesInSectionsMDB.count)")
                print("222222 poster: \(self?.moviesInSectionsMDB.first?.first?.poster_path)")
            
                DispatchQueue.main.async {
                    self?.moviesDidLoad?()
                }
            }
        }
  */
        
   
        networkService.getMovies(.top) { [weak self] movies, error in
            if let error = error {
                print("Error: \(#function) \(error.localizedDescription)")
                return
            }
            if !movies.isEmpty {
                self?.moviesInSectionsMDB.append(movies)
                
                print("TOP movies: \(movies.count)")
        }  
    }
        
        networkService.getMovies(.newFilms) { [weak self] movies, error in
            if let error = error {
                print("Error: \(#function) \(error.localizedDescription)")
                return
            }
            if !movies.isEmpty {
                self?.moviesInSectionsMDB.append(movies)
                
                print("NEW movies: \(movies.count)")
        }
    }
   
        networkService.getMovies(.spanishFilms) { [weak self] movies, error in
            if let error = error {
                print("Error: \(#function) \(error.localizedDescription)")
                return
            }
            if !movies.isEmpty {
                self?.moviesInSectionsMDB.append(movies)
                
                print("SPANISH movies: \(movies.count)")
        }
    }
        
        networkService.getMovies(.actionFilms) { [weak self] movies, error in
            if let error = error {
                print("Error: \(#function) \(error.localizedDescription)")
                return
            }
            if !movies.isEmpty {
                self?.moviesInSectionsMDB.append(movies)
                
                print("ACTION movies: \(movies.count)")
        }
    }

      
    }
    
}
