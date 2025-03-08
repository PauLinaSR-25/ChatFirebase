//
//  AuthViewController.swift
//  ChatFirebase
//
//  Created by Paulina Sanchez Salazar on 07/03/25.
//  
//

import UIKit

protocol AuthViewProtocol: AnyObject {
    var presenter: AuthPresenterProtocol? {get set}
}

class AuthViewController: UIViewController {
    var presenter: AuthPresenterProtocol?
    
    private let contentView: AuthView = AuthView()

    override func loadView() {
        super.loadView()
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension AuthViewController: AuthViewProtocol {
    
}

