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
    private let key = "responce"
    
    private init() {}
    
    var responces: [Responce] {
        get {
            guard let data = userDefaults.data(forKey: key), let model = try? PropertyListDecoder().decode([Responce].self, from: data) else { return [] }
            return model
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) {
                userDefaults.set(data, forKey: key)
            }
        }
    }
    
    func saveResponce(_ responce: Responce) {
        let responce = Responce(shortUrl: responce.shortUrl, longUrl: responce.longUrl)
        responces.append(responce)
    }
}
