//
//  ProfileRouter.swift
//  ChatFirebase
//
//  Created by Paulina Sanchez Salazar on 07/03/25.
//  
//

import UIKit

protocol ProfileRouterProtocol: AnyObject {
    
}

class ProfileRouter {
    weak var viewController: UIViewController?

    static func createModule()->UIViewController{

        let view = ProfileViewController()
        let interactor = ProfileInteractor()
        let router = ProfileRouter()
        let presenter = ProfilePresenter(interface: view, interactor: interactor, router: router)
        
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
}

extension ProfileRouter: ProfileRouterProtocol {
    
}
    
    
    

