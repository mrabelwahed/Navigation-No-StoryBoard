//
//  ViewController.swift
//  Navigation-NoStoryBoard
//
//  Created by MahmoudRamadan on 4/14/20.
//  Copyright © 2020 MahmoudRamadan. All rights reserved.
//

import UIKit

protocol ChangeViewControllerButtonTextDelegate : class {
    func textFieldTextChanged(to text:String)
}

class ViewController: UIViewController {

    @objc var pushNavControllerButton:UIButton!
    var presentModalViewControllerButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view controller
        view.backgroundColor = .red
        // title for UINavController
        title = "Navigation Demo"
        // button 1
        pushNavControllerButton = UIButton()
        pushNavControllerButton.translatesAutoresizingMaskIntoConstraints = false
        pushNavControllerButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        pushNavControllerButton.setTitle("Nav Controller", for: .normal)
        pushNavControllerButton.setTitleColor(.black, for: .normal)
        pushNavControllerButton.addTarget(self, action: #selector(pushNavControllerPressed), for: .touchUpInside)
        view.addSubview(pushNavControllerButton)
        //button 2
        presentModalViewControllerButton = UIButton()
             presentModalViewControllerButton.translatesAutoresizingMaskIntoConstraints = false
             presentModalViewControllerButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
             presentModalViewControllerButton.setTitle("Modal Controller", for: .normal)
             presentModalViewControllerButton.setTitleColor(.black, for: .normal)
             presentModalViewControllerButton.addTarget(self, action: #selector(presentModalViewControllerPressed), for: .touchUpInside)
             view.addSubview(presentModalViewControllerButton)
    
        setupConstraints()
    }

    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            pushNavControllerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            pushNavControllerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            presentModalViewControllerButton.topAnchor.constraint(equalTo: pushNavControllerButton.bottomAnchor, constant: 20),
            presentModalViewControllerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
           // presentModalViewControllerButton.widthAnchor.constraint(equalToConstant: 200),
            presentModalViewControllerButton.heightAnchor.constraint(equalToConstant: 60),
            presentModalViewControllerButton.leadingAnchor.constraint(equalTo: pushNavControllerButton.leadingAnchor, constant: 0),
            presentModalViewControllerButton.trailingAnchor.constraint(equalTo: pushNavControllerButton.trailingAnchor, constant: 0)
        ])
    }
    
    @objc func pushNavControllerPressed(){
        //print("nav controller presses")
        let blueNavigatioController = BlueViewController()
        navigationController?.pushViewController(blueNavigatioController, animated: true)
    }
    
    @objc func presentModalViewControllerPressed(){
         // print("modal controller presses")
        let modalViewControllerv = ModalViewController(placeHolder: presentModalViewControllerButton.title(for: .normal)!)
        modalViewControllerv.delegate = self
        present(modalViewControllerv, animated: true, completion: nil)
      }

}

extension ViewController :ChangeViewControllerButtonTextDelegate{
    func textFieldTextChanged(to text: String) {
        presentModalViewControllerButton.titleLabel?.text = text
    }
    
    
}

