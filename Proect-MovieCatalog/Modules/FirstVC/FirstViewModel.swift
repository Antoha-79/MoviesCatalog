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
    
    
    var moviesInSectionsMDB: [[MovieMDB]] = [] 
    var moviesDidLoad: (() -> Void)?
    
    private lazy var networkService = NetworkService()
    
    func getMovies() {

            let groupLoading = DispatchGroup()
            
        //входим в группу перед началом загрузки данных
        groupLoading.enter()
        self.networkService.getMovies(.top) { [weak self] movies, error in
            //выходим из группы после окончания загрузки
            groupLoading.leave()
                if let error = error {
                    print("Error: \(#function) \(error.localizedDescription)")
                    return
                }
                if !movies.isEmpty {
                    self?.moviesInSectionsMDB.append(movies)
                    
                    print("TOP movies count: \(movies.count)")
                    print("movies count: \(self?.moviesInSectionsMDB.count)")
                    print("TOP movies: \(self?.moviesInSectionsMDB.first?.count)")
                    print("TOP movies: \(movies.first?.title)")
            }
                 
        }
    
        groupLoading.enter()
        self.networkService.getMovies(.newFilms) { [weak self] movies, error in
            groupLoading.leave()
                if let error = error {
                    print("Error: \(#function) \(error.localizedDescription)")
                    return
                }
                if !movies.isEmpty {
                    self?.moviesInSectionsMDB.append(movies)
                    
                    print("NEW movies count: \(movies.count)")
                    print("movies count: \(self?.moviesInSectionsMDB.count)")
                   // print("TOP movies: \(self?.moviesInSectionsMDB.first)")
                    print("NEW movies: \(movies.first?.title)")
            }
                
        }
       
        groupLoading.enter()
        self.networkService.getMovies(.spanishFilms) { [weak self] movies, error in
            groupLoading.leave()
                if let error = error {
                    print("Error: \(#function) \(error.localizedDescription)")
                    return
                }
                if !movies.isEmpty {
                    self?.moviesInSectionsMDB.append(movies)
                    
                    print("SPANISH movies: \(movies.count)")
            }
                 
        }

        groupLoading.enter()
        self.networkService.getMovies(.actionFilms) { [weak self] movies, error in
            groupLoading.leave()
                if let error = error {
                    print("Error: \(#function) \(error.localizedDescription)")
                    return
                }
                if !movies.isEmpty {
                    self?.moviesInSectionsMDB.append(movies)
                    
                    print("ACTION movies: \(movies.count)")
                    print("movies count: \(self?.moviesInSectionsMDB.count)")
            }
              
        }
    
        //вызывается когда кол-во входов и выходов уровнялось, т.е. когда все загрузки закончатся
        groupLoading.notify(queue: .main) { [weak self] in
            self?.moviesDidLoad?()
        }
        }
    
}
