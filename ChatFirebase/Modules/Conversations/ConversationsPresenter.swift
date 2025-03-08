//
//  ConversationsPresenter.swift
//  ChatFirebase
//
//  Created by Paulina Sanchez Salazar on 07/03/25.
//  
//

import Foundation

//Presenter
protocol ConversationsPresenterProtocol: AnyObject {
    var interactor: ConversationsInteractorInputProtocol? {get set}
    
    func navigateToNewChat()
}

class ConversationsPresenter {
    //MARK: Properties
    var interactor: ConversationsInteractorInputProtocol?
    weak private var view: ConversationsViewProtocol?
    private let router: ConversationsRouterProtocol
    
    
    init(interface: ConversationsViewProtocol, interactor: ConversationsInteractorInputProtocol, router: ConversationsRouterProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension ConversationsPresenter: ConversationsPresenterProtocol {
    func navigateToNewChat() {
        router.navigateToNewChat()
    }
    
    
}

extension ConversationsPresenter: ConversationsInteractorOutputProtocol {
    
}
