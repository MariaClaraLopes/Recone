//
//  UIImageView+Ext.swift
//  Recone
//
//  Created by Maria Clara Lopes on 29/05/21.
//

import UIKit
import SDWebImage

extension UIImageView {
    func reconeImageDownloader(with url: URL?) {
        self.sd_setImage(with: url)
    }
}
