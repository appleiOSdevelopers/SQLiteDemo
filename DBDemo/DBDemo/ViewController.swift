//
//  ViewController.swift
//  DBDemo
//
//  Created by Asfar Hussain on 23/5/22.
//  Copyright © 2022 Asfar Hussain. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITableViewDragDelegate
{
    
    @IBOutlet weak var personTable: UITableView!
    
    let cellReuseIdentifier = "cell"
    
    var db:DBHelper = DBHelper()
    
    var persons:[Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personTable.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        personTable.delegate = self
        personTable.dataSource = self
        if #available(iOS 11.0, *) {
            personTable.dragDelegate = self
            personTable.dragInteractionEnabled = true
        } else {
            // Fallback on earlier versions
        }
        
        
        
        db.insert(id: 0, name: "Bilal", age: 24)
        db.insert(id: 0, name: "Bosh", age: 25)
        db.insert(id: 0, name: "Thor", age: 23)
        db.insert(id: 0, name: "Edward", age: 44)
        db.insert(id: 0, name: "Ronaldo", age: 34)
        
        persons = db.read()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)!
        
        cell.textLabel?.text = "Name: " + persons[indexPath.row].name + ", " + "Age: " + String(persons[indexPath.row].age)
        
        return cell
    }
    
    
    
}

