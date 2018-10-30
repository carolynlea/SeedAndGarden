
//
//  TextViewCell.swift
//  SeedAndGarden
//
//  Created by Carolyn Lea on 10/29/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class TextViewCell: UITableViewCell
{
    @IBOutlet var textViewLabel: UILabel!
    @IBOutlet var inputTextView: UITextView!
    
    var seed:Seed?
    {
        didSet
        {
            configureDescriptionView(label: "Description:", text: seed?.seedDescription ?? "")
            configureNotesView(label: "Notes:", text: seed?.seedNotes ?? "")
            
        }
    }
    
    func configureDescriptionView(label: String, text: String)
    {
        inputTextView.text = text
        textViewLabel.text = label
    }
    
    func configureNotesView(label: String, text: String)
    {
        inputTextView.text = text
        textViewLabel.text = label
    }
    
    func adjustTextViewHeight(textview : UITextView)
    {
//        textview.translatesAutoresizingMaskIntoConstraints = true
        textview.sizeToFit()
        textview.isScrollEnabled = false
    }
    
    
    
    
}
