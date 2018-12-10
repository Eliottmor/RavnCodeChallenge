//
//  GitHubService.swift
//  RavnApp
//
//  Created by Eliott Moreno on 12/5/18.
//  Copyright © 2018 Eliott Moreno. All rights reserved.
//

import Foundation
import Apollo

protocol GitHubServiceDelegate: class {
    func updateGitHubViewModel(with logins:[GitHubUserViewModel])
}

protocol RepositoryDelegate: class {
    func updateRepositoryTableView(with repositories:[RepositoryDetails])
}

struct GitHubUserViewModel {
    let name:String?
    let location:String?
    let loginName:String?
    let url:URL?
}

class GitHubService {
    //endPoint: https://api.github.com/graphql
    //token:
    
    weak var gitHubDelegate: GitHubServiceDelegate?
    weak var repositoryDelegate: RepositoryDelegate?
    
    let apollo: ApolloClient = {
        let configuration = URLSessionConfiguration.default
        
        configuration.httpAdditionalHeaders = ["Authorization": "Bearer  <token>"] //Replace <token>
        
        let url = URL(string: "https://api.github.com/graphql")!
        return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
    }()
    
    func getLoginUserNames(name:String) {
        var logins: [String] = []
        let getLoginUsernames = GetLoginNameQuery(name: name)
        apollo.fetch(query: getLoginUsernames) { result , error in
            result?.data?.search.edges?.forEach {
                guard let login = $0?.textMatches?.filter({ $0?.property == "login"}).first??.fragment else { return }
                logins.append(login)
            }
            self.getUserInformation(names: logins)
        }
    }
    
    func getUserInformation(names:[String]) {
        var users:[GitHubUserViewModel] = []
        
        let myGroup = DispatchGroup()
        for i in 0 ..< names.count {
            myGroup.enter()
            
            let getUserInformation = GitHubUsersQuery(login_name: names[i])
            apollo.fetch(query: getUserInformation) { result, error in
                let name = result?.data?.user?.name
                let location = result?.data?.user?.location
                let login = result?.data?.user?.login
                let profileString = result?.data?.user?.avatarUrl
                let profileURL = URL(string: profileString ?? "")
                let user = GitHubUserViewModel(name: name, location: location, loginName: login, url: profileURL)
                users.append(user)
                myGroup.leave()
        }
        
            myGroup.notify(queue: .main) {
                self.gitHubDelegate?.updateGitHubViewModel(with: users)
            }
        }
    }
    
    func getRepositoryInformation(with loginName: String) {
        var repositoriesData = [RepositoryDetails]()
        let getRepositories = GetRepositoriesQuery(login_name: loginName)
        apollo.fetch(query: getRepositories) { result, error in
            guard let repositories = result?.data?.user?.repositories.nodes else { return }
            repositoriesData = repositories.compactMap {$0?.fragments.repositoryDetails}
            self.repositoryDelegate?.updateRepositoryTableView(with: repositoriesData)
        }
    }

}
