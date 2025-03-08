//
//  AuthServicesMock.swift
//  ChatFirebase
//
//  Created by Paulina Sanchez Salazar on 07/03/25.
//  
//

import Foundation

protocol AuthServiceInputProtocol: AnyObject {
    // INTERACTOR -> SERVICE
    var interactor: AuthServiceOutputProtocol? { get set }
}

protocol AuthServiceOutputProtocol: AnyObject {
    // SERVICE -> INTERACTOR
}

class AuthServiceMock: AuthServiceInputProtocol {
    weak var interactor: AuthServiceOutputProtocol?
}

