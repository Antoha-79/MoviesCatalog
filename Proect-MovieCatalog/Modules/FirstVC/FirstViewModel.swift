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
            }
              
        }
    
        //вызывается когда кол-во входов и выходов уровнялось, т.е. когда все загрузки закончатся
        groupLoading.notify(queue: .main) { [weak self] in
            self?.moviesDidLoad?()
        }
        }
    
}
