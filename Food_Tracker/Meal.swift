//
//  Meal.swift
//  Food_Tracker
//
//  Created by Ilja Patrushev on 24.9.2020.
//  Copyright © 2020 Ilja Patrushev. All rights reserved.
//

import UIKit
import os.log

class Meal: NSObject, NSCoding {
    // MARK: Props
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    
    
    //MARK: Types
    
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
    }
    
    //MARK: Init
    init?(name: String, photo: UIImage?, rating: Int){
        // Init check
        // The name must not be empty
        
        guard !name.isEmpty else {
            return nil
        }
        
        // The rating must be between 0 and 5
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
    
        
        // Init stored props
        
        self.name = name
        self.photo = photo
        self.rating = rating
        
        
    }
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
    }
    
    required convenience init?(coder aDecoder: NSCoder){
        
        //The name is requier. If we cannot decode a name string, the init shoudl fail
        
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        //Because photo is optional property of Meal, just use conditional cast
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
        
        
        // Must call designated initilaizer
        self.init(name: name, photo: photo, rating: rating)
        
    }
}
