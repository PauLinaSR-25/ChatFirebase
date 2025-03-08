//
//  UserDefaultsService.swift
//  ChatFirebase
//
//  Created by Paulina Sanchez Salazar on 07/03/25.
//

import Foundation

import Foundation

class UserDefaultsService {
    private let userDefaults = UserDefaults.standard
    
    func saveUser(_ user: UserEntity) {
        userDefaults.set(user.uid, forKey: "uid")
        userDefaults.set(user.email, forKey: "email")
        userDefaults.set(user.name, forKey: "name")
        userDefaults.set(user.imageURL, forKey: "imageURL")
    }
    
    func getUser() -> UserEntity? {
        guard let uid = userDefaults.string(forKey: "uid"),
              let email = userDefaults.string(forKey: "email") else {
            return nil
        }
        let name = userDefaults.string(forKey: "name")
        let imageURL = userDefaults.string(forKey: "imageURL")
        
        return UserEntity(uid: uid, email: email, name: name, imageURL: imageURL)
    }
    
    func clearUser() {
        userDefaults.removeObject(forKey: "uid")
        userDefaults.removeObject(forKey: "email")
        userDefaults.removeObject(forKey: "name")
        userDefaults.removeObject(forKey: "imageURL")
    }
}
