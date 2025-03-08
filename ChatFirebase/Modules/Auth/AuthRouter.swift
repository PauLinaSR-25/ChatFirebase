//
//  AuthRouter.swift
//  ChatFirebase
//
//  Created by Paulina Sanchez Salazar on 07/03/25.
//  
//

import UIKit

protocol AuthRouterProtocol: AnyObject {
    
}

class AuthRouter {
    weak var viewController: UIViewController?

    static func createModule()->UIViewController{

        let view = AuthViewController()

        let interactor = AuthInteractor()
        let router = AuthRouter()
        let service = AuthService()
        
        let presenter = AuthPresenter(interface: view, interactor: interactor, router: router)
        
        
        view.presenter = presenter
        interactor.presenter = presenter
        interactor.service = service
        service.interactor = interactor
        router.viewController = view
        
        return view
    }
    
}

extension AuthRouter: AuthRouterProtocol {
    
}
    
    
    

