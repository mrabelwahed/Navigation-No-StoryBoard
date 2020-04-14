//
//  ModalViewController.swift
//  Navigation-NoStoryBoard
//
//  Created by MahmoudRamadan on 4/14/20.
//  Copyright © 2020 MahmoudRamadan. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    
    var textField:UITextField!
    var  button : UIButton!
    var placeHolder:String
    weak var delegate : ChangeViewControllerButtonTextDelegate?
    
    init(placeHolder : String) {
        self.placeHolder = placeHolder
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        title = "Cyan"
        
        
        //textField
        
        textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.text = placeHolder
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.textAlignment = .center
        textField.clearsOnBeginEditing = true
        view.addSubview(textField)
        
        
        //UIButton
        
        button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Dismiss and save text", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        view.addSubview(button)
        
        setupConstraints()
        
        
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        
    }
    
    @objc func buttonPressed(){
        if let text = textField.text , text != "" {
            delegate?.textFieldTextChanged(to: text)
            print(text)
        }
        dismiss(animated: true, completion: nil)
    }
    
    
}
