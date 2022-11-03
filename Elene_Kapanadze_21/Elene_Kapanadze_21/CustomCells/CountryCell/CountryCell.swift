//
//  CountryCell.swift
//  Elene_Kapanadze_21
//
//  Created by Ellen_Kapii on 11.08.22.
//

import UIKit

class CountryCell: UITableViewCell {

    
    @IBOutlet weak var countryCellView: UIView!
    
    @IBOutlet weak var countryName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        designCell()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - private functions
       
       private func designCell() {
           
           
           countryCellView.backgroundColor = .systemGray6
           countryCellView.layer.borderWidth = 4
           countryCellView.layer.borderColor = UIColor.lightGray.cgColor
           countryCellView.layer.cornerRadius = countryCellView.frame.height / 6
           
           countryName.textColor = .black
           
          
           
       }
    
}
