//
//  DownloadPoster.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 9.03.22.
//

import UIKit

final class DownloadPoster: UIImageView {
    
    private var downloadTask: DispatchWorkItem?
    
    
    func load(imageURLStr: String?, complition: @escaping (UIImage) -> Void) {
        guard let imageURLStr = imageURLStr else { return }
        
       let downloadTask = DispatchWorkItem(qos: .userInitiated, block: {
           if let imageURL = URL(string:  imageURLStr),
              let imageData = try? Data(contentsOf: imageURL),
               let image = UIImage(data: imageData) {
                DispatchQueue.main.async { [weak self] in
                    self?.image = image
                    complition(image)
                }
            }
        })
        DispatchQueue.global(qos: .userInitiated).async(execute: downloadTask)
        self.downloadTask = downloadTask
    }

    
    func cancel() { // отменяет загрузку если ...
        downloadTask?.cancel()
        downloadTask = nil
    }
    
}
    
