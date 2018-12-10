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
    var github:GitHubService?
    var userInformation = [GitHubUserViewModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupSearchBar()
        
        github = GitHubService()
        github?.gitHubDelegate = self
       _ = github?.getLoginUserNames(name: "eliott")
        
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
        return userInformation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath) as? GitHubTableViewCell else { fatalError("could not load cell") }
        
        let user = userInformation[indexPath.row]
        
        cell.nameLocationLabel.text = "\(user.name ?? "No Name"), \(user.location ?? "No Location")"
        cell.loginLabel.text = user.loginName
        
        return cell
    }
    
    
}

extension ViewController: GitHubServiceDelegate {
    func updateGitHubViewModel(with logins:[GitHubUserViewModel]) {
        userInformation = logins
    }
}

