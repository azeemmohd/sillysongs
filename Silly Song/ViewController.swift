//
//  ViewController.swift
//  Silly Song
//
//  Created by Azeem Mohammad on 01/07/17.
//  Copyright © 2017 Azeem Mohammad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var lyricsView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reset(_ sender: Any) {
        
        nameField.text = ""
        lyricsView.text = ""
        
        
    }

    
    
    @IBAction func displayLyrics(_ sender: Any) {
        
        if(nameField.text!.isEmpty) {
            nameField.text = "May be your forgot to enter your name?"
            return;
        }
        
        lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
        
    }
    
    
}


let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")


func shortNameFromName(nameToShorten name: String) -> String{
    let lowercaseName = name.lowercased()
    var result : String = lowercaseName
    let vowelSet = CharacterSet(charactersIn: "aeiou")
    if let hasVowels = lowercaseName.rangeOfCharacter(from: vowelSet) {
        let lowerBound = hasVowels.lowerBound
        result = lowercaseName.substring(from: lowerBound)
    }
    return result
    
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    
    var lyrics : String = lyricsTemplate
    lyrics = lyrics.replacingOccurrences(of: "<FULL_NAME>", with: fullName)
    lyrics = lyrics.replacingOccurrences(of: "<SHORT_NAME>", with: shortNameFromName(nameToShorten: fullName))
    
    return lyrics
    
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}


