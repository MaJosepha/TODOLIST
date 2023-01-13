//
//  ViewController.swift
//  TODOLIST
//
//  Created by Josepha Massudom on 23/11/2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    // Creation du tableau de type Todo
    
    var myData = [ Todo(nom: "Acheter du lait", description: "Lait, biscuits, cereales, saucisses", date: Date()),
                   Todo(nom: "Reviser", description: "Prog mobile, CCNA2, Transmission d'info", date: Date()) ,
                   Todo(nom: "Appeler la famille", description: "Maman, papa, Roxanne, Lex", date: Date()),
                   Todo(nom: "Aller courir", description: "Avec Tony et Steve", date: Date()) ,
                   Todo(nom: "Dormir", description: "6h de temps", date: Date())
                       ]
    
    // Nouveau tableau Todo pour le tri en fonction de la date
    
    var myNewData = [Todo]()
    
    
    
    // Fonctions du protocole UITableViewDatasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return myData.count
        return myNewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath) as! TodoTableViewCell
        let row = indexPath.row
        if row%2 == 0 {
            cell.backgroundColor = UIColor.systemGray6
        }else{
            cell.backgroundColor =  UIColor.white
        }
        
        cell.nom.text = myNewData [row].nom
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.dataSource = self
        myTableView.delegate = self
        
        
        myData = myData.sorted(by: {$0.date < $1.date})
        myNewData = myData
        
    }

    // Pour supprimer une tache de notre todolist
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let configuration = UISwipeActionsConfiguration(actions: [UIContextualAction(style: .destructive, title: "Supprimer", handler: { (action, view, completionHandler) in
            let row = indexPath.row
           // self.myData.remove(at: row)
            self.myNewData.remove(at: row)
            completionHandler(true)
            self.myTableView.reloadData()
            
        
        })
                                                                  
                                                                 ])
        return configuration
    }
    
    
    
    // Recuperons via la var vc le view controller de destination (Detailviewcontroller)
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailViewController {
            let row = myTableView.indexPathForSelectedRow!.row
            //vc.myData = myData[row]
            vc.myData = myNewData[row]
        }
        
        
    }
    
    //Fonction pour annuler la creation d'une tache et sortir de la vue
    
    @IBAction func cancel (_ unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? EditViewController {
            vc.dismiss(animated: true, completion: nil)
            print("cancel")
        }
    }
    
    // Fonction pour enregistrer une nouvelle tache
    @IBAction func save(_ unwindSegue: UIStoryboardSegue) {
        if let vc = unwindSegue.source as? EditViewController {
            if let updatedTodo = vc.myData {
                
                
                myData.append(updatedTodo)
                
    // Tri en fonction de la date
                
                myData = myData.sorted(by: {$0.date < $1.date})
                myNewData = myData
                myTableView.reloadData()
                
            }
            else{
                print("Data nexiste pas")
            }
        }
    }
    
   
    
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    
    
    
    
    
}

