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
    var searchController:UISearchController?
    var github:GitHubService?
    var userInformation = [GitHubUserViewModel]()
    var loginName:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupSearchBar()
        
        github = GitHubService()
        github?.gitHubDelegate = self
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        
    }

    func setupSearchBar() {
        searchController = UISearchController(searchResultsController: nil)
        searchController?.searchBar.placeholder = "Search GitHub Users"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController?.searchResultsUpdater = self
        searchController?.obscuresBackgroundDuringPresentation = false
        searchController?.definesPresentationContext = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "repositorySegue") {
            let viewController = segue.destination as? RepositoriesTableViewController
            viewController?.loginName = loginName
        }
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
        if let url = user.url {
            cell.userImageView?.downloaded(from: url, contentMode: .scaleAspectFit)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        loginName = userInformation[indexPath.row].loginName
        searchController?.isActive = false
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "repositoryTableView") as! RepositoriesTableViewController
        viewController.loginName = loginName
        
        viewController.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }
    
    
}

extension ViewController: GitHubServiceDelegate {
    func updateGitHubViewModel(with logins:[GitHubUserViewModel]) {
        userInformation = logins
        tableView.reloadData()
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        github?.getLoginUserNames(name: searchController.searchBar.text!)
    }
}
