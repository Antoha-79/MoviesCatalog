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
    //case serials = "Сериалы"
    case spanish = "На испанском языке"
    case action = "Боевики"
    case genres = "Жанры"
    
    static var allStringCases: [String] {
        return allCases.map {section in
            return section.rawValue
        }
    }
    
    var quantity: Int {   // вроде нигде пока не использовал это ((
        switch self {
        case .appName: return 1
        case .menu: return    mainMenu.count
        case .banner: return  1
        case .top: return     topFilms.count
        case .new: return     newFilms.count
        //case .serials: return serialsFilms.count
        case .spanish: return spanishFilms.count
        case .action: return  actionFilms.count
        case .genres: return  moviesInCatalog.count // все фильмы
        }
    }
    
    
}

enum Genres: String, CaseIterable {
    case action = "Боевики"
    case drama = "Драмы"
    case comedy = "Комедии"
    case thriller = "Триллеры"
    case fiction = "Фантастика"
    case melodrama = "Мелодрамы"
    case horror = "Ужасы"
    case documentary = "Документальные"
    case adventure = "Приключения"
    case musical = "Мюзиклы"
    case animation = "Мультфильмы"
    case family = "Семейные"
    case fantasy = "Фэнтези"
    
    
    static var allStringCases: [String] {
        return allCases.map {genre in
            return genre.rawValue
        }
    }
    
    var picture: UIImage? {
        switch self {
        case .action:   return UIImage(named: "action")
        case .drama:    return UIImage(named: "drama")
        case .comedy:   return UIImage(named: "comedy")
        case .thriller: return UIImage(named: "comedy") // нет
        case .fiction:  return UIImage(named: "fiction")
        case .melodrama: return UIImage(named: "comedy") // нет
        case .horror:   return UIImage(named: "horror")
        case .documentary: return UIImage(named: "comedy") // нет
        case .adventure: return UIImage(named: "adventure")
        case .musical:  return UIImage(named: "musical")
        case .animation: return UIImage(named: "animation")
        case .family:   return UIImage(named: "comedy") // нет
        case .fantasy:  return UIImage(named: "comedy") // нет
        }
    }
    
    
}

struct Movie {
    var nameEng: String
    var nameRus: String
    var genre: [Genres]
    var description: String
    var image: UIImage?
   
    // SectionsOfMain
    var top: Bool
    var dateOfPremiere: Date
    var new: Bool  {
        if (Date().timeIntervalSince1970 - dateOfPremiere.timeIntervalSince1970) < 45*24*60*60 {
        }
        return true
    }
    //var serials: Bool
    var spanish: Bool
    
}

var moviesInCatalog: [Movie] = [
    Movie(nameEng: "Dune: Part One", nameRus: "Дюна", genre: [.fiction, .adventure, .drama, .action], description: "Атрейдесы прибывают на планету, где им никто не рад. Тимоти Шаламе в фантастическом эпосе Дени Вильнёва", image: UIImage(named: "film-Duna-1"), top: true, dateOfPremiere: Date(), spanish: false),
    Movie(nameEng: "Raya and the Last Dragon", nameRus: "Райя и последний дракон", genre: [.adventure, .drama, .animation, .fantasy, .comedy, .family], description: "Дочь вождя ищет магическое существо в надежде спасти мир. Новая работа режиссера «Города героев» для Disney", image: UIImage(named: "film_Raja-1"), top: true, dateOfPremiere: Date(), spanish: false),
    Movie(nameEng: "Free Guy", nameRus: "Главный герой", genre: [.comedy, .fiction, .action, .melodrama], description: "Банковский клерк обнаруживает, что он персонаж видеоигры. Фантастическая экшен-комедия с Райаном Рейнольдсом", image: UIImage(named: "film-FreeGue-1"), top: true, dateOfPremiere: Date(), spanish: false),
    Movie(nameEng: "The Rookie", nameRus: "Новичок", genre: [.fiction, .adventure, .drama, .action], description: "Начинать с чистого листа нелегко, особенно в полиции Лос-Анджелеса - новичка встречают не очень", image: UIImage(named: "film_Rookie-1"), top: false, dateOfPremiere: Date(), spanish: true),
    Movie(nameEng: "Dune: Part One", nameRus: "БББ", genre: [.fiction, .adventure, .drama, .action], description: "Атрейдесы прибывают на планету, где им никто не рад. Тимоти Шаламе в фантастическом эпосе Дени Вильнёва", image: UIImage(named: "action"), top: false, dateOfPremiere: Date(), spanish: true),
    Movie(nameEng: "Dune: Part One", nameRus: "УЖЖас", genre: [.fiction, .adventure, .drama, .action], description: "Атрейдесы прибывают на планету, где им никто не рад. Тимоти Шаламе в фантастическом эпосе Дени Вильнёва", image: UIImage(named: "horror"), top: false, dateOfPremiere: Date(), spanish: false),
    Movie(nameEng: "Dune: Part One", nameRus: "ХаХа", genre: [.fiction, .adventure, .drama, .action], description: "Атрейдесы прибывают на планету, где им никто не рад. Тимоти Шаламе в фантастическом эпосе Дени Вильнёва", image: UIImage(named: "comedy"), top: true, dateOfPremiere: Date(), spanish: false)
]


var moviesInSections = [[Movie]]()  //заполнился массив в FirstVC  в viewDidLoad (нужно внутри функции заполнять массив)
    
var topFilms = moviesInCatalog.filter{$0.top == true}
var newFilms = moviesInCatalog.filter{$0.new == true}
//var serialsFilms = moviesInCatalog.filter{$0.serials == true}
var actionFilms = moviesInCatalog.filter{$0.genre.contains(.action)} //test - ".action"
var spanishFilms = moviesInCatalog.filter{$0.spanish == true}


func filmsByGenre(genre: Genres) -> [Movie] {
    return moviesInCatalog.filter{$0.genre.contains(genre)}
    }

        

                        
                        
                        
                     

