//
//  StorageManager.swift
//  ShortIt
//
//  Created by Александр on 15/01/2022.
//

import Foundation

final class StorageManager {
    
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    
    var linkArray: [String] = []
    
    private init() {}
    
    func saveUrl(_ title: String, for key: String) {
        userDefaults.set(title, forKey: key)
        linkArray.append(title)
    }
    
    func showUrl(for key: String) -> String? {
        userDefaults.string(forKey: key)
    }
}
