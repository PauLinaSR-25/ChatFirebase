//
//  ConversationsViewController.swift
//  ChatFirebase
//
//  Created by Paulina Sanchez Salazar on 07/03/25.
//  
//

import UIKit

protocol ConversationsViewProtocol: AnyObject {
    var presenter: ConversationsPresenterProtocol? {get set}
}

class ConversationsViewController: UIViewController {
    var presenter: ConversationsPresenterProtocol?
    
    private let contentView: ConversationsView = ConversationsView()

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
           tableView.register(UITableViewCell.self, forCellReuseIdentifier: "conversationCell")
           tableView.translatesAutoresizingMaskIntoConstraints = false
           return tableView
       }()
       
       private let newChatButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("Nuevo Chat", for: .normal)
           button.addTarget(self, action: #selector(didTapNewChat), for: .touchUpInside)
           return button
       }()
       
       override func viewDidLoad() {
           super.viewDidLoad()
           title = "Conversaciones"
           view.backgroundColor = .white
           setupUI()
       }
       
       private func setupUI() {
           view.addSubview(tableView)
           view.addSubview(newChatButton)
           
           tableView.delegate = self
           tableView.dataSource = self
           
           NSLayoutConstraint.activate([
               tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
               tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
               tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
               tableView.bottomAnchor.constraint(equalTo: newChatButton.topAnchor, constant: -16),
               
               newChatButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
               newChatButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
           ])
       }
       
       @objc private func didTapNewChat() {
           print("Abrir pantalla de nuevo chat")
           // Aquí se llamará al Router para navegar a la pantalla de nuevo chat
       }
}

extension ConversationsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 10 // Temporal, aquí irá la lista real de conversaciones
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "conversationCell", for: indexPath)
           cell.textLabel?.text = "Conversación \(indexPath.row + 1)"
           return cell
       }
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           print("Abrir conversación \(indexPath.row + 1)")
           // Aquí se llamará al Router para abrir la pantalla de chat
       }
}

extension ConversationsViewController: ConversationsViewProtocol {
    
}

