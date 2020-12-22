//
//  LogoDownloader.swift
//  MyDelegate
//
//  Created by leslie on 12/22/20.
//

import Foundation
import UIKit

//This is the DELEGATING CLASS.
//An instances of this class is a DELEGATING OBJECT.
class LogoDownloader {
    
    var logoURL: String
    
    var image: UIImage?
    
    var delegate: LogoDownloaderDelegate?
    
    init(logoURL: String) {
        self.logoURL = logoURL
    }
    
    func downloadLogo() -> Void {
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            
            let imageURL = URL(string: self.logoURL)        // URL > String
            guard let imageData = NSData(contentsOf: imageURL!) else {return}   // URL.String > NSData
            
            self.image = UIImage(data: imageData as Data)  // NSData > Image
            print("image downloaded")
            
            // Once the image finishes downloading, I jump onto the MAIN THREAD TO UPDATE THE UI.
            DispatchQueue.main.async {
                
                // Tell the delegate that the image has downloaded so the delegate can display the image.
                self.didDownloadImage()
            }
        }
    }
    
    // Since this class has a reference to the delegate,
    // "at the appropriate time [it] sends a message to" the delegate.
    // Finishing the logo download is definitely the appropriate time.
    // It's the time point to relay the baton to delegate.
    func didDownloadImage() {
        
        delegate?.didFinishDownloading(self)
    }
    
}
