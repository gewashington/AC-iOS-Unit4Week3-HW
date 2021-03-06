//
//  ImageCache.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/6/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class ImageCache {
    private init(){
        
    }
    static let manager = ImageCache()
    
    private var sharedCached = NSCache<NSString, UIImage>()
    
    // get current cached image
    func cachedImage(url: URL) -> UIImage? {
        return sharedCached.object(forKey: url.absoluteString as NSString)
    }
    
    // process image and store in cache
    func processImageInBackground(imageURL: URL, completion: @escaping(Error?, UIImage?) -> Void) {
        DispatchQueue.global().async {
            do {
                let imageData = try Data.init(contentsOf: imageURL)
                let image  = UIImage.init(data: imageData)
                
                // store image in cache
                if let image = image {
                    self.sharedCached.setObject(image, forKey: imageURL.absoluteString as NSString)
                }
                DispatchQueue.main.async {
                    completion(nil, image)
                }
            } catch {
                print("ImageCache - image processing error: \(error.localizedDescription)")
                DispatchQueue.main.async {
                completion(error, nil)
                }
            }
        }
    }
}
