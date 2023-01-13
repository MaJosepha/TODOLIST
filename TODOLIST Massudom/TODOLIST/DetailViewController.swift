//
//  DetailViewController.swift
//  TODOLIST
//
//  Created by Josepha Massudom on 05/01/2023.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    if let todo = myData {
        
        // Ecriture de la description et du detail de la tache dans la vue de detail
            details.text = todo.description
            let format = DateFormatter()
            format.dateFormat = "dd/MM/yyyy"
            outletDate.text = format.string(from: todo.date)
        }
        else {
            details.text = "Error"
        }
    
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBOutlet weak var details: UILabel!
    
    @IBOutlet weak var outletDate: UILabel!
    
    // Creons une variable de type optionnel alimentee par le viewcontroller initial
    var myData: Todo?
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
