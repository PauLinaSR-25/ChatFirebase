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
    var service: ProfileServiceInputProtocol? { get set }
}


protocol ProfileInteractorOutputProtocol: AnyObject {
    //Interactor->Presenter
}

class ProfileInteractor: ProfileInteractorInputProtocol {
    weak var presenter: ProfileInteractorOutputProtocol?
     var service: ProfileServiceInputProtocol?
    
}


extension ProfileInteractor: ProfileServiceOutputProtocol {

} 