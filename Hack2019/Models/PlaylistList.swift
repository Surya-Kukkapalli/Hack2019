//
//  PlaylistList.swift
//  Hack2019
//
//  Created by Surya Kukkapalli on 11/2/19.
//  Copyright © 2019 Surya Kukkapalli. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let playlistArray = try? newJSONDecoder().decode(PlaylistList.self, from: jsonData)

import Foundation
import SwiftUI

// MARK: - PlaylistListElement
struct PlaylistList: Codable {
    let href: String
    let items: [Item]
    let limit: Int
    let next: String
    let offset: Int
    let previous: JSONNull?
    let total: Int
}

//// MARK: - Item
//struct Item: Codable {
//    let collaborative: Bool
//    let externalUrls: ExternalUrls
//    let href: String
//    let id: String
//    let images: [Image]
//    let name: String
//    let owner: Owner
//    let primaryColor: JSONNull?
//    let itemPublic: Bool
//    let snapshotID: String
//    let tracks: Tracks
//    let type, uri: String
//
//    enum CodingKeys: String, CodingKey {
//        case collaborative
//        case externalUrls = "external_urls"
//        case href, id, images, name, owner
//        case primaryColor = "primary_color"
//        case itemPublic = "public"
//        case snapshotID = "snapshot_id"
//        case tracks, type, uri
//    }
//}

//// MARK: - ExternalUrls
//struct ExternalUrls: Codable {
//    let spotify: String
//}
//
//// MARK: - Image
//struct Image: Codable {
//    let height: Int?
//    let url: String
//    let width: Int?
//}

// MARK: - Owner
struct Owner: Codable {
    let displayName: String
    let externalUrls: ExternalUrls
    let href: String
    let id, type, uri: String

    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case externalUrls = "external_urls"
        case href, id, type, uri
    }
}

// MARK: - Tracks
struct Tracks: Codable {
    let href: String
    let total: Int
}

typealias PlaylistListArray = [PlaylistList]

// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
