//
//  ChatView.swift
//  ChatFirebase
//
//  Created by Paulina Sanchez Salazar on 07/03/25.
//  
//

import UIKit

final class ChatView: UIView {
    //MARK: - Properties
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
       
       let sendButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("Enviar", for: .normal)
           button.backgroundColor = .toastSuccessText
           button.layer.cornerRadius = 4
           button.setTitleColor(.white, for: .normal)
           button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
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

extension ChatView {
    private func setup() {
        
        addSubview(tableView)
        
        let inputStackView = UIStackView(arrangedSubviews: [messageInputField, sendButton])
        inputStackView.axis = .horizontal
        inputStackView.spacing = 8
        inputStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(inputStackView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: inputStackView.topAnchor, constant: -8),
            
            inputStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            inputStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            inputStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8),
            
            messageInputField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ChatView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath)
        cell.textLabel?.text = "Mensaje \(indexPath.row + 1)"
        return cell
    }
}

