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

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension ChatViewController: ChatViewProtocol {
    
}

