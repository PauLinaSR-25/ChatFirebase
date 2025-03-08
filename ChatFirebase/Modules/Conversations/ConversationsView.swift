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
        translatesAutoresizingMaskIntoConstraints = false
    }
}

