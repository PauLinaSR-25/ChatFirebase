//
//  ConversationsView.swift
//  ChatFirebase
//
//  Created by Paulina Sanchez Salazar on 07/03/25.
//  
//

import UIKit

final class ConversationsView: UIView {
    //MARK: - Properties
    private let tableView: UITableView = {
           let tableView = UITableView()
           tableView.register(UITableViewCell.self, forCellReuseIdentifier: "conversationCell")
           tableView.translatesAutoresizingMaskIntoConstraints = false
           return tableView
       }()
       
       let newChatButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("Nuevo Chat", for: .normal)
           button.backgroundColor = .toastSuccessText
           button.layer.cornerRadius = 10
           button.setTitleColor(.white, for: .normal)
           button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
           button.translatesAutoresizingMaskIntoConstraints = false
           return button
       }()
    
    //MARK: - init
    init() {
        super.init(frame: .zero)
       
        setup()
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ConversationsView {
    private func setup() {
        backgroundColor = .contentBackground
        
        addSubview(tableView)
        addSubview(newChatButton)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.9),
            
            newChatButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -12),
            newChatButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            newChatButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            newChatButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.08)
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ConversationsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 10
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "conversationCell", for: indexPath)
           cell.textLabel?.text = "Conversación \(indexPath.row + 1)"
           return cell
       }
       
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           print("Abrir conversación \(indexPath.row + 1)")
       }
}

