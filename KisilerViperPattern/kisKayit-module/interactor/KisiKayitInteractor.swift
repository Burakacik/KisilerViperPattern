//
//  KisiKayitInteractor.swift
//  KisilerViperPattern
//
//  Created by Burak AÇIK on 30.08.2022.
//

import Foundation
import Firebase

class KisiKayitInteractor: PresenterToInteractorKisiKayitProtocol {
    
    var refKisiler = Database.database().reference().child("kisiler")
                                                           
    func kisiEkle(kisiAd: String, kisiTel: String) {
        
        let yeniKisi = ["kisiId":"","kisiAd":kisiAd,"kisiTel":kisiTel]
        refKisiler.childByAutoId().setValue(yeniKisi)
    }
    
    
}
