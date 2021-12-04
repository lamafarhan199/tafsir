//
//  API.swift
//  APIProgect
//
//  Created by لمى فرحان on 29/04/1443 AH.
//

import Foundation
class Welcome: Codable {
    var tafsirs: [Tafsir] = []
}


struct Tafsir: Codable {
    var id: Int
    var author_name : String
    var language_name : String
}
