//
//  ProfileServicesMock.swift
//  ChatFirebase
//
//  Created by Paulina Sanchez Salazar on 07/03/25.
//  
//

import Foundation

protocol ProfileServiceInputProtocol: AnyObject {
    // INTERACTOR -> SERVICE
    var interactor: ProfileServiceOutputProtocol? { get set }
}

protocol ProfileServiceOutputProtocol: AnyObject {
    // SERVICE -> INTERACTOR
}

class ProfileServiceMock: ProfileServiceInputProtocol {
    weak var interactor: ProfileServiceOutputProtocol?
}

