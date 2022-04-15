//
//  ArchieveAPI.swift
//  NewYorkTimesAPI
//
//  Created by Mingyong Zhu on 4/13/22.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct ArchieveAPI: Codable {
    let copyright: String
    let response: Response
}

// MARK: - Response
struct Response: Codable {
    let docs: [Article]
    let meta: Meta
}


// MARK: - Article
struct Article: Codable {
    let abstract: String
    let webURL: String
    let snippet, leadParagraph, source: String
    let multimedia: [Multimedia]
    let headline: Headline
    let keywords: [Keyword]
    let pubDate: String
    let documentType, newsDesk, sectionName: String
    let byline: Byline
    let typeOfMaterial, id: String
    let wordCount: Int
    let uri: String
    let printSection, printPage: String?

    enum CodingKeys: String, CodingKey {
        case abstract
        case webURL = "web_url"
        case snippet
        case leadParagraph = "lead_paragraph"
        case source, multimedia, headline, keywords
        case pubDate = "pub_date"
        case documentType = "document_type"
        case newsDesk = "news_desk"
        case sectionName = "section_name"
        case byline
        case typeOfMaterial = "type_of_material"
        case id = "_id"
        case wordCount = "word_count"
        case uri
        case printSection = "print_section"
        case printPage = "print_page"
    }
}
       
 
// MARK: - Byline
struct Byline: Codable {
    let original: String
    let person: [Person]
    let organization: String?
    
    enum CodingKeys: String, CodingKey {
        case original
        case person
        case organization
    }
}

// MARK: - Person
struct Person: Codable {
    let firstname: String
    let middlename: String?
    let lastname: String
    let qualifier: String?
    let title: String?
    let role: String
    let organization: String
    let rank: Int
    
    enum CodingKeys: String, CodingKey {
        case firstname
        case middlename
        case lastname
        case qualifier
        case title
        case role
        case organization
        case rank
    }
}

// MARK: - Headline
struct Headline: Codable {
    let main: String
    let kicker: String?
    let contentKicker: String?
    let printHeadline: String
    let name, seo, sub: String?

    enum CodingKeys: String, CodingKey {
        case main, kicker
        case contentKicker = "content_kicker"
        case printHeadline = "print_headline"
        case name, seo, sub
    }
}

// MARK: - Keyword
struct Keyword: Codable {
    let name: String
    let value: String
    let rank: Int
    let major: String
}

// MARK: - Multimedia
struct Multimedia: Codable {
    let rank: Int
    let subtype: String
    let caption, credit: String?
    let type: String
    let url: String
    let height, width: Int
    let subType: String
    let cropName: String
    let legacy: Legacy

    enum CodingKeys: String, CodingKey {
        case rank, subtype, caption, credit, type, url, height, width, subType
        case cropName = "crop_name"
        case legacy
    }
}


// MARK: - Legacy
struct Legacy: Codable {
    let xlarge: String?
    let xlargewidth, xlargeheight: Int?
//    let thumbnail: String?
//    let thumbnailwidth, thumbnailheight: Int?
}

// MARK: - Meta
struct Meta: Codable {
    let hits: Int
}

