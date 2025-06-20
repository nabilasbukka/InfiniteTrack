//
//  UserDefaultsManager.swift
//  InfiniteTrack
//
//  Created by Nabila Syafrina on 02/06/25.
//

import Foundation

enum UserDefaultsKey: String {
    case user
    case token
}

final class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    func set(encodable: Encodable, rawKey: String) {
        if let data = try? JSONEncoder().encode(encodable) {
            UserDefaults.standard.set(data, forKey: rawKey)
        }
    }
    
    func get<Value: Decodable>(rawKey: String) -> Value? {
        var value: Value?
        if let data = UserDefaults.standard.data(forKey: rawKey), let decodable = try? JSONDecoder().decode(Value.self, from: data) {
            value = decodable
        }
        return value
    }
    
    func set(encodable: Encodable, key: UserDefaultsKey) {
        set(encodable: encodable, rawKey: key.rawValue)
    }
    
    func get<Value: Decodable>(key: UserDefaultsKey) -> Value? {
        get(rawKey: key.rawValue)
    }
    
    func remove(key: UserDefaultsKey) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
}
