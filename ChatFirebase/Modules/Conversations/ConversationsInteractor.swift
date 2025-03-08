//
//  ConversationsInteractor.swift
//  ChatFirebase
//
//  Created by Paulina Sanchez Salazar on 07/03/25.
//  
//

import Foundation

protocol ConversationsInteractorInputProtocol: AnyObject {
    //Presenter -> Interactor
    var presenter: ConversationsInteractorOutputProtocol? {get set}
}


protocol ConversationsInteractorOutputProtocol: AnyObject {
    //Interactor->Presenter
}

class ConversationsInteractor: ConversationsInteractorInputProtocol {
    weak var presenter: ConversationsInteractorOutputProtocol?
    
}
