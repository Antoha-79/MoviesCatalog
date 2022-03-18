//
//  FilmsByGenreModel.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 17.03.22.
//

import Foundation


protocol FilmsByGenreModelProtocol: AnyObject {
    
    
    var moviesByGenre: [MovieMDB] { get set }
    
    func getMovies(genre genreNum: GenresMDB.RawValue)
    
    var moviesDidLoad: (() -> Void)? { get set }
}

final class FilmsByGenreModel: FilmsByGenreModelProtocol {
   
    var moviesByGenre: [MovieMDB] = []
    var moviesDidLoad: (() -> Void)?
    
    private lazy var networkService = NetworkService()
    
    func getMovies(genre genreNum: GenresMDB.RawValue) {
  
        self.networkService.getMoviesByGenre(genreNum) { [weak self] movies, error in
                if let error = error {
                    print("Error: \(#function) \(error.localizedDescription)")
                    return
                }
                if !movies.isEmpty {
                    self?.moviesByGenre = movies
                    self?.moviesDidLoad?()
            }
                 
        }
    }
}
