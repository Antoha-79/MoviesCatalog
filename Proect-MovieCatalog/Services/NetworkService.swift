//
//  NetworkService.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 22.02.22.
//

import Foundation


final class NetworkService {
    
    private let imageBaseHost = "https://image.tmdb.org/t/p/w500/"  // в json приходит не полный путь
    
    private let baseDiscoverHost = "https://api.themoviedb.org/3/discover/movie?"
    private let apiKey = "api_key=64bd7aebee16952871cba9199b823dd7"
    
     enum Routes: String {
        case top = "&primary_release_date.gte=1985-01-01&sort_by=vote_average.desc&&vote_count.gte=20000"
        case newFilms = "&primary_release_date.gte=2022-02-15&primary_release_date.lte=2022-03-01&sort_by=popularity.desc"
        case spanishFilms = "&language=es-ES"
        case actionFilms = "&with_genres=28"
    }
    
  
     func getMovies(_ routes: Routes, completion: @escaping ([MovieMDB], Error?) -> Void) {
        guard let url = URL(string: baseDiscoverHost + apiKey + routes.rawValue) else {
            completion([], nil)
            return
        }
        var request = URLRequest(url: url, timeoutInterval: 30.0)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { responseData, response, error in
            if let error = error {
                completion([], error)
            } else if let data = responseData {
                
                    let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data)

                    var moviesWithPoster = [MovieMDB]()
                    movieResponse?.results.forEach { movie in
                        var newMovie = movie
                        newMovie.poster_path = "\(self.imageBaseHost)\(movie.poster_path ?? "")"
                        moviesWithPoster.append(newMovie)
                    }
                
               // print("ПРОВЕРКА moviesWithPoster: \(moviesWithPoster.count)")
                
                    completion(moviesWithPoster, error)
                } else {
                    completion([], nil)
                }
                DispatchQueue.main.async {  //  может это нужно в начале прописать?
                }
        }.resume()
    }

/*
    // ПРОВЕРКА
    func getMoviesTest(completion: @escaping ([MovieMDB], Error?) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=64bd7aebee16952871cba9199b823dd7&primary_release_date.gte=1985-01-01&sort_by=vote_average.desc&&vote_count.gte=20000") else {
           completion([], nil)
           return
       }
        
        print("Тест URL 1: 01010101010101")
        
       var request = URLRequest(url: url, timeoutInterval: 30.0)
       request.httpMethod = "GET"
        
        print("Тест URL 2: \(url)")
       
       URLSession.shared.dataTask(with: request) { responseData, response, error in
           if let error = error {
               completion([], error)
               
           } else if let data = responseData {
               
               print(5555555)
               
                   let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data)

                   var moviesWithPoster = [MovieMDB]()
                   movieResponse?.results.forEach { movie in
                       var newMovie = movie
                       newMovie.poster_path = "\(self.imageBaseHost)\(movie.poster_path ?? "")"
                       moviesWithPoster.append(newMovie)
                   }
               print("ПРОВЕРКА moviesWithPoster: \(moviesWithPoster.count)")
                   completion(moviesWithPoster, nil)
                
           } else {
                   print(0001110001)
                   completion([], nil)
               }
       }.resume()
   }
           */
}



