//
//  AuthRouter.swift
//  ChatFirebase
//
//  Created by Paulina Sanchez Salazar on 07/03/25.
//  
//

import UIKit

protocol AuthRouterProtocol: AnyObject {
    func navigateToMainApp()
}

class AuthRouter {
    weak var viewController: UIViewController?

    static func createModule()->UIViewController{

        let view = AuthViewController()
        let interactor = AuthInteractor()
        let router = AuthRouter()
        
        let presenter = AuthPresenter(interface: view, interactor: interactor, router: router)
        
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
}

extension AuthRouter: AuthRouterProtocol {
    func navigateToMainApp() {
           let mainTabBarController = MainTabBarController()
           mainTabBarController.modalPresentationStyle = .fullScreen
           viewController?.present(mainTabBarController, animated: true, completion: nil)
       }
}
    
    
    

