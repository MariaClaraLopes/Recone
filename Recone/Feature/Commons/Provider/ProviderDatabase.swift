//
//  ProviderDatabase.swift
//  HomeScreen
//
//  Created by Maria Clara Lopes on 24/05/21.
//

import Foundation

final class ProviderDatabase {
    private let defaults = UserDefaults.standard
    
    func save(isLoggedIn: Bool, key: String) {
        defaults.set(isLoggedIn, forKey: key)
    }
    
    func isLoggedIn(for key: String) -> Bool {
        return defaults.bool(forKey: key)
    }
}


