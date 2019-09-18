//
//  MarvelRoute.swift
//  Test
//
//  Created by Timur on 9/18/19.
//

import Moya

enum MarvelRoute {
    static private let privateKey = "bf66fd03b63fab9dbbdcceb3da3131559e4e784d"
    static private let publicKey = "de10bdf6878bb6a689a9ed3aff6a0307"

    case comics
}

extension MarvelRoute: TargetType {
    var baseURL: URL {
        return URL(string: "https://gateway.marvel.com/v1/public")!
    }

    var path: String {
        switch self {
        case .comics:
            return "/comics"
        }
    }

    var method: Method {
        return .get
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        let timeIntervalSince1970 = "\(Date().timeIntervalSince1970)"

        let hash = (timeIntervalSince1970 + MarvelRoute.privateKey + MarvelRoute.publicKey).md5

        let authParams: [String: String] = [
            "apikey": MarvelRoute.publicKey,
            "ts": timeIntervalSince1970,
            "hash": hash
        ]

        switch self {
        case .comics:

            var params: [String: Any] = [
                "format": "comic",
                "formatType": "comic",
                "orderBy": "-onsaleDate",
                "dateDescriptor": "lastWeek",
                "limit": 50
                ]

            params = params.merging(authParams) { (params, _) in params }

            return .requestParameters(
                parameters: params,
                encoding: URLEncoding.default)
        }
    }

    var headers: [String: String]? {
        return [
            "Content-Type": "application/json"
        ]
    }

    var validationType: ValidationType {
        return .successCodes
    }
}
