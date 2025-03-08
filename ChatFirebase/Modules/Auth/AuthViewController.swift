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
    
    func showAlert(with message: String)
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
        contentView.loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
    }
        
        @objc private func didTapLogin() {
            print("Loading login...")
            presenter?.login(email: contentView.getEmail(), password: contentView.getPassword())
        }
}

extension AuthViewController: AuthViewProtocol {
    func showAlert(with message: String) {
        WToast.show(showSavedSuccessfully: false, length: .short, message: message)
    }
}

