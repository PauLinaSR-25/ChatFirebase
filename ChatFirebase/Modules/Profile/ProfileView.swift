//
//  ProfileView.swift
//  ChatFirebase
//
//  Created by Paulina Sanchez Salazar on 07/03/25.
//  
//

import UIKit

final class ProfileView: UIView {
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

extension ProfileView {
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}

