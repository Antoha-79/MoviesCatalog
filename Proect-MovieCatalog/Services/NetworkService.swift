//
//  NetworkService.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 22.02.22.
//

import Foundation


final class NetworkService {
    
    private let imageBasePath = "https://image.tmdb.org/t/p/w500/"  // надо где-то добавить для полного пути
    
    private let host = "https://api.themoviedb.org/3/discover/movie?api_key=64bd7aebee16952871cba9199b823dd7&language=en-US&sort_by=popularity.asc&include_adult=false&include_video=false&with_watch_monetization_types=flatrate"
    
    func getMovies(completion: @escaping ([MovieMDB]?, Error?) -> Void) {
        guard let url = URL(string: host) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { responseData, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = responseData {
                
                do {
                    let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                    print("")
                    print("ПРОБА !!!")
                    print(movieResponse.results.first?.original_title ?? "НЕТ НАЗВАНИЯ ??-!!-??-!!")
                    completion(movieResponse.results, error)
                } catch {
                    completion(nil, error)
                    print("ВНИМАНИЕ netservice  error")
                }
    
                DispatchQueue.main.async {
            
                }
            }
        }.resume()
    }

    
    
}



