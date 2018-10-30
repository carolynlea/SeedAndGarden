//
//  PopViewController.swift
//  SeedAndGarden
//
//  Created by Carolyn Lea on 10/29/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class PopViewController: UIViewController
{
    @IBOutlet weak var popImageView: UIImageView!
    var popImage = UIImage()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        popImageView.image = popImage
    }
}
