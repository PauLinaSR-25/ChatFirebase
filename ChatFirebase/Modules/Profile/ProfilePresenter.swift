//
//  ProfilePresenter.swift
//  ChatFirebase
//
//  Created by Paulina Sanchez Salazar on 07/03/25.
//  
//

import Foundation

//Presenter
protocol ProfilePresenterProtocol: AnyObject {
    var interactor: ProfileInteractorInputProtocol? {get set}
}

class ProfilePresenter {
    //MARK: Properties
    var interactor: ProfileInteractorInputProtocol?
    weak private var view: ProfileViewProtocol?
    private let router: ProfileRouterProtocol
    
    
    init(interface: ProfileViewProtocol, interactor: ProfileInteractorInputProtocol, router: ProfileRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension ProfilePresenter: ProfilePresenterProtocol {
    
}

extension ProfilePresenter: ProfileInteractorOutputProtocol {
    
}