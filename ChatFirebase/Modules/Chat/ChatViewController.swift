//
//  ChatViewController.swift
//  ChatFirebase
//
//  Created by Paulina Sanchez Salazar on 07/03/25.
//  
//

import UIKit

protocol ChatViewProtocol: AnyObject {
    var presenter: ChatPresenterProtocol? {get set}
}

class ChatViewController: UIViewController {
    var presenter: ChatPresenterProtocol?
    
    private let contentView: ChatView = ChatView()

    override func loadView() {
        super.loadView()
        view = contentView
    }

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
    
    private let tableView: UITableView = {
           let tableView = UITableView()
           tableView.register(UITableViewCell.self, forCellReuseIdentifier: "messageCell")
           tableView.translatesAutoresizingMaskIntoConstraints = false
           return tableView
       }()
       
       private let messageInputField: UITextField = {
           let textField = UITextField()
           textField.placeholder = "Escribe un mensaje..."
           textField.borderStyle = .roundedRect
           textField.translatesAutoresizingMaskIntoConstraints = false
           return textField
       }()
       
       private let sendButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("Enviar", for: .normal)
           button.addTarget(self, action: #selector(didTapSend), for: .touchUpInside)
           return button
       }()
       
       override func viewDidLoad() {
           super.viewDidLoad()
           title = "Chat"
           view.backgroundColor = .white
           setupUI()
       }
       
       private func setupUI() {
           view.addSubview(tableView)
           
           let inputStackView = UIStackView(arrangedSubviews: [messageInputField, sendButton])
           inputStackView.axis = .horizontal
           inputStackView.spacing = 8
           inputStackView.translatesAutoresizingMaskIntoConstraints = false
           
           view.addSubview(inputStackView)
           
           NSLayoutConstraint.activate([
               tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
               tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
               tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
               tableView.bottomAnchor.constraint(equalTo: inputStackView.topAnchor, constant: -8),
               
               inputStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
               inputStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
               inputStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
               
               messageInputField.heightAnchor.constraint(equalToConstant: 40)
           ])
       }
       
       @objc private func didTapSend() {
           print("Enviar mensaje")
           // Aquí se llamará al Presenter para manejar el envío del mensaje
       }
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 // Temporal, aquí irán los mensajes reales
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath)
        cell.textLabel?.text = "Mensaje \(indexPath.row + 1)"
        return cell
    }
}

extension ChatViewController: ChatViewProtocol {
    
}

