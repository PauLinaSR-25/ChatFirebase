//
//  ProfileViewController.swift
//  ChatFirebase
//
//  Created by Paulina Sanchez Salazar on 07/03/25.
//  
//

import UIKit

protocol ProfileViewProtocol: AnyObject {
    var presenter: ProfilePresenterProtocol? {get set}
}

class ProfileViewController: UIViewController {
    var presenter: ProfilePresenterProtocol?
    
    private let contentView: ProfileView = ProfileView()

    override func loadView() {
        super.loadView()
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension ProfileViewController: ProfileViewProtocol {
    
}

