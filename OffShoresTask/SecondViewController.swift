//
//  SecondViewController.swift
//  OffShoresTask
//
//  Created by Sainath MAC on 02/04/1942 Saka.
//  Copyright © 1942 Sainath MAC. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var TitletextFieldOutlet: UITextField!    
    @IBOutlet weak var descriptionTextViewOutlet: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
 
    @IBAction func cancelButtonAction(_ sender: Any) {
        
        TitletextFieldOutlet.text = ""
        descriptionTextViewOutlet.text = ""
        
    }
    
    @IBAction func doneButtonAction(_ sender: Any) {
        
        let new = OffShoreData(context: DataBaseManager.manager.context)
        new.name = TitletextFieldOutlet.text ?? "None"
        new.data = descriptionTextViewOutlet.text ?? "none"
        DataBaseManager.manager.saveContext()
       
    }
    }
    


