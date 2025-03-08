//
//  ProfileInteractor.swift
//  ChatFirebase
//
//  Created by Paulina Sanchez Salazar on 07/03/25.
//  
//

import Foundation

protocol ProfileInteractorInputProtocol: AnyObject {
    //Presenter -> Interactor
    var presenter: ProfileInteractorOutputProtocol? {get set}
}


protocol ProfileInteractorOutputProtocol: AnyObject {
    //Interactor->Presenter
}

class ProfileInteractor: ProfileInteractorInputProtocol {
    weak var presenter: ProfileInteractorOutputProtocol?
    
}
