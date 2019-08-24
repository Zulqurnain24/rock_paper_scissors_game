//
//  ImageUtility.swift
//  ElementsInteractiveAssignment
//
//  Created by Mohammad Zulqarnain on 19/01/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit
import Alamofire

class ImageUtility: NSObject {
    
    static let shared = ImageUtility()
    private override init() {}
    
    var cache: NSCache = NSCache<NSString, UIImage>() //TODO: Possibly use CoreData instead?
    
    func downloadImage(imageUrl: String, completion: @escaping (UIImage?) -> Void) {
        if let image = cache.object(forKey: imageUrl as NSString) {
            completion(image)
            return
        }
        guard let encodedUrlString = imageUrl.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed) else {
            print("Image URL Percent Encoding failed for: \(imageUrl)") //TODO: Log api_error event to Crashlytics
            completion(nil)
            return
        }
        Alamofire.request(encodedUrlString).responseImage { response in
            if let image: UIImage = response.result.value {
                self.cache.setObject(image, forKey: imageUrl as NSString) //MUST Use orginal URL string for key
                completion(image)
            } else {
                print("Image Download failed for: \(encodedUrlString)") //TODO: Log api_error event to Crashlytics
                completion(nil)
            }
        }
    }

}
