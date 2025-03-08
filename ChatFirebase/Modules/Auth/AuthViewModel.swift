//
//  AuthViewModel.swift
//  ChatFirebase
//
//  Created by Paulina Sanchez Salazar on 07/03/25.
//  
//

import Foundation

struct UserEntity {
    let uid: String
    let email: String
    let name: String?
    let imageURL: String?

    init(uid: String, email: String, name: String? = nil, imageURL: String? = nil) {
        self.uid = uid
        self.email = email
        self.name = name
        self.imageURL = imageURL
    }
}
