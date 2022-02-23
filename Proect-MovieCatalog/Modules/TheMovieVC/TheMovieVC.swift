//
//  TheMovieVC.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 21.02.22.
//

import UIKit

class TheMovieVC: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    var movie: Movie!

    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundImageView.image = movie.image
     
    }
    

 

}
