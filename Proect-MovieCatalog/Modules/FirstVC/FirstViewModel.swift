//
//  FirstViewModel.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 8.03.22.
//

import Foundation

protocol FirstViewModelProtocol: AnyObject {
    
    var movies: [MovieMDB] { get }
    
    func getMovies()
    
    var moviesDidLoad: (() -> Void)? { get set }
}

final class FirstViewModel: FirstViewModelProtocol {
    
    var movies: [MovieMDB] = []
    var moviesDidLoad: (() -> Void)?
    
    private lazy var networkService = NetworkService()
    
    func getMovies() {
        networkService.getMovies(.top) { [weak self] movies, error in
            if let error = error {
                print("Error: \(#function) \(error.localizedDescription)")
                return
            }
            if !movies.isEmpty {
                self?.movies = movies
                
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
        }
        
        
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
        print("Точка FirstViewModel.getMovies: \(moviesInSectionsMDB)")   // TEST
    }
    
}
