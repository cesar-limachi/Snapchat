//
//  SnapsViewController.swift
//  Snapchat
//
//  Created by Cesar Limachi on 6/9/22.
//  Copyright © 2022 empresa. All rights reserved.
//

import UIKit

class SnapsViewController: UIViewController {
    
    //MARK: - Actions
    
    @IBAction func cerrarSesionTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
