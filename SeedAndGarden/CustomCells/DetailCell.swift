//
//  DetailCell.swift
//  SeedAndGarden
//
//  Created by Carolyn Lea on 10/29/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell
{
    @IBOutlet var inputLabel: UILabel!
    @IBOutlet var inputTextField: UITextField!

    var seed: Seed?
    {
        didSet
        {
        }
    }
    
    override func prepareForReuse()
    {
        inputTextField.text = ""
        inputLabel.text = ""
    }
    
    func configureNameView(label: String, text: String)
    {
        inputLabel.text = label
        inputTextField.text = text
        if inputTextField.text == ""
        {
            inputTextField.placeholder = "Add Name of Seed or Plant"
        }
    }
    
    func configureVarietyView(label: String, text: String)
    {
        inputLabel.text = label
        inputTextField.text = text
        if inputTextField.text == ""
        {
            inputTextField.placeholder = "Add Variety"
        }
    }
    
    func configureLatinNameView(label: String, text: String)
    {
        inputLabel.text = label
        inputTextField.text = text
        if inputTextField.text == ""
        {
            inputTextField.placeholder = "Add Latin Name"
        }
    }
    
    func configureCategoryView(label: String, text: String)
    {
        inputLabel.text = label
        inputTextField.text = text
        if inputTextField.text == ""
        {
            inputTextField.placeholder = "Add Plant Category"
        }
    }
    
    func configureTypeView(label: String, text: String)
    {
        inputLabel.text = label
        inputTextField.text = text
        if inputTextField.text == ""
        {
            inputTextField.placeholder = "Add Plant Type"
        }
    }
    
    func configureSunView(label: String, text: String)
    {
        inputLabel.text = label
        inputTextField.text = text
        if inputTextField.text == ""
        {
            inputTextField.placeholder = "Add Sun Preference"
        }
    }
    
    func configureDepthView(label: String, text: String)
    {
        inputLabel.text = label
        inputTextField.text = text
        if inputTextField.text == ""
        {
            inputTextField.placeholder = "Add Seed Planting Depth"
        }
    }
    
    func configureSpacingView(label: String, text: String)
    {
        inputLabel.text = label
        inputTextField.text = text
        if inputTextField.text == ""
        {
            inputTextField.placeholder = "Add Plant Spacing"
        }
    }
    
    func configureHeightView(label: String, text: String)
    {
        inputLabel.text = label
        inputTextField.text = text
        if inputTextField.text == ""
        {
            inputTextField.placeholder = "Add Height of Mature Plant"
        }
    }
    
    func configureWidthView(label: String, text: String)
    {
        inputLabel.text = label
        inputTextField.text = text
        if inputTextField.text == ""
        {
            inputTextField.placeholder = "Add Width of Mature Plant"
        }
    }
    
    func configureZoneView(label: String, text: String)
    {
        inputLabel.text = label
        inputTextField.text = text
        if inputTextField.text == ""
        {
            inputTextField.placeholder = "Add Best Zones for Growing"
        }
    }
    
    func configureWaterView(label: String, text: String)
    {
        inputLabel.text = label
        inputTextField.text = text
        if inputTextField.text == ""
        {
            inputTextField.placeholder = "Add Watering Preference"
        }
    }
    
    func configureSoilView(label: String, text: String)
    {
        inputLabel.text = label
        inputTextField.text = text
        if inputTextField.text == ""
        {
            inputTextField.placeholder = "Add Soil Preference"
        }
    }
    
    func configureClimateView(label: String, text: String)
    {
        inputLabel.text = label
        inputTextField.text = text
        if inputTextField.text == ""
        {
            inputTextField.placeholder = "Add Preferred Climate"
        }
    }
    
    func configureBrandView(label: String, text: String)
    {
        inputLabel.text = label
        inputTextField.text = text
        if inputTextField.text == ""
        {
            inputTextField.placeholder = "Add Seed or Plant Brand"
        }
    }
    
    func configurePurchaseFromView(label: String, text: String)
    {
        inputLabel.text = label
        inputTextField.text = text
        if inputTextField.text == ""
        {
            inputTextField.placeholder = "Add Purchase Place"
        }
    }
    
    func configurePurchaseDateView(label: String, text: String)
    {
        inputLabel.text = label
        inputTextField.text = text
        if inputTextField.text == ""
        {
            inputTextField.placeholder = "Add Purchase Date"
        }
    }
    
    func configureBestByDateView(label: String, text: String)
    {
        inputLabel.text = label
        inputTextField.text = text
        if inputTextField.text == ""
        {
            inputTextField.placeholder = "Add 'Best When Purchased By' Date"
        }
    }
    
    func configureNumberOfPacksView(label: String, text: String)
    {
        inputLabel.text = label
        inputTextField.text = text
        if inputTextField.text == ""
        {
            inputTextField.placeholder = "Add Number of Packages"
        }
    }
    
    func configurePriceView(label: String, text: String)
    {
        inputLabel.text = label
        inputTextField.text = text
        if inputTextField.text == ""
        {
            inputTextField.placeholder = "Add Cost of Seeds"
        }
    }
    
    func configurePackageSizeView(label: String, text: String)
    {
        inputLabel.text = label
        inputTextField.text = text
        if inputTextField.text == ""
        {
            inputTextField.placeholder = "Add Package Size"
        }
    }
    
    
}
