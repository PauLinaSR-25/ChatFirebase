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

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
    
    private let profileImageView: UIImageView = {
           let imageView = UIImageView()
           imageView.contentMode = .scaleAspectFill
           imageView.layer.cornerRadius = 50
           imageView.clipsToBounds = true
           imageView.backgroundColor = .lightGray
           imageView.translatesAutoresizingMaskIntoConstraints = false
           return imageView
       }()
       
       private let nameTextField: UITextField = {
           let textField = UITextField()
           textField.placeholder = "Nombre de usuario"
           textField.borderStyle = .roundedRect
           textField.translatesAutoresizingMaskIntoConstraints = false
           return textField
       }()
       
       private let updateButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("Actualizar Perfil", for: .normal)
           button.addTarget(self, action: #selector(didTapUpdate), for: .touchUpInside)
           return button
       }()
       
       override func viewDidLoad() {
           super.viewDidLoad()
           title = "Perfil"
           view.backgroundColor = .white
           setupUI()
       }
       
       private func setupUI() {
           let stackView = UIStackView(arrangedSubviews: [profileImageView, nameTextField, updateButton])
           stackView.axis = .vertical
           stackView.spacing = 16
           stackView.alignment = .center
           stackView.translatesAutoresizingMaskIntoConstraints = false
           
           view.addSubview(stackView)
           
           NSLayoutConstraint.activate([
               profileImageView.widthAnchor.constraint(equalToConstant: 100),
               profileImageView.heightAnchor.constraint(equalToConstant: 100),
               
               stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
               stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
               stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
           ])
       }
       
       @objc private func didTapUpdate() {
           print("Actualizar perfil")
           // Aquí se llamará al Presenter para manejar la actualización del perfil
       }
}

extension ProfileViewController: ProfileViewProtocol {
    
}

