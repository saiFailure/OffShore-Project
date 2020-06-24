//
//  DataBaseManager.swift
//  OffShoresTask
//
//  Created by Sainath MAC on 03/04/1942 Saka.
//  Copyright © 1942 Sainath MAC. All rights reserved.
//

import Foundation
import CoreData

class DataBaseManager{
     // MARK: - Core Data stack

       
       // MARK: - Core Data Saving support
    
    static let manager:DataBaseManager = DataBaseManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "OffShoresTask")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    

    
    func fetchData(selctedIndex:Int?=nil,targetAction:Int?=nil) -> [OffShoreData]{
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:OffShoreData.description())
        
        do{
            
            if let daata =  try context.fetch(fetchRequest) as? [OffShoreData]{
                
                return daata
            }
            
        }catch{
            
            print("saving\(error)")
        }
        
        
        return []
        
    }
    
}
