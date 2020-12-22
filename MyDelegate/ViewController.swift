//
//  ViewController.swift
//  MyDelegate
//
//  Created by leslie on 12/21/20.
//

import UIKit

// This is the DELEGATE
class ViewController: UIViewController {
    

    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    var logoDownloader: LogoDownloader?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.alpha = 0.0
        
        loginView.alpha = 0.0
        
        let imageURL: String = "https://cdn.spacetelescope.org/archives/images/publicationjpg/heic1509a.jpg"
        
        logoDownloader = LogoDownloader(logoURL: imageURL)
        
        // Set a reference in the delegating object, LogoDownloader, to this class, ViewController.
        // ViewController is the delegate.
        // LogoDownloader tells ViewController that the image at the NASA URL has downloaded by calling the delegate method didFinishDownloading(_).
        logoDownloader?.delegate = self
        
        logoDownloader?.downloadLogo()
        
        if logoDownloader?.delegate == nil {
            loginView.alpha = 1.0
        }
    }


}

extension ViewController: LogoDownloaderDelegate {
    
    // Defining this method makes ViewController conform/adopt the LogoDownloaderDelegate protocol.
    // This method is called when the logo image finished downloading.
    func didFinishDownloading(_ sender: LogoDownloader) {
        
        imageView.image = logoDownloader?.image
        
        // Animae the appearance of this ViewController's UI
        UIView.animate(withDuration: 2.0, delay: 0.5, options: UIView.AnimationOptions.curveEaseIn) {
            
            self.loadingLabel.alpha = 0.0
            self.imageView.alpha = 1.0
            
        } completion: { (completed: Bool) in
            
            if completed {
                
                UIView.animate(withDuration: 2.0) {
                    
                    self.loadingLabel.alpha = 1.0
                    
                }
            }
        }

    }
}
