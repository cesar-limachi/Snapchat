//
//  CreateUserViewController.swift
//  Snapchat
//
//  Created by Cesar Limachi on 6/10/22.
//  Copyright © 2022 empresa. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase
import GoogleSignIn

class CreateUserViewController: UIViewController {
    
    
    //MARK: - Outles
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: - Funcion Actions
    
    @IBAction func loginSesion(_ sender: Any) {
        self.performSegue(withIdentifier: "loginSesion", sender: nil)
    }
    
    
    @IBAction func createUserTapped(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!){ (user, error) in
        print("Intentanto Iniciar Sesion")
            if error != nil{
                print("Se presento el siguiente error al crear el usuario: \(error)")
                let alerta = UIAlertController(title: "Creacion de Usuario", message: "No se creo correctamente", preferredStyle: .alert)
                let btnOK = UIAlertAction(title: "Aceptar", style: .default, handler: {(UIAlertAction) in
                })
                alerta.addAction(btnOK)
                self.present(alerta, animated: true, completion: nil)
            }else{
                print("El usuario fue creado exitosamente")
            Database.database().reference().child("usuarios").child(user!.user.uid).child("email").setValue(user!.user.email)
                //ALERTA PARA QUE MUESTRE CREACION DE USUARIO
                let alerta = UIAlertController(title: "Creacion de Usuario", message: "Usuario \(self.emailTextField.text!) se creo correctamente", preferredStyle: .alert)
                let btnOK = UIAlertAction(title: "Aceptar", style: .default, handler: {(UIAlertAction) in
                    self.performSegue(withIdentifier: "loginSesion", sender: nil)
                })
                alerta.addAction(btnOK)
                self.present(alerta, animated: true, completion: nil)
            }
    }
}
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //setupGoogleCreate()()
        // Do any additional setup after loading the view.
    }

}

