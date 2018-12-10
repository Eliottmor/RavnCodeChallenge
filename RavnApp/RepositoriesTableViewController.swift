//
//  RepositoriesTableViewController.swift
//  RavnApp
//
//  Created by Eliott Moreno on 12/9/18.
//  Copyright © 2018 Eliott Moreno. All rights reserved.
//

import UIKit

class RepositoriesTableViewController: UITableViewController {
    
    var gitHubService:GitHubService?
    var loginName:String?
    var repositoriesData = [RepositoryDetails]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        gitHubService = GitHubService()
        gitHubService?.repositoryDelegate = self
        gitHubService?.getRepositoryInformation(with: loginName ?? "")
        
        setup()
    }
    
    func setup() {
        self.title = loginName
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return repositoriesData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for:indexPath) as? RepositoryTableViewCell else { fatalError("could not load cell") }
        
        let repository = repositoriesData[indexPath.row]
        
        cell.nameLabel.text = repository.name
        cell.descriptionLabel.text = repository.description
        cell.pullRequestCountLabel.text = "PR Count: \(repository.pullRequests.totalCount)"
        
        return cell
    }

}

extension RepositoriesTableViewController: RepositoryDelegate {
    func updateRepositoryTableView(with repositories:[RepositoryDetails]) {
        self.repositoriesData = repositories
        tableView.reloadData()
    }
}
