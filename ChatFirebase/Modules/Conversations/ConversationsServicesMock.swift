//
//  ConversationsServicesMock.swift
//  ChatFirebase
//
//  Created by Paulina Sanchez Salazar on 07/03/25.
//  
//

import Foundation

protocol ConversationsServiceInputProtocol: AnyObject {
    // INTERACTOR -> SERVICE
    var interactor: ConversationsServiceOutputProtocol? { get set }
}

protocol ConversationsServiceOutputProtocol: AnyObject {
    // SERVICE -> INTERACTOR
}

class ConversationsServiceMock: ConversationsServiceInputProtocol {
    weak var interactor: ConversationsServiceOutputProtocol?
}

