//
//  ElegirUsuarioViewController.swift
//  Snapchat
//
//  Created by Cesar Limachi on 6/9/22.
//  Copyright © 2022 empresa. All rights reserved.
//

import UIKit
import Firebase

class ElegirUsuarioViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    //MARK: - Outlets
    
    @IBOutlet weak var listaUsuarios: UITableView!
    //MARK: - Variables
    var usuarios:[Usuario] = []
    
    override func viewDidLoad() {
          super.viewDidLoad()
          listaUsuarios.delegate = self
          listaUsuarios.dataSource = self
        Database.database().reference().child("usuarios").observe(DataEventType.childAdded, with: {(snapshot) in print(snapshot)
            
            let usuario = Usuario()
            usuario.email = (snapshot.value as! NSDictionary)["email" ] as! String
            usuario.uid  = snapshot.key
            self.usuarios.append(usuario)
            self.listaUsuarios.reloadData()
        
        })
      }
    
    //MARK: - Funciones de Tableview
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usuarios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let usuario = usuarios[indexPath.row]
        cell.textLabel?.text = usuario.email
        return cell
    }
    
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
