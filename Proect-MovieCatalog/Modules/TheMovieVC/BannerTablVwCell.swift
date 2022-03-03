//
//  BannerTablVwCell.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 1.03.22.
//

import UIKit

class BannerTablVwCell: UITableViewCell {
    
    @IBOutlet weak var bannerImage: UIImageView!

    //var moviePoster: UIImage!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
       // bannerImage.image = moviePoster
        bannerImage.image
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
