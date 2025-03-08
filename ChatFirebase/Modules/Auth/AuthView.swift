//
//  AuthView.swift
//  ChatFirebase
//
//  Created by Paulina Sanchez Salazar on 07/03/25.
//  
//

import UIKit

final class AuthView: UIView {
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

extension AuthView {
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}

