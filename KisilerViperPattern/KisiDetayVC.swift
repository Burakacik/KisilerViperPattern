//
//  KisiDetayVC.swift
//  KisilerViperPattern
//
//  Created by Burak AÇIK on 30.08.2022.
//

import UIKit

class KisiDetayVC: UIViewController {

    @IBOutlet weak var tfKisiAd: UITextField!
    @IBOutlet weak var tfKisiTel: UITextField!
    
    var kisi:Kisiler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let k = kisi {
            tfKisiAd.text = k.kisiAd
            tfKisiTel.text = k.kisiTel
        }
        
        
    }
    
    
    @IBAction func buttonGuncelle(_ sender: Any) {
        if let ka = tfKisiAd.text, let kt = tfKisiTel.text, let k = kisi {
            guncelle(kisiId: k.kisiId!, kisiAd: ka, kisiTel: kt)
        }
    }
    
    func guncelle(kisiId:Int, kisiAd:String, kisiTel:String) {
        print("Kişi ID:\(kisiId) - Kişi adı:\(kisiAd) - Kişi tel:\(kisiTel)")
    }
}
