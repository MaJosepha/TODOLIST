//
//  EditViewController.swift
//  TODOLIST
//
//  Created by Josepha Massudom  on 08/01/2023.
//

import UIKit

class EditViewController: UIViewController,UITextFieldDelegate  {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let todoo = myData {
            
            name.text = todoo.nom
            descript.text = todoo.description
        }
        
        name.delegate = self
        descript.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        myData!.nom = name.text!
        myData!.description = descript.text!
        return true
        
    }
    
    
    //Fonction pour ajouter une tache avec un nom, une description et une date dans notre vue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
        myData  = Todo (nom: name.text!, description: descript.text!, date: date.date)
    }
    
    
    
    
    
    var myData: Todo?
    
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var descript: UITextField!
    
    @IBOutlet weak var date: UIDatePicker!
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
