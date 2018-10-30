//
//  ListCell.swift
//  SeedAndGarden
//
//  Created by Carolyn Lea on 10/29/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell
{
    @IBOutlet var listImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var varietyLabel: UILabel!
    
    var seed: Seed?
    {
        didSet
        {
            updateViews()
        }
    }
    
    private func updateViews()
    {
        guard let seed = seed else {return}
        
        if seed.seedImage != nil
        {
            listImageView.image = UIImage(data: seed.seedImage!)
        }
        
        nameLabel.text = seed.seedName
        varietyLabel.text = seed.seedVariety
        
    }
}
