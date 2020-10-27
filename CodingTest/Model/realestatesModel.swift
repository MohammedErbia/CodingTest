//
//  realestatesModel.swift
//  CodingTest
//
//  Created by mohammed on 9/6/20.
//  Copyright © 2020 mohammedErbia. All rights reserved.
//

import Foundation

// MARK: - Realestates
struct Realestates: Codable {
    let items: [Item]?
}

// MARK: - Item
struct Item: Codable {
    let id: Int?
    let title: String?
    let price: Int?
    let location: Location?
    let images: [Image]?
}

// MARK: - Image
struct Image: Codable {
    let id: Int?
    let url: String?
}

// MARK: - Location
struct Location: Codable {
    let address: String?
    let latitude, longitude: Double?
}
