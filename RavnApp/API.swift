//  This file was automatically generated and should not be edited.

import Apollo

public final class GitHubUsersQuery: GraphQLQuery {
  public let operationDefinition =
    "query GitHubUsers($login_name: String!) {\n  user(login: $login_name) {\n    __typename\n    name\n    location\n    login\n    avatarUrl\n  }\n}"

  public var login_name: String

  public init(login_name: String) {
    self.login_name = login_name
  }

  public var variables: GraphQLMap? {
    return ["login_name": login_name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("user", arguments: ["login": GraphQLVariable("login_name")], type: .object(User.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(user: User? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
    }

    /// Lookup a user by login.
    public var user: User? {
      get {
        return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "user")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("location", type: .scalar(String.self)),
        GraphQLField("login", type: .nonNull(.scalar(String.self))),
        GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String? = nil, location: String? = nil, login: String, avatarUrl: String) {
        self.init(unsafeResultMap: ["__typename": "User", "name": name, "location": location, "login": login, "avatarUrl": avatarUrl])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The user's public profile name.
      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      /// The user's public profile location.
      public var location: String? {
        get {
          return resultMap["location"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "location")
        }
      }

      /// The username used to login.
      public var login: String {
        get {
          return resultMap["login"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "login")
        }
      }

      /// A URL pointing to the user's public avatar.
      public var avatarUrl: String {
        get {
          return resultMap["avatarUrl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "avatarUrl")
        }
      }
    }
  }
}

public final class GetLoginNameQuery: GraphQLQuery {
  public let operationDefinition =
    "query getLoginName($name: String!) {\n  search(type: USER, query: $name, first: 15) {\n    __typename\n    edges {\n      __typename\n      textMatches {\n        __typename\n        fragment\n        property\n      }\n    }\n  }\n}"

  public var name: String

  public init(name: String) {
    self.name = name
  }

  public var variables: GraphQLMap? {
    return ["name": name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("search", arguments: ["type": "USER", "query": GraphQLVariable("name"), "first": 15], type: .nonNull(.object(Search.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(search: Search) {
      self.init(unsafeResultMap: ["__typename": "Query", "search": search.resultMap])
    }

    /// Perform a search across resources.
    public var search: Search {
      get {
        return Search(unsafeResultMap: resultMap["search"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "search")
      }
    }

    public struct Search: GraphQLSelectionSet {
      public static let possibleTypes = ["SearchResultItemConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .list(.object(Edge.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "SearchResultItemConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of edges.
      public var edges: [Edge?]? {
        get {
          return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes = ["SearchResultItemEdge"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("textMatches", type: .list(.object(TextMatch.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(textMatches: [TextMatch?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "SearchResultItemEdge", "textMatches": textMatches.flatMap { (value: [TextMatch?]) -> [ResultMap?] in value.map { (value: TextMatch?) -> ResultMap? in value.flatMap { (value: TextMatch) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Text matches on the result found.
        public var textMatches: [TextMatch?]? {
          get {
            return (resultMap["textMatches"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [TextMatch?] in value.map { (value: ResultMap?) -> TextMatch? in value.flatMap { (value: ResultMap) -> TextMatch in TextMatch(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [TextMatch?]) -> [ResultMap?] in value.map { (value: TextMatch?) -> ResultMap? in value.flatMap { (value: TextMatch) -> ResultMap in value.resultMap } } }, forKey: "textMatches")
          }
        }

        public struct TextMatch: GraphQLSelectionSet {
          public static let possibleTypes = ["TextMatch"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("fragment", type: .nonNull(.scalar(String.self))),
            GraphQLField("property", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(fragment: String, property: String) {
            self.init(unsafeResultMap: ["__typename": "TextMatch", "fragment": fragment, "property": property])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The specific text fragment within the property matched on.
          public var fragment: String {
            get {
              return resultMap["fragment"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "fragment")
            }
          }

          /// The property matched on.
          public var property: String {
            get {
              return resultMap["property"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "property")
            }
          }
        }
      }
    }
  }
}