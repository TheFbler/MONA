//
//  CategoryDetailViewController.swift
//  MONA
//
//  Created by Fabian Clasen on 30.09.20.
//  Copyright © 2020 Fabian Clasen. All rights reserved.
//

import UIKit
import CoreData

class CategoryDetailViewController: UIViewController {
    
    @IBOutlet weak var categoryName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveCategory(_ sender: UIButton) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
          
        let managedContext = appDelegate.persistentContainer.viewContext
            
        let entity = NSEntityDescription.entity(forEntityName: "Category", in: managedContext)!
          
        let category = NSManagedObject(entity: entity, insertInto: managedContext)
          
        category.setValue(categoryName.text, forKeyPath: "name")
          
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
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
