//
//  AppSession.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 24/05/21.
//

import Foundation

enum AppSessionKey: String {
    case isLoggedIn
}

class AppSession {
    private let databaseProvider = ProviderDatabase()
    static let shared: AppSession = AppSession()
    
    static func updateUser(isLoggedIn: Bool) {
        shared.databaseProvider.save(isLoggedIn: isLoggedIn, key: AppSessionKey.isLoggedIn.rawValue)
    }
    
    static func isUserLoggedIn() -> Bool {
        shared.databaseProvider.isLoggedIn(for: AppSessionKey.isLoggedIn.rawValue)
    }
}

