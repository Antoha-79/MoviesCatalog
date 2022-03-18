//
//  ImageCacheService.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 18.03.22.
//

import UIKit

final class ImageCacheService {
    
    static let shared = ImageCacheService()
    
    private let cache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 200 * 1024 * 1024
        return cache
    }()
    
    func save(movieId: String, image: UIImage?) {
        guard let image = image else { return }
        cache.setObject(image, forKey: movieId as NSString)
    }
    
    func load(movieId: String) -> UIImage? {
        return cache.object(forKey: movieId as NSString)
    }
}
