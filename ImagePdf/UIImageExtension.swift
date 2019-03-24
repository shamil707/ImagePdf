//
//  UIImageExtension.swift
//  ImagePdf
//
//  Created by Shamil Yusuf on 24/3/19.
//
import UIKit
extension UIImageView {
    var imageFromURLSting: URL? {
        get {
            return nil
        }
        set(newValue) {
            if let newText = newValue {
                self.drawPDFfromURL(url: newText)
            }
        }
    }
    func drawPDFfromURL(url: URL) {
        guard let document = CGPDFDocument(url as CFURL) else { return }
        guard let page = document.page(at: 1) else { return }
        
        let pageRect = page.getBoxRect(.mediaBox)
        let renderer = UIGraphicsImageRenderer(size: pageRect.size)
        let img = renderer.image { ctx in
            UIColor.white.set()
            ctx.fill(pageRect)
            
            ctx.cgContext.translateBy(x: 0.0, y: pageRect.size.height)
            ctx.cgContext.scaleBy(x: 1.0, y: -1.0)
            
            ctx.cgContext.drawPDFPage(page)
        }
        self.image = img
    }
}
