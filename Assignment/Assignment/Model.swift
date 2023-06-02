//
//  Model.swift
//  Assignment
//
//  Created by satyam singh on 02/06/23.
//

import Foundation

struct ResponseReceived: Codable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Codable {
    let artistName: String
    let collectionName: String?
    let trackCount: Int?
    let artworkUrl100: String
    let description: String?
}
