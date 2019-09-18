//
//  Thumbnail.swift
//  Test
//
//  Created by Timur on 9/18/19.
//

import Foundation

struct Thumbnail: Codable {
    let path: String
    let `extension`: String

    var url: URL {
        return URL(string: path + "." + `extension`)!
    }
}
