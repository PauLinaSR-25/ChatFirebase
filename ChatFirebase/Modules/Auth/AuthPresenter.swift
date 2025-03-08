//
//  AuthPresenter.swift
//  ChatFirebase
//
//  Created by Paulina Sanchez Salazar on 07/03/25.
//  
//

import Foundation

//Presenter
protocol AuthPresenterProtocol: AnyObject {
    var interactor: AuthInteractorInputProtocol? {get set}
}

class AuthPresenter {
    //MARK: Properties
    var interactor: AuthInteractorInputProtocol?
    weak private var view: AuthViewProtocol?
    private let router: AuthRouterProtocol
    
    
    init(interface: AuthViewProtocol, interactor: AuthInteractorInputProtocol, router: AuthRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension AuthPresenter: AuthPresenterProtocol {
    
}

extension AuthPresenter: AuthInteractorOutputProtocol {
    
}