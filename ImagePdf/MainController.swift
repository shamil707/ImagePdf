//
//  ViewController.swift
//  ImagePdf
//
//  Created by Shamil Yusuf on 24/3/19.
//
import UIKit
class MainController: UIViewController {
    let imageUrl = URL(string: "https://pib.uob.com.sg/assets/images/mobile/mighty/banking/cardimages/001843.pdf")
    @IBOutlet weak var imagePdf: UIImageView! {
        didSet {
            if let url = imageUrl {
                imagePdf.imageFromURLSting = url
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}

