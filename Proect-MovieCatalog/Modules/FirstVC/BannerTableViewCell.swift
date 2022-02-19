//
//  BannerTableViewCell.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 19.02.22.
//

import UIKit

class BannerTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var bannerImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        bannerImage.image = UIImage(named: "top_poster")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
