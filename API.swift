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

//struct Translation: Codable {
//    var id: Int?
//    var name, authorName, slug, languageName: String?
//    var translatedName: TranslatedName?
//
//    enum CodingKeys: String, CodingKey {
//        case id, name
//        case authorName
//        case slug
//        case languageName
//        case translatedName
//    }
//}
//
//// MARK: - TranslatedName
//struct TranslatedName: Codable {
//    var name, languageName: String?
//
//    enum CodingKeys: String, CodingKey {
//        case name
//        case languageName
//    }
//}
//
// MARK: - FetchTrans
struct FetchTrans: Codable {
    let translations: [Translation]?
}

// MARK: - Translation
struct Translation: Codable {
    let id: Int?
    let name : String
    let authorName, slug, languageName: String?
    let translatedName: TranslatedName?

    enum CodingKeys: String, CodingKey {
        case id, name
        case authorName
        case slug
        case languageName
        case translatedName
    }
}

// MARK: - TranslatedName
struct TranslatedName: Codable {
    let name, languageName: String?

    enum CodingKeys: String, CodingKey {
        case name
        case languageName
    }
}
