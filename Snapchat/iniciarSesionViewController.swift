//
//  ViewController.swift
//  Snapchat
//
//  Created by Cesar Limachi on 5/27/22.
//  Copyright © 2022 empresa. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class iniciarSesionViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    //MARK: - Inicializador
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - Actions
    
    @IBAction func iniciarSesionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!){ (user, error) in
            print("Intentanto Iniciar Sesion")
            if error != nil{
                print("Se presento el siguiente error: \(error)")
            } else{
                print("Inicio de sesion exitoso")
            }
        }
    }


}

