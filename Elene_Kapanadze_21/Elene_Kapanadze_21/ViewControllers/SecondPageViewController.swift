//
//  SecondPageViewController.swift
//  Elene_Kapanadze_21
//
//  Created by Ellen_Kapii on 11.08.22.
//

import UIKit

class SecondPageViewController: UIViewController {
    
    
    @IBOutlet weak var countryFlag: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var countryCapital: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
}

