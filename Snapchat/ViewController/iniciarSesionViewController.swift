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
import FirebaseDatabase
import GoogleSignIn

class iniciarSesionViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    //BTN SIN ACCION
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
 
    
    //MARK: - Actions Iniciar Sesion
    
    @IBAction func iniciarSesionTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!){ (user, error) in
            print("Intentanto Iniciar Sesion")
            
            //ALERTA PARA CREAR UN NUEVO USUARIO
            if error != nil{
                print("Se presento el siguiente error al crear el usuario: \(error)")
                let alerta = UIAlertController(title: "Creacion de usuario", message: "Usuario: \(self.emailTextField.text!) No existe este correo.", preferredStyle: .alert)
                
                let btnOK = UIAlertAction(title: "Crear", style: .default, handler: { (UIAlertAction) in self.performSegue(withIdentifier: "CrearNuevoUsuario", sender: nil)
                })
                
                let btnCancel = UIAlertAction(title: "Cancelar", style: .default, handler: { (UIAlertAction) in
                })
                
                
                alerta.addAction(btnOK)
                alerta.addAction(btnCancel)
                self.present(alerta, animated: true, completion: nil)
            }
                //SI EL CORREO EXISTE INGRESARA CORRECTAMENTE.
            else{
                print("Inicio de sesion exitoso")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
                
            
            
            /*
            if error != nil{
                print("Se presento el siguiente error: \(error)")
                Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: {
                    (user, error) in
                    print("Intentando crear un usuario")
                    if error != nil{
                        print("Se presento el siguiente error al crear el usuario: \(error)")
                    }else{
                        print("El usuario fue creado exitosamente")
                        //CODIGO PARA AGREGAR USUARIO A FIREBASE
                    Database.database().reference().child("usuarios").child(user!.user.uid).child("email").setValue(user!.user.email)
                        //ALERTA PARA QUE MUESTRE CREACION DE USUARIO
                        let alerta = UIAlertController(title: "Creacion de usuario", message: "Usuario: \(self.emailTextField.text!) se creo correctamente.", preferredStyle: .alert)
                        let btnOK = UIAlertAction(title: "Aceptar", style: .default, handler: { (UIAlertAction) in self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
                        })
                        alerta.addAction(btnOK)
                        self.present(alerta, animated: true, completion: nil)
                    }
                })
            } else{
                print("Inicio de sesion exitoso")
                self.performSegue(withIdentifier: "iniciarsesionsegue", sender: nil)
            }
            */
            
        }
    }
    
    
    @IBAction func NuevoUsuario(_ sender: Any) {
        self.performSegue(withIdentifier: "CrearNuevoUsuario", sender: nil)
    }
    
    
    @IBAction func btnGoogle(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signIn()
        
    }
}

    
    

    


