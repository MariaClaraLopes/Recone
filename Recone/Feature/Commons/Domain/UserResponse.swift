//
//  HomeModel.swift
//  Recone
//
//  Created by Maria Clara Lopes on 26/05/21.
//

import Foundation

struct UserResponse: Decodable {
    let id: String
    let name: String
    let email: String
    let avatar: String
    let categorie: String
    let city: String
    let occupation: String
    let description: String
    let age: Int
    let phone: String
    let links: [Links]?
    let achievements: [Achievements]?
    let imageGallery: [String]?
}

struct Links: Decodable {
    let name: String
    let url: String
}

struct Achievements: Decodable {
    let name: String
    let description: String?
    let date: String
}
