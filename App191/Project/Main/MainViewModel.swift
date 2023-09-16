//
//  MainViewModel.swift
//  App191
//
//  Created by Вячеслав on 9/14/23.
//

import SwiftUI
import CoreData

final class MainViewModel: ObservableObject {
    
    @Published var transes: [MainModel] = []
    
    @Published var categories: [String] = ["Expenses", "Savings"]
    @Published var current_category: String = "Expenses"
    
    @Published var name: String = ""
    @Published var sum: String = ""
    
    @Published var isAdd: Bool = false
    @Published var isMenu: Bool = false
    
    func addTrans(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "MainModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let trans = NSEntityDescription.insertNewObject(forEntityName: "MainModel", into: context) as! MainModel
        
        trans.sum = Int16(sum) ?? 0
        trans.name = name
        trans.category = current_category
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func fetchTranses() {
        
        CoreDataStack.shared.modelName = "MainModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<MainModel>(entityName: "MainModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.transes = branch.filter{$0.category == self.current_category}
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.transes = []
        }
    }
}
