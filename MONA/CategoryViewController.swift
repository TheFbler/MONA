//
//  CategoryViewController.swift
//  MONA
//
//  Created by Fabian Clasen on 23.09.20.
//  Copyright © 2020 Fabian Clasen. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: ContainerViewController {

    @IBOutlet weak var tableView: UITableView!
    var categorys: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("Test")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
        loadData()
    }
    
    func loadData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
      
        let managedContext = appDelegate.persistentContainer.viewContext
      
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Category")
      
        do {
            categorys = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
}

extension CategoryViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categorys.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = categorys[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath);
        cell.textLabel?.text = category.value(forKeyPath: "name") as? String
        return cell;
    }
}
