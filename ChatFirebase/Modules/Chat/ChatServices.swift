//
//  ChatServices.swift
//  ChatFirebase
//
//  Created by Paulina Sanchez Salazar on 07/03/25.
//  
//

import Foundation

protocol ChatServiceInputProtocol: AnyObject {
    // INTERACTOR -> SERVICE
    var interactor: ChatServiceOutputProtocol? { get set }
}

protocol ChatServiceOutputProtocol: AnyObject {
    // SERVICE -> INTERACTOR
}

class ChatService: ChatServiceInputProtocol {
    weak var interactor: ChatServiceOutputProtocol?
}

