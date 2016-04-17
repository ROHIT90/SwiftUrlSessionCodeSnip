//
//  ViewController.swift
//  urlConnection
//
//  Created by rohit FNU on 4/17/16.
//  Copyright © 2016 rohit FNU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "http://swapi.co/api/people/1/"
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: urlString)!
        
        session.dataTaskWithURL(url) { (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void in
            if let responseData = data {
                do{
                    let json = try NSJSONSerialization.JSONObjectWithData(responseData, options:NSJSONReadingOptions.AllowFragments)
                    
                    if let dict = json as? Dictionary<String, AnyObject>{
                        
                        if let name = dict["name"] as? String, let height = dict["height"] as? String, let birth = dict["birth_year"] as? String, let hairColor = dict ["hair_color"] as? String {
                        let person = Person (name: name, height: height, birthYear: birth, hairColor: hairColor)
                            print(person.name)
                            print(person.bithYear)
                            print(person.hairColor)
                            print(person.height)
                        
                        }
                    }
                    print(json)
                }catch{
                    
                }
            }
        }.resume()
    }
    
    
    
    
}



