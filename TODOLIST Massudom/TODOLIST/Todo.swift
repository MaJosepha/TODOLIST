//
//  Todo.swift
//  TODOLIST
//
//  Created by Josepha Massudom on 23/11/2022.
//

import Foundation
public class Todo {
    
    // Attributs de notre tache
    
    var nom: String
    var description: String
    var date: Date
    
    
    init(nom: String, description: String, date: Date){
        self.nom = nom
        self.description = description
        self.date = date
    }
}
