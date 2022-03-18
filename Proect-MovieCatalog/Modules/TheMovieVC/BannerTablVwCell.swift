//
//  BannerTablVwCell.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 1.03.22.
//

import UIKit

class BannerTablVwCell: UITableViewCell {
    
    @IBOutlet weak var bannerImage: DownloadPoster!

    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    func setup(movie: MovieMDB) {
        
        if let image = ImageCacheService.shared.load(movieId: String(movie.id)) {
            bannerImage.image = image
        } else {
            bannerImage.load(imageURLStr: movie.poster_path) { image in
                ImageCacheService.shared.save(movieId: String(movie.id), image: image)
            }
        }
}
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}
