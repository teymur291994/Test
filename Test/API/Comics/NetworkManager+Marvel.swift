//
//  NetworkManager+Marvel.swift
//  Test
//
//  Created by Timur on 9/18/19.
//

typealias VoidToVoid = () -> Void?

extension NetworkManager {
    func comics(onSuccess success:  @escaping (_ marvelResponse: MarvelResponse<Comics>?) -> Void, onFailure failure: @escaping ErrorToVoid) {
        requestObject(MarvelRoute.comics, onSuccess: success, onFailure: failure)
    }
}
