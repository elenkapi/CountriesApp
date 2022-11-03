//
//  NetworkService.swift
//  Elene_Kapanadze_21
//
//  Created by Ellen_Kapii on 11.08.22.
//

import UIKit

class NetworkService {
    static var shared = NetworkService()
    
    private var session = URLSession()
    
    init() {
        let urlSessionConfiguration = URLSessionConfiguration.default
        let urlSession = URLSession(configuration: urlSessionConfiguration)
        self.session = urlSession
    }
    
    func getCountries(comletion: @escaping ([Country])->(Void)) {
        
        let urlsString = "https://restcountries.com/v2/all"
        let url = URL(string: urlsString)!

        session.dataTask(with: URLRequest(url: url)) { data, response, error in
            print(Thread.current.isMainThread)
            let data = data
            let decoder = JSONDecoder()
            let object = try! decoder.decode([Country].self, from: data!)
            DispatchQueue.main.async {
                comletion(object)
            }
        }.resume()
    }
    
}
