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
    var categorys = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let obj = Category()
        //obj.name = "Test"
        categorys.append(obj)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath);
        cell.textLabel?.text = categorys[indexPath.row].name
        return cell;
    }
}
