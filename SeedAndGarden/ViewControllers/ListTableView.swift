//
//  ListTableView.swift
//  SeedAndGarden
//
//  Created by Carolyn Lea on 10/29/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class ListTableView: UITableViewController
{
    var seedController = SeedController()
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return seedController.seeds.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! ListCell

        let seed = seedController.seeds[indexPath.row]
        cell.seed = seed

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            let backgroundMoc = CoreDataStack.shared.container.newBackgroundContext()
            let seed = seedController.seeds[indexPath.row]
            seedController.deleteSeed(seed: seed, context: backgroundMoc)
            tableView.reloadData()
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let buttonsView = segue.destination as! ButtonsViewController
        buttonsView.seedController = seedController
        
        if segue.identifier == "ShowAddView"
        {
            buttonsView.title = "Add New Seed"
        }
        else if segue.identifier == "ShowEditView"
        {
            if let indexPath = tableView.indexPathForSelectedRow
            {
                buttonsView.seed = seedController.seeds[indexPath.row]
            }
        }
        
        
//        let detailView = segue.destination as! DetailTableView
//        detailView.seedController = seedController
//
//        if segue.identifier == "ShowAddView"
//        {
//           detailView.title = "Add New Item"
//        }
//        else if segue.identifier == "ShowDetailView"
//        {
//            if let indexPath = tableView.indexPathForSelectedRow
//            {
//                detailView.seed = seedController.seeds[indexPath.row]
//                detailView.title = seedController.seeds[indexPath.row].seedName
//                detailView.imageData = seedController.seeds[indexPath.row].seedImage
//
//                print(seedController.seeds[indexPath.row].seedName!, seedController.seeds[indexPath.row].seedVariety!)
//            }
//        }
    }
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
