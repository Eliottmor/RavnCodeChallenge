//
//  GitHubService.swift
//  RavnApp
//
//  Created by Eliott Moreno on 12/5/18.
//  Copyright © 2018 Eliott Moreno. All rights reserved.
//

import Foundation
import Apollo

class GitHubService {
    //endPoint: https://api.github.com/graphql
    //token: 559c2f3900adc21f55e3972f39ff0d6530f97e11
    
    let apollo: ApolloClient = {
        let configuration = URLSessionConfiguration.default
        
        configuration.httpAdditionalHeaders = ["Authorization": "Bearer 559c2f3900adc21f55e3972f39ff0d6530f97e11"] //Replace <token>
        
        let url = URL(string: "https://api.github.com/graphql")!
        return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
    }()
}
