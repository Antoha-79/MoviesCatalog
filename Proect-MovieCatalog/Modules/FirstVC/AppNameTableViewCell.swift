//
//  AppNameTableViewCell.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 19.02.22.
//

import UIKit

class AppNameTableViewCell: UITableViewCell {

    @IBOutlet private weak var appNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        appNameLabel.text = "MyMovie"
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
