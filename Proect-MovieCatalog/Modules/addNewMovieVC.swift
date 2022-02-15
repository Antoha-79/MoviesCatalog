//
//  addNewMovieVC.swift
//  Proect-MovieCatalog
//
//  Created by Anton Dovnar on 31.01.22.
//

import UIKit

class addNewMovieVC: UIViewController { // ЭТО "АДМИНКА" - пока не используется и пуста !!!

    
    @IBOutlet weak var nameEngField: UITextField!
    @IBOutlet weak var nameRusField: UITextField!
    @IBOutlet weak var genreField: UITextField!
    @IBOutlet weak var genre2Field: UITextField!
    @IBOutlet weak var genre3Field: UITextField!
    @IBOutlet weak var genre4Field: UITextField!
    @IBOutlet weak var descriptionField: UITextView!

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var dateOfPremiereField: UITextField!
    
    @IBAction func addImage(_ sender: UIButton) {
    }
    
    
    @IBAction func isTop(_ sender: UISegmentedControl) {
    }
    
    @IBAction func isSerial(_ sender: UISegmentedControl) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


    
}
