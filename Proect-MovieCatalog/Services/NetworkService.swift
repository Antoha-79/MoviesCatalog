//
//  NetworkService.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 22.02.22.
//

import Foundation


final class NetworkService {
    
    private let host = "http://api.themoviedb.org/3/genre/movie/list?api_key=64bd7aebee16952871cba9199b823dd7&language=en-US"
    
    func getAllPosts(completion: @escaping ([Post]) -> Void) {
        guard let url = URL(string: host + "") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { responseData, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = responseData {
                let posts = try? JSONDecoder().decode([Post].self, from: data)
                DispatchQueue.main.async { // тут возвращаемся в главный поток
                    completion(posts ?? [])
                }
            }
        }.resume()
    }

    
    
}
