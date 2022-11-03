//
//  FirstPageViewController.swift
//  Elene_Kapanadze_21
//
//  Created by Ellen_Kapii on 11.08.22.
//

import UIKit

class FirstPageViewController: UIViewController {
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        view.addSubview(searchBar)
        return searchBar
        
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        view.addSubview(tableView)
        return tableView
    }()
    
    var countries = [Country]()
    var filteredCountries = [Country]()
    var networService = NetworkService.shared
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredCountries = countries
        
        setUp()
        setUpSearchBar()
        setUpTableView()
        
        networService.getCountries { countries in
            self.filteredCountries = countries
            self.tableView.reloadData()
        }
        
    }
    
    
    //MARK: - Configuration Private Functions
    
    private func setUp() {
        addSearchBar()
        addTableView()
    }
    
    
    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CountryCell", bundle: nil), forCellReuseIdentifier: "CountryCell")
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        
    }
    
    private func setUpSearchBar() {
        
        searchBar.delegate = self
        
    }
    
    
    //MARK: - Adding constraints to views
    
    private func addSearchBar() {
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        
        let topConstraint = NSLayoutConstraint(item: searchBar,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: view.safeAreaLayoutGuide,
                                               attribute: .top,
                                               multiplier: 1,
                                               constant: 10)
        
        let leftConstraint = NSLayoutConstraint(item: searchBar,
                                                attribute: .left,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: .left,
                                                multiplier: 1,
                                                constant: 0)
        
        let rightConstraint = NSLayoutConstraint(item: searchBar,
                                                 attribute: .right,
                                                 relatedBy: .equal,
                                                 toItem: view,
                                                 attribute: .right,
                                                 multiplier: 1,
                                                 constant: -0)
        
        
        
        NSLayoutConstraint.activate([topConstraint, rightConstraint, leftConstraint])
    }
    
    
    private func addTableView() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let topConstraint = NSLayoutConstraint(item: tableView,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: searchBar,
                                               attribute: .bottom,
                                               multiplier: 1,
                                               constant: 30)
        
        let leftConstraint = NSLayoutConstraint(item: tableView,
                                                attribute: .left,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: .left,
                                                multiplier: 1,
                                                constant: 0)
        
        let rightConstraint = NSLayoutConstraint(item: tableView,
                                                 attribute: .right,
                                                 relatedBy: .equal,
                                                 toItem: view,
                                                 attribute: .right,
                                                 multiplier: 1,
                                                 constant: -0)
        
        let bottomConstraint = NSLayoutConstraint(item: tableView,
                                                  attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: view,
                                                  attribute: .bottom,
                                                  multiplier: 1,
                                                  constant: -30)
        
        
        NSLayoutConstraint.activate([topConstraint, rightConstraint, bottomConstraint, leftConstraint])
    }
    
    
}


//MARK: - Extensions

// for tableview
extension FirstPageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredCountries.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let currentCountry = filteredCountries[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryCell
        
        cell.countryName.text = currentCountry.name
        cell.backgroundColor = .clear
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let country = filteredCountries[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SecondPageViewController") as? SecondPageViewController
        
        guard let vc = vc else { return }
        
        DispatchQueue.main.async {
            let url = country.flags["png"]
            vc.countryFlag.load(url: URL(string: url!)!)
            vc.countryName.text = "Country: \(country.name)"
            guard let capital = country.capital else {
                vc.countryCapital.textColor = .systemRed
                vc.countryCapital.text = "Capital: Doesn't Have Any"
                return }
            vc.countryCapital.text = "Capital: \(capital)"
        }
        
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
        
        
    }
    
}

// for search bar

extension FirstPageViewController: UISearchBarDelegate {
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredCountries = []
        
        if searchText.isEmpty {
            self.filteredCountries = self.countries
        }
        
        filteredCountries = countries.filter({ $0.name.uppercased() == searchText.uppercased()
        })
        
        
//        for country in countries {
//
//            if country.name.uppercased().contains(searchText.uppercased()) {
//                filteredCountries.append(country)
//            }
//
//        }
        
        self.tableView.reloadData()
        
    }
    
}

