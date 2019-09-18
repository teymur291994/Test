//
//  MarvelResponse.swift
//  Test
//
//  Created by Timur on 9/18/19.
//

struct MarvelResponse<T: Codable>: Codable {
    let data: MarvelResults<T>
}

struct MarvelResults<T: Codable>: Codable {
    let results: [T]
}
