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
        bannerImage.load(imageURLStr: movie.poster_path) { image in
            self.imageView?.image = image
        }
}
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
