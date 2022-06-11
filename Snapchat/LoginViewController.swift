//
//  LoginViewController.swift
//  Snapchat
//
//  Created by Cesar Limachi on 6/3/22.
//  Copyright © 2022 empresa. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

extension iniciarSesionViewController: GIDSignInDelegate{
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error{
            print("Error because \(error.localizedDescription)")
            return
        }
        
        guard let auth = user.authentication else {return}
        let credentials = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
        
        Auth.auth().signIn(with: credentials){ (authResult, error) in
            if let error = error{
                print("Error because \(error.localizedDescription)")
                return
            }
        }
    }
    
    
}
/*
extension CreateUserViewController: GIDSignInDelegate{
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error{
            print("Error because \(error.localizedDescription)")
            return
        }
        
        guard let auth = user.authentication else {return}
        let credentials = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
        
        Auth.auth().signIn(with: credentials){ (authResult, error) in
            if let error = error{
                print("Error because \(error.localizedDescription)")
                return
            }
        }
    }
    
    
}
*/
