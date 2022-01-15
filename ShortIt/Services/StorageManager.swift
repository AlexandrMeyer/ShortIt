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
    
    var linkArray: [Responce] = []
    
    private init() {}
    
    func saveResponce(_ responce: Responce) {
        userDefaults.set(responce.shortUrl, forKey: responce.longUrl)
        linkArray.append(responce)
    }
    
//    func saveUrl(_ title: String, forkey key: String) {
//         userDefaults.set(title, forKey: key)
//        linkArray.append(title)
//    }
    
    func showUrl(forkey key: String) -> String? {
        userDefaults.string(forKey: key)
    }
}
