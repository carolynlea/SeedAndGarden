//
//  ButtonsViewController.swift
//  SeedAndGarden
//
//  Created by Carolyn Lea on 10/30/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class ButtonsViewController: UIViewController
{
    @IBOutlet var coverImageView: UIImageView!
    @IBOutlet var nameTextView: UITextField!
    @IBOutlet var varietyTextField: UITextField!
    @IBOutlet var latinTextField: UITextField!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var varietyLabel: UILabel!
    @IBOutlet var latinLabel: UILabel!
    
    var seedController: SeedController?
    var seed: Seed?
    {
        didSet
        {
            updateViews()
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        updateViews()
        
    }
    
    @IBAction func addImage(_ sender: Any)
    {
        
    }
    
    @IBAction func save(_ sender: Any)
    {
        
    }
    
    
    @IBAction func showPlantInfoView(_ sender: Any)
    {
        
    }
    
    @IBAction func showPurchaseView(_ sender: Any)
    {
        
    }
    
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
        let modalView = segue.destination as! ModalViewController
        modalView.seedController = seedController
        modalView.seed = seed
        
    }
    
    private func updateViews()
    {
        guard isViewLoaded else {return}
        
        if seed == seed
        {
            nameTextView.text = seed?.seedName
            varietyTextField.text = seed?.seedVariety
            latinTextField.text = seed?.latinName
            coverImageView.image = UIImage(data: (seed?.seedImage)!)
        }
    }
    
    
    
    
    
    
    
    
    
    
}
