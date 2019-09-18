//
//  Comic.swift
//  Test
//
//  Created by Timur on 9/18/19.
//

struct Comic: Codable {
    let id: Int
    let title: String
    let description: String?
    let thumbnail: Thumbnail
    let characters: CharactersInfo
    let dates: [MarvelDate]
}
