//
//  APIgetting.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 23.02.22.
//

import Foundation


struct Collection {  // пока нигде не использую
    var id: Int
    var name: String
    var overview: String?
}  

enum GenresMDB: Int, CaseIterable {
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

struct GenreString {
    
    var genreName: [Int:String] = [28: "Боевик", 12: "Приключения", 16: "Мультфильм", 35: "Комедия", 80: "Криминал", 99: "Документальный", 18: "Драма", 10751: "Семейный", 14: "Фэнтези", 36: "Исторический", 27: "Ужасы", 10402: "Мюзикл", 9648: "Мистика", 10749: "Романтический", 878: "Научная Фантастика", 10770: "TV-фильм", 53: "Трилер", 10752: "Военный", 37: "Вестерн"]
}


struct MovieResponse: Decodable {
    //var page: Int
    var results: [MovieMDB]
    //var total_pages: Int
    //var total_results: Int
    
    enum CodingKeys: String, CodingKey {
        //case page
        case results
       // case total_pages
       // case total_results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
       // self.page = try container.decode(Int.self, forKey: .page)
        self.results = try container.decode([MovieMDB].self, forKey: .results)
        //self.total_pages = try container.decode(Int.self, forKey: .total_pages)
        //self.total_results = try container.decode(Int.self, forKey: .total_results)
        }
        
    }

 
struct MovieMDB: Decodable {
    
    var adult: Bool?
    var backdrop_path: String?
    var genre_ids: [Int]?
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




var moviesInSectionsMDB = [[MovieMDB]]()  //заполнился массив в FirstVC  в viewDidLoad (нужно внутри функции заполнять массив)

/*
var topFilmsMDB: [MovieMDB] = []
var newFilmsMDB: [MovieMDB] = []
var spanishFilmsMDB: [MovieMDB] = []
var actionFilmsMDB: [MovieMDB] = []
*/

