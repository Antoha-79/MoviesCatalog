//
//  Profile.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 30.01.22.
//

import Foundation
import UIKit

let mainMenu = ["Каталог", "Магазин", "Покупки", "Загрузки"]

enum SectionsOfMain: String, CaseIterable {
    case appName = "MyMovie" // название приложения
    case menu = "mainMenu" // главное меню
    case banner = "banner" // статичный баннер-картинка
    case top = "ТОП"
    case new = "Новинки"
    case spanish = "На испанском языке"
    case action = "Боевики"
    case genres = "Жанры"
    
    static var allStringCases: [String] {
        return allCases.map {section in
            return section.rawValue
        }
    }
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
    var picture: UIImage? {
        switch self {
        case .action:   return UIImage(named: "action")
        case .adventure: return UIImage(named: "adventure")
        case .animation: return UIImage(named: "animation")
        case .comedy:   return UIImage(named: "comedy")
        case .crime:   return UIImage(named: "comedy") // нет
        case .documentary:   return UIImage(named: "comedy") // нет
        case .drama:    return UIImage(named: "drama")
        case .family:   return UIImage(named: "comedy") // нет
        case .fantasy:  return UIImage(named: "comedy") // нет
        case .history:   return UIImage(named: "horror") // нет
        case .horror:   return UIImage(named: "horror")
        case .music:  return UIImage(named: "musical")
        case .mystery:  return UIImage(named: "musical") // нет
        case .romance:  return UIImage(named: "fiction") // нет
        case .ScienceFiction:  return UIImage(named: "fiction")
        case .TVMovie: return UIImage(named: "comedy") // нет
        case .thriller: return UIImage(named: "comedy") // нет
        case .war: return UIImage(named: "animation") // нет
        case .western: return UIImage(named: "animation") // нет
        }
    }
    
}


struct GenreString {
    
    var genreName: [Int:String] = [28: "Боевик", 12: "Приключения", 16: "Мультфильм", 35: "Комедия", 80: "Криминал", 99: "Документальный", 18: "Драма", 10751: "Семейный", 14: "Фэнтези", 36: "Исторический", 27: "Ужасы", 10402: "Мюзикл", 9648: "Мистика", 10749: "Романтический", 878: "Научная Фантастика", 10770: "TV-фильм", 53: "Трилер", 10752: "Военный", 37: "Вестерн"]
}


struct MovieResponse: Decodable {
    var results: [MovieMDB]

    enum CodingKeys: String, CodingKey {
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.results = try container.decode([MovieMDB].self, forKey: .results)
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
