//
//  ViewController.swift
//  Snapchat
//
//  Created by Cesar Limachi on 5/27/22.
//  Copyright © 2022 empresa. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

class iniciarSesionViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    
    
    
    //MARK: - Inicializador
    
    //var credential:AuthCredential
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGoogle()
        
    }
        
    //MARK: - Funcion Google
    
    
    private func setupGoogle(){
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.delegate = self
        
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
    
    @IBAction func btnGoogle(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signIn()
        
    }
    
    
    
    //MARK: - Google SigIn
    
    


}

