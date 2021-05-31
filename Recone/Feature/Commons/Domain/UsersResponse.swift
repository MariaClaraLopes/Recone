//
//  HomeModel.swift
//  Recone
//
//  Created by Maria Clara Lopes on 26/05/21.
//

import Foundation

struct UsersResponse: Decodable {
    let id: String
    let name: String
    let avatar: String
    let categorie: String
    let city: String
    let occupation: String
}
