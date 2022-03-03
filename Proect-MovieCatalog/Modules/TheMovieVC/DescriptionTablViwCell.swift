//
//  DescriptionTablViwCell.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 1.03.22.
//

import UIKit

class DescriptionTablViwCell: UITableViewCell {
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
   
        descriptionTextView.text
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
