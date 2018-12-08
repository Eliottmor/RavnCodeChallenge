//
//  ViewController.swift
//  RavnApp
//
//  Created by Eliott Moreno on 12/5/18.
//  Copyright © 2018 Eliott Moreno. All rights reserved.
//

import UIKit
import Apollo

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupSearchBar()
    }

    func setupSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Search GitHub Users"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath) as? GitHubTableViewCell else { fatalError("could not load cell") }
        
        cell.nameLocationLabel.text = "testing"
        cell.loginLabel.text = "EliottMor"
        
        return cell
    }
    
    
}

