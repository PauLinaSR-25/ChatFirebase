//
//  ChatPresenter.swift
//  ChatFirebase
//
//  Created by Paulina Sanchez Salazar on 07/03/25.
//  
//

import Foundation

//Presenter
protocol ChatPresenterProtocol: AnyObject {
    var interactor: ChatInteractorInputProtocol? {get set}
}

class ChatPresenter {
    //MARK: Properties
    var interactor: ChatInteractorInputProtocol?
    weak private var view: ChatViewProtocol?
    private let router: ChatRouterProtocol
    
    
    init(interface: ChatViewProtocol, interactor: ChatInteractorInputProtocol, router: ChatRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension ChatPresenter: ChatPresenterProtocol {
    
}

extension ChatPresenter: ChatInteractorOutputProtocol {
    
}