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
            guard let data = userDefaults.data(forKey: key), let responce = try? PropertyListDecoder().decode([Responce].self, from: data) else { return [] }
            return responce
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
    
    func removeResponce(at index: Int) {
        if let data = userDefaults.data(forKey: key) {
            do {
                var arr = try PropertyListDecoder().decode([Responce].self, from: data)
                arr.remove(at: index)
                let data = try? PropertyListEncoder().encode(arr)
                userDefaults.set(data, forKey: key)
            } catch {
                print(error)
            }
        }
    }
}
