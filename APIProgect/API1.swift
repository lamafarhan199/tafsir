//
//  API1.swift
//  APIProgect
//
//  Created by لمى فرحان on 01/05/1443 AH.
//

import Foundation
class Welcome: Codable {
    
    let translations: [Translation]
}

struct Translation: Codable {
    let id: Int
    let name, authorName: String
    let slug: String?
    let languageName: String
    let translatedName: TranslatedName
