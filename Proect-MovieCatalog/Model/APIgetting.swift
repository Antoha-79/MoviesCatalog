//
//  APIgetting.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 23.02.22.
//

import Foundation


// создаем структуру для раскодирования json и делаем ее Codable (ничего для этого не прописываем, т.к. все свойства фундаментальные

struct Post: Codable {
    
    var userId: Int
    var id: Int
    var title: String
    var body: String
    
}

struct Collection {
    var id: Int
    var name: String
    var overview: String?
}

enum TMDBGenres: Int, CaseIterable {
    case action = 28
    case adventure = 12
    case animation = 16
    case comedy = 35
    case crime = 80
    case documentary = 99
    case drama = 18
    case family = 10751
    case fantasy = 14
    case history = 36
    case horror = 27
    case music = 10402
    case mystery = 9648
    case romance = 10749
    case ScienceFiction = 878
    case TVMovie = 10770
    case thriller = 53
    case war = 10752
    case western = 37
    
    static var allStringCases: [Int] {
        return allCases.map {genre in
            return genre.rawValue
        }
}
}

struct TMDBMovie {  //: Codable  - надо сделать вроде как 
    
    enum CodingKeys: CodingKey { //я так понял тут те поля, что нам нужны
        case adult
        case genres
        case id
        case original_language
        case original_title
        case overview
        case poster_path
    }
    
var adult: Bool?
var backdrop_path: String?
var belongs_to_collection: Collection?
var budget: Int?
var genres: [TMDBGenres]
var homepage: String
var id: Int
var imdb_id : String
var original_language: String
var original_title: String
var overview: String
var popularity: Double
var poster_path: String
var production_companies: [Any]
  /*  "production_companies": [
    {"id":508,"logo_path":"/7PzJdsLGlR7oW4J0J5Xcd0pHGRg.png","name":"Regency Enterprises","origin_country":"US"},
    
    {"id":711,"logo_path":"/tEiIH5QesdheJmDAqQwvtN60727.png","name":"Fox 2000 Pictures","origin_country":"US"},
    {"id":20555,"logo_path":"/hD8yEGUBlHOcfHYbujp71vD8gZp.png","name":"Taurus Film","origin_country":"DE"},
    {"id":54051,"logo_path":null,"name":"Atman Entertainment","origin_country":""},{"id":54052,"logo_path":null,"name":"Knickerbocker Films","origin_country":"US"},
    {"id":4700,"logo_path":"/A32wmjrs9Psf4zw0uaixF0GXfxq.png","name":"The Linson Company","origin_country":"US"}]
   */
var production_countries: [Any]
 /* "production_countries": [
    {"iso_3166_1":"DE","name":"Germany"},
    {"iso_3166_1":"US","name":"United States of America"}]
  */
var release_date: String
var revenue: Int
var runtime: Int
var spoken_languages: [Any]
   // [{"english_name":"English","iso_639_1":"en","name":"English"}]
var status: String
var tagline: String
var title: String
var video: Bool
var vote_average: Double
var vote_count: Int
    
}



/*
 "adult":false,
 "backdrop_path":"/rr7E0NoGKxvbkb89eR1GwfoYjpA.jpg",
 "belongs_to_collection":null,
 "budget":63000000,
 "genres":[{"id":18,"name":"Drama"}],
 "homepage":"http://www.foxmovies.com/movies/fight-club",
 "id":550,
 "imdb_id":"tt0137523",
 "original_language":"en",
 "original_title":"Fight Club",
 "overview":"A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.",
 "popularity":57.013,
 "poster_path":"/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg",
 "production_companies":[{"id":508,"logo_path":"/7PzJdsLGlR7oW4J0J5Xcd0pHGRg.png","name":"Regency Enterprises","origin_country":"US"},{"id":711,"logo_path":"/tEiIH5QesdheJmDAqQwvtN60727.png","name":"Fox 2000 Pictures","origin_country":"US"},{"id":20555,"logo_path":"/hD8yEGUBlHOcfHYbujp71vD8gZp.png","name":"Taurus Film","origin_country":"DE"},{"id":54051,"logo_path":null,"name":"Atman Entertainment","origin_country":""},{"id":54052,"logo_path":null,"name":"Knickerbocker Films","origin_country":"US"},{"id":4700,"logo_path":"/A32wmjrs9Psf4zw0uaixF0GXfxq.png","name":"The Linson Company","origin_country":"US"}],
 "production_countries":[{"iso_3166_1":"DE","name":"Germany"},{"iso_3166_1":"US","name":"United States of America"}],
 "release_date":"1999-10-15",
 "revenue":100853753,
 "runtime":139,
 "spoken_languages":[{"english_name":"English","iso_639_1":"en","name":"English"}],
 "status":"Released",
 "tagline":"Mischief. Mayhem. Soap.",
 "title":"Fight Club",
 "video":false,
 "vote_average":8.4,
 "vote_count":23533
 */

