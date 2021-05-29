//
//  AppSession.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 24/05/21.
//

import Foundation

enum AppSessionKey: String {
    case isLoggedIn
    case id
}

class AppSession {
    private let databaseProvider = ProviderDatabase()
    static let shared: AppSession = AppSession()
    
    static func updateUser(isLoggedIn: Bool) {
        shared.databaseProvider.save(isLoggedIn: isLoggedIn, key: AppSessionKey.isLoggedIn.rawValue)
    }
    
    static func updateUser(id: String) {
        shared.databaseProvider.save(id: id, key: AppSessionKey.id.rawValue)
    }
    
    static func isUserLoggedIn() -> Bool {
        shared.databaseProvider.isLoggedIn(for: AppSessionKey.isLoggedIn.rawValue)
    }
    
    static func getId() -> String {
        shared.databaseProvider.getId(for: AppSessionKey.id.rawValue)
    }
}

