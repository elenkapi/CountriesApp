//
//  Country.swift
//  Elene_Kapanadze_21
//
//  Created by Ellen_Kapii on 11.08.22.
//

import UIKit

struct Country: Codable {
    
    let name: String
    let capital: String?
    let flags: [String: String]
    
    
}


extension UIImageView {
    
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
/*
"name":"Afghanistan","topLevelDomain":[".af"],"alpha2Code":"AF","alpha3Code":"AFG","callingCodes":["93"],"capital":"Kabul","altSpellings":["AF","Afġānistān"],"subregion":"Southern Asia","region":"Asia","population":40218234,"latlng":[33.0,65.0],"demonym":"Afghan","area":652230.0,"timezones":["UTC+04:30"],"borders":["IRN","PAK","TKM","UZB","TJK","CHN"],"nativeName":"افغانستان","numericCode":"004","flags":{"svg":"https://upload.wikimedia.org/wikipedia/commons/5/5c/Flag_of_the_Taliban.svg","png":"https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_the_Taliban.svg/320px-Flag_of_the_Taliban.svg.png"}
*/
