//
//  AuthInteractor.swift
//  ChatFirebase
//
//  Created by Paulina Sanchez Salazar on 07/03/25.
//
//

import Foundation
import FirebaseAuth

protocol AuthInteractorInputProtocol: AnyObject {
    //Presenter -> Interactor
    var presenter: AuthInteractorOutputProtocol? {get set}
    
    func login(_ email: String?, _ password: String?)
}


protocol AuthInteractorOutputProtocol: AnyObject {
    //Interactor->Presenter
    func showError(message: String)
    func navigateToMainApp()
}

class AuthInteractor: AuthInteractorInputProtocol {
    weak var presenter: AuthInteractorOutputProtocol?
    
    private let userDefaultsService = UserDefaultsService()
    
    //Input
    func login(_ email: String?, _ password: String?) {
        guard let email, let password else {
            presenter?.showError(message: "Datos incompletos")
            return
        }
        
        guard isValidEmail(email) else {
            presenter?.showError(message: "Correo electrónico no válido")
            return
        }
        
        guard isValidPassword(password) else {
            presenter?.showError(message: "La contraseña debe tener al menos 6 caracteres")
            return
        }
        
        self.login(email: email, password: password) { [weak self] result in
            switch result {
            case .success(let user):
                self?.userDefaultsService.saveUser(user)
                self?.presenter?.navigateToMainApp()
            case .failure(let error):
                self?.presenter?.showError(message: "Error en el login: \(error.localizedDescription)")
            }
        }
    }
}

extension AuthInteractor {
    private func login(email: String, password: String, completion: @escaping (Result<UserEntity, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
            } else if let user = result?.user {
                let userData = UserEntity(uid: user.uid, email: user.email ?? "")
                completion(.success(userData))
            }
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = ".+@.+\\..+"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    private func isValidPassword(_ password: String) -> Bool {
        return password.count >= 6
    }
}
