//
//  ConversationsRouter.swift
//  ChatFirebase
//
//  Created by Paulina Sanchez Salazar on 07/03/25.
//  
//

import UIKit

protocol ConversationsRouterProtocol: AnyObject {
    
}

class ConversationsRouter {
    weak var viewController: UIViewController?

    static func createModule()->UIViewController{

        let view = ConversationsViewController()

        let interactor = ConversationsInteractor()
        let router = ConversationsRouter()
        let service = ConversationsService()
        
        let presenter = ConversationsPresenter(interface: view, interactor: interactor, router: router)
        
        
        view.presenter = presenter
        interactor.presenter = presenter
        interactor.service = service
        service.interactor = interactor
        router.viewController = view
        
        return view
    }
    
}

extension ConversationsRouter: ConversationsRouterProtocol {
    
}
    
    
    

