//
//  DetailTableView.swift
//  SeedAndGarden
//
//  Created by Carolyn Lea on 10/29/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit
import CoreData
import Photos

class DetailTableView: UITableViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIViewControllerPreviewingDelegate,UITextFieldDelegate
{
    var seedController: SeedController?
    var seed: Seed?
    
    var imageCell = DetailImageCell()
    
    var nameTextField: UITextField!
    var varietyTextField: UITextField!
    var descriptionTextView: UITextView!
    var latinNameTextField: UITextField!
    var categoryTextField: UITextField!
    var typeTextField: UITextField!
    var sunTextField: UITextField!
    var depthTextField: UITextField!
    var spacingTextField: UITextField!
    var heightTextField: UITextField!
    var widthTextField: UITextField!
    var zoneTextField: UITextField!
    var waterTextField: UITextField!
    var soilTextField: UITextField!
    var climateTextField: UITextField!
    var brandTextField: UITextField!
    var purchaseFromTextField: UITextField!
    var purchaseDateTextField: UITextField!
    var bestByDateTextField: UITextField!
    var numberOfPackagesTextField: UITextField!
    var purchasePriceTextField: UITextField!
    var packageSizeTextField: UITextField!
    var notesTextView: UITextView!
    var imageData: Data?
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        tableView.reloadData()
        print("seed = \(String(describing: seed?.seedName))")
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        guard traitCollection.forceTouchCapability == .available else { return }
        registerForPreviewing(with: self, sourceView: tableView)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 24
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.row == 0
        {
            imageCell = tableView.dequeueReusableCell(withIdentifier: "DetailImageCell") as! DetailImageCell
            if imageData != nil
            {
                imageCell.detailImageView.image = UIImage(data: imageData!)
            }
            else
            {
                imageCell.detailImageView.image = UIImage(named: "placeholder")
            }
            return imageCell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailCell
        
        if indexPath.row == 1
        {
            
            nameTextField = cell.inputTextField
            cell.inputTextField.delegate = self
            cell.configureNameView(label: "Name:", text: seed?.seedName ?? "")
            
            
        }
        if indexPath.row == 2
        {
            
            varietyTextField = cell.inputTextField
            cell.inputTextField.delegate = self
            cell.configureVarietyView(label: "Variety", text: seed?.seedVariety ?? "")
            
        }
        
        if indexPath.row == 3
        {
           
            latinNameTextField = cell.inputTextField
            cell.inputTextField.delegate = self
            cell.configureLatinNameView(label: "Latin Name:", text: seed?.latinName ?? "")
            
        }
        
        if indexPath.row == 4
        {
            
            categoryTextField = cell.inputTextField
            cell.inputTextField.delegate = self
            cell.configureCategoryView(label: "Plant Category:", text: seed?.plantCategory ?? "")
            
        }
        
        if indexPath.row == 5
        {
           
            typeTextField = cell.inputTextField
            cell.inputTextField.delegate = self
            cell.configureTypeView(label: "Plant Type:", text: seed?.plantType ?? "")
            
        }
        
        if indexPath.row == 6
        {
            
            zoneTextField = cell.inputTextField
            cell.inputTextField.delegate = self
            cell.configureZoneView(label: "Best Zones:", text: seed?.bestZones ?? "")
            
        }
        
        if indexPath.row == 7
        {
           
            climateTextField = cell.inputTextField
            cell.inputTextField.delegate = self
            cell.configureClimateView(label: "Climate Preference:", text: seed?.climatePreference ?? "")
           
        }
        
        if indexPath.row == 8
        {
            
            sunTextField = cell.inputTextField
            cell.inputTextField.delegate = self
            cell.configureSunView(label: "Sun Preference:", text: seed?.sunPreference ?? "")
            
        }
        
        if indexPath.row == 9
        {
            
            soilTextField = cell.inputTextField
            cell.inputTextField.delegate = self
            cell.configureSoilView(label: "Soil Preference:", text: seed?.soilPreference ?? "")
           
        }
        
        if indexPath.row == 10
        {
            
            waterTextField = cell.inputTextField
            cell.inputTextField.delegate = self
            cell.configureWaterView(label: "Water Preference:", text: seed?.waterPreference ?? "")
            
        }
        
        if indexPath.row == 11
        {
            
            heightTextField = cell.inputTextField
            cell.inputTextField.delegate = self
            cell.configureHeightView(label: "Plant Height:", text: seed?.plantHeight ?? "")
            
        }
        
        if indexPath.row == 12
        {
            
            widthTextField = cell.inputTextField
            cell.inputTextField.delegate = self
            cell.configureWidthView(label: "Plant Width:", text: seed?.plantWidth ?? "")
           
        }
        
        if indexPath.row == 13
        {
            
            depthTextField = cell.inputTextField
            cell.inputTextField.delegate = self
            cell.configureDepthView(label: "Planting Depth:", text: seed?.plantingDepth ?? "")
           
        }
        
        if indexPath.row == 14
        {
           
            spacingTextField = cell.inputTextField
            cell.inputTextField.delegate = self
            cell.configureSpacingView(label: "Plant Spacing:", text: seed?.plantSpacing ?? "")
            
        }
        
        if indexPath.row == 15
        {
            
            brandTextField = cell.inputTextField
            cell.inputTextField.delegate = self
            cell.configureBrandView(label: "Seed Brand:", text: seed?.seedBrand ?? "")
           
        }
        
        if indexPath.row == 16
        {
            
            purchaseFromTextField = cell.inputTextField
            cell.inputTextField.delegate = self
            cell.configurePurchaseFromView(label: "Purchased From:", text: seed?.purchaseFrom ?? "")
           
        }
        
        if indexPath.row == 17
        {
            
            purchaseDateTextField = cell.inputTextField
            cell.inputTextField.delegate = self
            cell.configurePurchaseDateView(label: "Purchase Date:", text: seed?.purchaseDate ?? "")
            
        }
        
        if indexPath.row == 18
        {
            
            bestByDateTextField = cell.inputTextField
            cell.inputTextField.delegate = self
            cell.configureBestByDateView(label: "Best By Date:", text: seed?.bestByDate ?? "")
           
        }
        
        if indexPath.row == 19
        {
            
            purchasePriceTextField = cell.inputTextField
            cell.inputTextField.delegate = self
            cell.configurePriceView(label: "Price Paid:", text: seed?.purchasePrice ?? "")
            
        }
        
        if indexPath.row == 20
        {
            
            packageSizeTextField = cell.inputTextField
            cell.inputTextField.delegate = self
            cell.configurePackageSizeView(label: "Package Size:", text: seed?.packageSize ?? "")
           
        }
        
        if indexPath.row == 21
        {
            
            numberOfPackagesTextField = cell.inputTextField
            cell.inputTextField.delegate = self
            cell.configureNumberOfPacksView(label: "Number of Packages:", text: seed?.numberOfPackages ?? "")
            
        }
        
        if indexPath.row == 22
        {
            let descriptionCell = tableView.dequeueReusableCell(withIdentifier: "TextViewCell") as! TextViewCell
            descriptionCell.inputTextView.delegate = self
            descriptionTextView = descriptionCell.inputTextView
            descriptionCell.configureDescriptionView(label: "Description:", text: seed?.seedDescription ?? "")
            descriptionCell.adjustTextViewHeight(textview: descriptionTextView)
            return descriptionCell
        }
        
        if indexPath.row == 23
        {
            let notesCell = tableView.dequeueReusableCell(withIdentifier: "TextViewCell") as! TextViewCell
            notesCell.inputTextView.delegate = self
            notesTextView = notesCell.inputTextView
            notesCell.configureNotesView(label: "Notes", text: seed?.seedNotes ?? "")
            notesCell.adjustTextViewHeight(textview: notesTextView)
            return notesCell
        }
        
        
        return cell
        //return UITableViewCell()
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if indexPath.row == 0
        {
            return 136
        }
        else
        {
           return 25
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if indexPath.row == 0
        {
            return 136
        }
        else if indexPath.row == 22 || indexPath.row == 23
        {
           return UITableView.automaticDimension
        }
        else
        {
            return 25
        }
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    var previousRect = CGRect.zero
    func textViewDidChange(_ textView: UITextView)
    {
        tableView.beginUpdates()
        let pos = textView.endOfDocument
        let currentRect = textView.caretRect(for: pos)
        self.previousRect = self.previousRect.origin.y == 0.0 ? currentRect : previousRect
        if(currentRect.origin.y > previousRect.origin.y)
        {
            print("Started New Line")
        }
        previousRect = currentRect
        tableView.endUpdates()
    }
    
    @IBAction func save(_ sender: Any)
    {
        guard let name = nameTextField.text,
            let variety = varietyTextField.text,
            let description = descriptionTextView.text,
            let image = imageData,
            let sun = sunTextField.text,
            let plantType = typeTextField.text,
            let depth = depthTextField.text,
            let spacing = spacingTextField.text,
            let height = heightTextField.text,
            let width = widthTextField.text,
            let zones = zoneTextField.text,
            let water = waterTextField.text,
            let climate = climateTextField.text,
            let soil = soilTextField.text,
            let brand = brandTextField.text,
            let latinName = latinNameTextField.text,
            let purchaseFrom = purchaseFromTextField.text,
            let bestByDate = bestByDateTextField.text,
            let purchaseDate = purchaseDateTextField.text,
            let numberPackages = numberOfPackagesTextField.text,
            let price = purchasePriceTextField.text,
            let packageSize = packageSizeTextField.text,
            let notes = notesTextView.text,
            let category = categoryTextField.text else {return}
            let backgroundMoc = CoreDataStack.shared.container.newBackgroundContext()
        
        if seed == nil
        {
            seedController?.createSeed(name: name, variety: variety, description: description, seedImage: image, sunPreference: sun, plantType: plantType, plantingDepth: depth, plantSpacing: spacing, plantHeight: height, plantWidth: width, bestZones: zones, waterPreference: water, climatePreference: climate, soilPreference: soil, seedBrand: brand, latinName: latinName, purchaseFrom: purchaseFrom, bestByDate: bestByDate, purchaseDate: purchaseDate, numberOfPackages: numberPackages, purchasePrice: price, packageSize: packageSize, notes: notes, plantCategory: category, context: backgroundMoc)
        }
        else
        {
            seedController?.updateSeed(seed: seed!, name: name, variety: variety, description: description, seedImage: image, sunPreference: sun, plantType: plantType, plantingDepth: depth, plantSpacing: spacing, plantHeight: height, plantWidth: width, bestZones: zones, waterPreference: water, climatePreference: climate, soilPreference: soil, seedBrand: brand, latinName: latinName, purchaseFrom: purchaseFrom, bestByDate: bestByDate, purchaseDate: purchaseDate, numberOfPackages: numberPackages, purchasePrice: price, packageSize: packageSize, notes: notes, plantCategory: category, context: backgroundMoc)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - ImagePicker
    
    @IBAction func addDetailImage(_ sender: Any)
    {
        checkPhotoPermission()
        PHPhotoLibrary.requestAuthorization { (status) in
            guard status == .authorized else {
                NSLog("go to settings to allow access")
                return
            }
            print("photo access authorized")
            DispatchQueue.main.async {
                self.showImageAlert()
                //self.presentImagePickerController()
            }
        }
    }
    
    func checkPhotoPermission()
    {
        PHPhotoLibrary.requestAuthorization { (status) in
            
            let status = PHPhotoLibrary.authorizationStatus()
            switch status {
            case .authorized:
                print("authorized")
            case .notDetermined:
                PHPhotoLibrary.requestAuthorization() { status in
                    if status == .authorized {
                        DispatchQueue.main.async {
                            self.presentImagePickerController()
                        }
                    }
                }
            case .restricted:
                // do nothing
                break
            case .denied:
                // do nothing, or beg the user to authorize us in Settings
                break
            }
        }
    }
    
    func showImageAlert()
    {
        let alert = UIAlertController(title: "Add a Picture", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { action in
            self.presentCameraImagePickerController()
        }))
        alert.addAction(UIAlertAction(title: "PhotoLibrary", style: .default, handler: { action in
            self.presentPhotoLibraryImagePickerController()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    private func presentImagePickerController()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary)
        {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            imagePicker.delegate = self
            
            present(imagePicker, animated: true, completion: nil)
        }
        else if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)
        {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            imagePicker.delegate = self
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    private func presentPhotoLibraryImagePickerController()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary)
        {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            imagePicker.delegate = self
            
            present(imagePicker, animated: true, completion: nil)
        }
        
    }
    
    private func presentCameraImagePickerController()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)
        {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            imagePicker.delegate = self
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        picker.dismiss(animated: true, completion: nil)
        
        guard let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {return}
        
        imageCell.detailImageView.contentMode = .scaleAspectFill
        imageCell.detailImageView.image = chosenImage
        
        if let data = chosenImage.jpegData(compressionQuality: 0.8)
        {
            imageData = data
            print("data = \(imageData!)")
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        picker.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Peek and Pop
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController?
    {
        guard let indexPath = tableView?.indexPathForRow(at: location) else { return nil }
        guard let cell = tableView.cellForRow(at: indexPath) else { return nil }
        guard let popVC = storyboard?.instantiateViewController(withIdentifier: "popView") as? PopViewController else { return nil }
        
        let peekImage = UIImage(data: imageData!)
        popVC.popImage = peekImage!
        
        //Set your Peek height
        popVC.preferredContentSize = CGSize(width: view.bounds.size.width, height: view.bounds.size.height)
        previewingContext.sourceRect = cell.frame
        return popVC
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController)
    {
        // Present or push the view controller
        show(viewControllerToCommit, sender: self)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
    }

    // MARK: - Textfield delegates
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        textField.layer.borderColor = UIColor(red: 254.0/255.0, green: 101.0/255.0, blue: 129.0/255.0, alpha: 1.0).cgColor
        textField.layer.cornerRadius = 5
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1.0
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        textField.layer.borderColor = UIColor(red: 186.0/255.0, green: 186.0/255.0, blue: 186.0/255.0, alpha: 0.6).cgColor
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 0.5
    }
//
//    func showAlert()
//    {
//        let alert = UIAlertController(title: "Add a comment", message: "Write your comment below:", preferredStyle: .alert)
//
//        var commentTextField: UITextField?
//
//        alert.addTextField { (textField) in
//            textField.placeholder = "Comment:"
//            commentTextField = textField
//        }
//
//        let addCommentAction = UIAlertAction(title: "Add Comment", style: .default) { (_) in
//
//            guard let commentText = commentTextField?.text else { return }
//
//            self.saveOrUpdate()
//
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
//
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//
//        alert.addAction(addCommentAction)
//        alert.addAction(cancelAction)
//
//        present(alert, animated: true, completion: nil)
//    }
//
//
//    func saveOrUpdate()
//    {
//        guard let name = nameTextField.text,
//            let variety = varietyTextField.text,
//            let description = descriptionTextView.text,
//            let image = imageData,
//            let sun = sunTextField.text,
//            let plantType = typeTextField.text,
//            let depth = depthTextField.text,
//            let spacing = spacingTextField.text,
//            let height = heightTextField.text,
//            let width = widthTextField.text,
//            let zones = zoneTextField.text,
//            let water = waterTextField.text,
//            let climate = climateTextField.text,
//            let soil = soilTextField.text,
//            let brand = brandTextField.text,
//            let latinName = latinNameTextField.text,
//            let purchaseFrom = purchaseFromTextField.text,
//            let bestByDate = bestByDateTextField.text,
//            let purchaseDate = purchaseDateTextField.text,
//            let numberPackages = numberOfPackagesTextField.text,
//            let price = purchasePriceTextField.text,
//            let packageSize = packageSizeTextField.text,
//            let notes = notesTextView.text,
//            let category = categoryTextField.text else {return}
//        let backgroundMoc = CoreDataStack.shared.container.newBackgroundContext()
//
//        if seed == nil
//        {
//            seedController?.createSeed(name: name, variety: variety, description: description, seedImage: image, sunPreference: sun, plantType: plantType, plantingDepth: depth, plantSpacing: spacing, plantHeight: height, plantWidth: width, bestZones: zones, waterPreference: water, climatePreference: climate, soilPreference: soil, seedBrand: brand, latinName: latinName, purchaseFrom: purchaseFrom, bestByDate: bestByDate, purchaseDate: purchaseDate, numberOfPackages: numberPackages, purchasePrice: price, packageSize: packageSize, notes: notes, plantCategory: category, context: backgroundMoc)
//        }
//        else
//        {
//            seedController?.updateSeed(seed: seed!, name: name, variety: variety, description: description, seedImage: image, sunPreference: sun, plantType: plantType, plantingDepth: depth, plantSpacing: spacing, plantHeight: height, plantWidth: width, bestZones: zones, waterPreference: water, climatePreference: climate, soilPreference: soil, seedBrand: brand, latinName: latinName, purchaseFrom: purchaseFrom, bestByDate: bestByDate, purchaseDate: purchaseDate, numberOfPackages: numberPackages, purchasePrice: price, packageSize: packageSize, notes: notes, plantCategory: category, context: backgroundMoc)
//        }
//    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
