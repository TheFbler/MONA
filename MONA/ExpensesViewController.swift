//
//  ExpensesViewController.swift
//  MONA
//
//  Created by Fabian Clasen on 23.09.20.
//  Copyright © 2020 Fabian Clasen. All rights reserved.
//

import UIKit
import CoreData

class ExpensesViewController: ContainerViewController {

    @IBOutlet weak var tableView: UITableView!
    var categorys: [NSManagedObject] = []
    var positions: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
        loadData()
        
        tableView.reloadData()
    }
    
    func loadData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
      
        let managedContext = appDelegate.persistentContainer.viewContext
      
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Category")
      
        do {
            self.categorys = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }

}

extension ExpensesViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return positions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let position = positions[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath);
        cell.textLabel?.text = position.value(forKeyPath: "name") as? String
        return cell;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.categorys.count
    }
}
