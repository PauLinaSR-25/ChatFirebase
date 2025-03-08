//
//  ChatInteractor.swift
//  ChatFirebase
//
//  Created by Paulina Sanchez Salazar on 07/03/25.
//  
//

import Foundation

protocol ChatInteractorInputProtocol: AnyObject {
    //Presenter -> Interactor
    var presenter: ChatInteractorOutputProtocol? {get set}
}


protocol ChatInteractorOutputProtocol: AnyObject {
    //Interactor->Presenter
}

class ChatInteractor: ChatInteractorInputProtocol {
    weak var presenter: ChatInteractorOutputProtocol?
    
}
