//
//  CCManager.swift
//  ResistorCodeCalculator
//
//  Created by Five Admin on 6/21/19.
//  Copyright © 2019 Five Admin. All rights reserved.
//

import Foundation
import CoreData
import UIKit
class CDManager {
    
    func createData(value: String, color1: UIColor, color2: UIColor, color3: UIColor, color4: UIColor
        , color5: UIColor, color6: UIColor){
        
        //remove duplicates
        let allData = retrieveData()
        for existingResistor in allData{
            if (existingResistor.value).elementsEqual(value){ return }
        }
        
        //As we know that container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //Now let’s create an entity and new user records.
        let userEntity = NSEntityDescription.entity(forEntityName: "Resistor", in: managedContext)!
        
        //final, we need to add some data to our newly created record for each keys using
        //here adding 5 data with loop
        

        let resistor = NSManagedObject(entity: userEntity, insertInto: managedContext)
        resistor.setValue(value, forKey: "value")
        resistor.setValue(color1, forKey: "color1")
        resistor.setValue(color2, forKey: "color2")
        resistor.setValue(color3, forKey: "color3")
        resistor.setValue(color4, forKey: "color4")
        resistor.setValue(color5, forKey: "color5")
        resistor.setValue(color6, forKey: "color6")
    
    
        //Now we have set all the values. The next step is to save them inside the Core Data
        
        do {
            try managedContext.save()
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
    
    
    
    func retrieveData()-> Array<ResistorClass> {
        
        //As we know that container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return []}
        
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //Prepare the request of type NSFetchRequest  for the entity
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Resistor")
        
        //        fetchRequest.fetchLimit = 1
        //        fetchRequest.predicate = NSPredicate(format: "username = %@", "Ankur")
              fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "value", ascending: false)]
        //
        do {
            let result = try managedContext.fetch(fetchRequest)
            var resistorsClass: Array<ResistorClass> = []
            
            for data in result as! [NSManagedObject] {
                let resistorOne = ResistorClass(value: data.value(forKey: "value") as! String,
                                                color1: data.value(forKey: "color1") as! UIColor,
                                                color2: data.value(forKey: "color2") as! UIColor,
                                                color3: data.value(forKey: "color3") as! UIColor,
                                                color4: data.value(forKey: "color4") as! UIColor,
                                                color5: data.value(forKey: "color5") as! UIColor,
                                                color6: data.value(forKey: "color6") as! UIColor)
                resistorsClass.append(resistorOne)
            }
            
            return resistorsClass
        } catch {
            
            print("Failed")
        }
        return []
    }
    /*
    func updateData(){
        
        //As we know that container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Resistor")
        fetchRequest.predicate = NSPredicate(format: "value = %@", "Ankur1")
        do
        {
            let test = try managedContext.fetch(fetchRequest)
            
            let objectUpdate = test[0] as! NSManagedObject
            objectUpdate.setValue("valueNew", forKey: "value")
            objectUpdate.setValue("color1", forKey: "color1")
            objectUpdate.setValue("color2", forKey: "color2")
            do{
                try managedContext.save()
            }
            catch
            {
                print(error)
            }
        }
        catch
        {
            print(error)
        }
        
    }*/
    
    func deleteData(valueOfResistor: String){
        
        //As we know that container is set up in the AppDelegates so we need to refer that container.
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        //We need to create a context from this container
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Resistor")
        fetchRequest.predicate = NSPredicate(format: "value = %@", valueOfResistor)
        
        do
        {
            let test = try managedContext.fetch(fetchRequest)
            
            let objectToDelete = test[0] as! NSManagedObject
            managedContext.delete(objectToDelete)
            
            do{
                try managedContext.save()
            }
            catch
            {
                print(error)
            }
            
        }
        catch
        {
            print(error)
        }
    }
    
}
