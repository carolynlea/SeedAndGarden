//
//  ModalViewController.swift
//  SeedAndGarden
//
//  Created by Carolyn Lea on 10/30/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    var seedController: SeedController?
    var seed: Seed?
    {
        didSet
        {
           updateViews()
        }
    }
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var seedImageView: UIImageView!
    @IBOutlet var numberOfPacksTextField: UITextField!
    @IBOutlet var packageSizeTextField: UITextField!
    @IBOutlet var BestByDateTextField: UITextField!
    @IBOutlet var PurchaseDateTextField: UITextField!
    @IBOutlet var purchaseFromTextField: UITextField!
    @IBOutlet var brandTextField: UITextField!
    @IBOutlet var priceTextField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        updateViews()
    }
    
    @IBAction func save(_ sender: Any)
    {
        guard let brand = brandTextField.text,
            let numPacks = numberOfPacksTextField.text,
            let pkgSize = packageSizeTextField.text,
            let bestBy = BestByDateTextField.text,
            let purchaseFrom = purchaseFromTextField.text,
            let purchaseDate = PurchaseDateTextField.text,
            let price = priceTextField.text else {return}
        let imageData: Data?
        if seed?.seedImage != nil
        {
            imageData = seed!.seedImage
            seedImageView.image = UIImage(data: imageData!)
        }
        else
        {
            imageData = nil
            seedImageView.image = UIImage(named: "placeholder")
        }
        let backgroundMoc = CoreDataStack.shared.container.newBackgroundContext()
        if let seed = seed
        {
            seedController?.updateSeed(seed: seed,
                                       name: seed.seedName ?? "",
                                       variety: seed.seedVariety ?? "",
                                       description: seed.seedDescription ?? "",
                                       seedImage: seed.seedImage ?? imageData!,
                                       sunPreference: seed.sunPreference ?? "",
                                       plantType: seed.plantType ?? "",
                                       plantingDepth: seed.plantingDepth ?? "",
                                       plantSpacing: seed.plantSpacing ?? "",
                                       plantHeight: seed.plantHeight ?? "",
                                       plantWidth: seed.plantWidth ?? "",
                                       bestZones: seed.bestZones ?? "",
                                       waterPreference: seed.waterPreference ?? "",
                                       climatePreference: seed.climatePreference ?? "",
                                       soilPreference: seed.soilPreference ?? "",
                                       seedBrand: brand,
                                       latinName: seed.latinName ?? "",
                                       purchaseFrom: purchaseFrom,
                                       bestByDate: bestBy,
                                       purchaseDate: purchaseDate,
                                       numberOfPackages: numPacks,
                                       purchasePrice: price,
                                       packageSize: pkgSize,
                                       notes: seed.seedNotes ?? "",
                                       plantCategory: seed.plantCategory ?? "",
                                       context: backgroundMoc)
        }
        else
        {
            seedController?.createSeed(name: seed?.seedName ?? "", variety: "", description: "", seedImage: imageData!, sunPreference: "", plantType: "", plantingDepth: "", plantSpacing: "", plantHeight: "", plantWidth: "", bestZones: "", waterPreference: "", climatePreference: "", soilPreference: "", seedBrand: brand, latinName: "", purchaseFrom: purchaseFrom, bestByDate: bestBy, purchaseDate: purchaseDate, numberOfPackages: numPacks, purchasePrice: price, packageSize: pkgSize, notes: seed?.seedNotes ?? "", plantCategory: "", context: backgroundMoc)
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addImage(_ sender: Any)
    {
        
    }
    
    @IBAction func dismiss(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    
    private func updateViews()
    {
        guard isViewLoaded else {return}
        
        if seed == seed
        {
            nameLabel.text = seed?.seedName
            brandTextField.text = seed?.seedBrand
            numberOfPacksTextField.text = seed?.numberOfPackages
            packageSizeTextField.text = seed?.packageSize
            BestByDateTextField.text = seed?.bestByDate
            purchaseFromTextField.text = seed?.purchaseFrom
            PurchaseDateTextField.text = seed?.purchaseDate
            priceTextField.text = seed?.purchasePrice
            seedImageView.image = UIImage(data: (seed?.seedImage)!)
        }
        
        
        
        
    }
}
