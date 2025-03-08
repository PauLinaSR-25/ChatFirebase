//
//  WToast.swift
//  ChatFirebase
//
//  Created by Paulina Sanchez Salazar on 07/03/25.
//

import UIKit

enum WToastLength: TimeInterval {
    case short = 1.0
    case long = 5.0
}

final class WToast: UIView {
    
    var length: WToastLength = .short
    
    init(frame: CGRect, length: WToastLength = .short) {
        super.init(frame: frame)
        self.length = length
        self.alpha = 0.0
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 5.0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func show() {
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = 1.0
        }) { finished in
            self.perform(#selector(self.hide), with: nil, afterDelay: self.length.rawValue)
        }
    }
    
    @objc func hide() {
        UIView.animate(withDuration: 0.8, animations: {
            self.alpha = 0.0
        }) { finished in
            self.removeFromSuperview()
        }
    }
    
    static func create(_ showSavedSuccessfully: Bool, _ keyWindow: UIWindow,_ message: String) -> WToast {
        let screenSize = UIScreen.main.bounds.size
        
        let backgroundColor = showSavedSuccessfully ? UIColor(named: "ToastSuccessBackground") : UIColor(named: "ToastErrorBackground")
        let textColor = showSavedSuccessfully ? UIColor(named: "ToastSuccessText") : UIColor(named: "ToastErrorText")
        
        let toast = WToast(frame: .zero)
        toast.backgroundColor = backgroundColor
        toast.translatesAutoresizingMaskIntoConstraints = false
        
        toast.heightAnchor.constraint(equalToConstant: screenSize.height * 0.06).isActive = true
        
        let textLabel = UILabel()
        textLabel.backgroundColor = .clear
        textLabel.textAlignment = .center
        textLabel.font = UIFont(name: "Avenir-Black", size: 16) ??  UIFont.systemFont(ofSize: 16, weight: .black)
        textLabel.textColor = textColor
        textLabel.numberOfLines = 0
        textLabel.lineBreakMode = .byWordWrapping
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //FIXME: message custom
        textLabel.text = message
        
        toast.addSubview(textLabel)
        
        textLabel.centerXAnchor.constraint(equalTo: toast.centerXAnchor).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: toast.centerYAnchor).isActive = true
        
        return toast
    }
    
    static func show(showSavedSuccessfully success: Bool, length: WToastLength = .short, message: String) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow }) else {
            return
        }
        
        let toast = WToast.create(success, keyWindow, message)
        toast.length = length
        
        keyWindow.addSubview(toast)
        toast.leadingAnchor.constraint(equalTo: keyWindow.leadingAnchor).isActive = true
        toast.trailingAnchor.constraint(equalTo: keyWindow.trailingAnchor).isActive = true
        toast.topAnchor.constraint(equalTo: keyWindow.safeAreaLayoutGuide.topAnchor, constant: keyWindow.frame.size.height/16).isActive = true
        
        toast.show()
    }
}
