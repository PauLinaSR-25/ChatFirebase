//
//  ConversationsRouter.swift
//  ChatFirebase
//
//  Created by Paulina Sanchez Salazar on 07/03/25.
//  
//

import UIKit

protocol ConversationsRouterProtocol: AnyObject {
    func navigateToNewChat()
}

class ConversationsRouter {
    weak var viewController: UIViewController?

    static func createModule()->UIViewController{

        let view = ConversationsViewController()
        let interactor = ConversationsInteractor()
        let router = ConversationsRouter()
        
        let presenter = ConversationsPresenter(interface: view, interactor: interactor, router: router)
        
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
}

extension ConversationsRouter: ConversationsRouterProtocol {
    func navigateToNewChat() {
        let vc = ChatRouter.createModule()
        
        viewController?.present(ChatRouter.createModule(), animated: true)
    }
}
    
    
    

