//
//  LogoDownloaderDelegate.swift
//  MyDelegate
//
//  Created by leslie on 12/22/20.
//

import Foundation
import UIKit

protocol LogoDownloaderDelegate {
    
    // Classes that adopt this protocol MUST define this method
    // -- and hopefully do something in that definition.
    func didFinishDownloading(_ sender: LogoDownloader)
}
