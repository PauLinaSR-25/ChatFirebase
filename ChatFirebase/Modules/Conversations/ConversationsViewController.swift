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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Conversaciones"
        contentView.newChatButton.addTarget(self, action: #selector(didTapNewChat), for: .touchUpInside)
    }
    
    @objc private func didTapNewChat() {
        print("Open new chat...")
        presenter?.navigateToNewChat()
    }
}

extension ConversationsViewController: ConversationsViewProtocol {
    
}

