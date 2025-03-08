//
//  ChatRouter.swift
//  ChatFirebase
//
//  Created by Paulina Sanchez Salazar on 07/03/25.
//  
//

import UIKit

protocol ChatRouterProtocol: AnyObject {
    
}

class ChatRouter {
    weak var viewController: UIViewController?

    static func createModule()->UIViewController{

        let view = ChatViewController()

        let interactor = ChatInteractor()
        let router = ChatRouter()
        let service = ChatService()
        
        let presenter = ChatPresenter(interface: view, interactor: interactor, router: router)
        
        
        view.presenter = presenter
        interactor.presenter = presenter
        interactor.service = service
        service.interactor = interactor
        router.viewController = view
        
        return view
    }
    
}

extension ChatRouter: ChatRouterProtocol {
    
}
    
    
    

