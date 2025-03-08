//
//  AuthInteractor.swift
//  ChatFirebase
//
//  Created by Paulina Sanchez Salazar on 07/03/25.
//  
//

import Foundation

protocol AuthInteractorInputProtocol: AnyObject {
    //Presenter -> Interactor
    var presenter: AuthInteractorOutputProtocol? {get set}
    var service: AuthServiceInputProtocol? { get set }
}


protocol AuthInteractorOutputProtocol: AnyObject {
    //Interactor->Presenter
}

class AuthInteractor: AuthInteractorInputProtocol {
    weak var presenter: AuthInteractorOutputProtocol?
     var service: AuthServiceInputProtocol?
    
}


extension AuthInteractor: AuthServiceOutputProtocol {

} 