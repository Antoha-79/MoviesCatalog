//
//  APIgetting.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 23.02.22.
//

import Foundation


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

struct MovieResponse: Decodable {
    var page: Int
    var results: [MovieMDB]
    var total_pages: Int
    var total_results: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case total_pages
        case total_results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.page = try container.decode(Int.self, forKey: .page)
        self.results = try container.decode([MovieMDB].self, forKey: .results)
        self.total_pages = try container.decode(Int.self, forKey: .total_pages)
        self.total_results = try container.decode(Int.self, forKey: .total_results)
        }
        
    }

 // Вариант по JSON №1
 
struct MovieMDB: Decodable {
    
    var adult: Bool?
    var backdrop_path: String?
    var genre_ids: [Int]
    var id: Int
    var original_language: String
    var original_title: String
    var overview: String
    var popularity: Double
    var poster_path: String?
    var release_date: String
    var title: String
    var video: Bool
    var vote_average: Double
    var vote_count: Int
    
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdrop_path
        case genre_ids
        case id
        case language = "original_language"
        case titleOriginal = "original_title"
        case description = "overview"
        case popularity
        case poster = "poster_path"
        case release_date
        case title = "title"
        case video
        case imdbRating = "vote_average"
        case imdbCount = "vote_count"
    }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.adult = try? container.decode(Bool.self, forKey: .adult)
            self.backdrop_path = try? container.decode(String.self, forKey: .backdrop_path)
            self.genre_ids = try container.decode([Int].self, forKey: .genre_ids)
            self.id = try container.decode(Int.self, forKey: .id)
            self.original_language = try container.decode(String.self, forKey: .language)
            self.original_title = try container.decode(String.self, forKey: .titleOriginal)
            self.overview = try container.decode(String.self, forKey: .description)
            self.popularity = try container.decode(Double.self, forKey: .popularity)
            self.poster_path = try? container.decode(String.self, forKey: .poster)
            self.release_date = try container.decode(String.self, forKey: .release_date)
            self.title = try container.decode(String.self, forKey: .title)
            self.video = try container.decode(Bool.self, forKey: .video)
            self.vote_average = try container.decode(Double.self, forKey: .imdbRating)
            self.vote_count = try container.decode(Int.self, forKey: .imdbCount)
            
        }
}
/* // Вариант по JSON №2
 
struct MovieMDB: Decodable {
    
    var adult: Bool?
    //var genres: [TMDBGenres]
    var id: Int
    var original_language: String
    var original_title: String
    var overview: String
    var poster_path: String
    //var release_date: String
    var title: String
    var video: Bool
    var vote_average: Double
    var vote_count: Int
    
    
    enum CodingKeys: String, CodingKey {
        case adult
        //case genres
        case id
        case original_language //= "language"
        case original_title //= "title"
        case overview //= "description"
        case poster_path //= "poster"
        //case release_date
        case title //= "title ??"
        case video
        case vote_average //= "imdb Rating"
        case vote_count //= "imdb Count"
        
    }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            //self.genres = []
           // self.release_date = ""
            self.adult = try? container.decode(Bool.self, forKey: .adult)
            self.id = try container.decode(Int.self, forKey: .id)
            self.original_language = try container.decode(String.self, forKey: .original_language)
            self.original_title = try container.decode(String.self, forKey: .original_title)
            self.overview = try container.decode(String.self, forKey: .overview)
            self.poster_path = try container.decode(String.self, forKey: .poster_path)
            self.title = try container.decode(String.self, forKey: .title)
            self.video = try container.decode(Bool.self, forKey: .video)
            self.vote_average = try container.decode(Double.self, forKey: .vote_average)
            self.vote_count = try container.decode(Int.self, forKey: .vote_count)
            
        }
}
    
*/

// не понтяно - разная структура JSON

//вот один вариант:
/*
"adult":false,
"backdrop_path":String,
"genre_ids":[TMDBGenres],
"id":945817,
"original_language":"pt",
"original_title":"The Godfather Coda: The Death of Michael Corleone",
"overview":"",
"popularity":0,
"poster_path":"/8ckAqoaTUsUzMX7LF8ToAS6sKO6.jpg",
"release_date":"",
"title":"The Godfather Coda: The Death of Michael Corleone",
"video":false,
"vote_average":0,
"vote_count":0}
*/

//вот другой вариант:
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


/*
// Полная Структура
 
 
struct MovieMDB: Decodable {
    
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
    
    
    enum CodingKeys: String, CodingKey { // тут те поля, что нам нужны
        //case genres
        case adult
        case id
        case original_language //= "language"
        case original_title //= "title"
        case overview //= "description"
        case poster_path //= "poster"
        case title //= "title ??"
        case video
        case vote_average //= "imdb Rating"
        case vote_count //= "imdb Count"
        
    }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
           self.backdrop_path = ""
           self.belongs_to_collection = nil
           self.budget = nil
           self.genres = []
           self.homepage = ""
           self.imdb_id = ""
           self.popularity = 0.0 // TEST
           self.production_companies = []
           self.production_countries = []
             /* "production_countries": [
                {"iso_3166_1":"DE","name":"Germany"},
                {"iso_3166_1":"US","name":"United States of America"}]
              */
           self.release_date = ""
           self.revenue = 0 // TEST
           self.runtime = 0 // TEST
           self.spoken_languages = []
               // [{"english_name":"English","iso_639_1":"en","name":"English"}]
           self.status = ""
           self.tagline = ""

            self.adult = try? container.decode(Bool.self, forKey: .adult)
            self.id = try container.decode(Int.self, forKey: .id)
            self.original_language = try container.decode(String.self, forKey: .original_language)
            self.original_title = try container.decode(String.self, forKey: .original_title)
            self.overview = try container.decode(String.self, forKey: .overview)
            self.poster_path = try container.decode(String.self, forKey: .poster_path)
            self.title = try container.decode(String.self, forKey: .title)
            self.video = try container.decode(Bool.self, forKey: .video)
            self.vote_average = try container.decode(Double.self, forKey: .vote_average)
            self.vote_count = try container.decode(Int.self, forKey: .vote_count)
            
        }
}

*/
