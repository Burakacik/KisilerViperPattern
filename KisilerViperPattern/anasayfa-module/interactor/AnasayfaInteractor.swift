//
//  AnasayfaInteractor.swift
//  KisilerViperPattern
//
//  Created by Burak AÇIK on 30.08.2022.
//

import Foundation
import Firebase

class AnasayfaInteractor: PresenterToInteractorAnasayfaProtocol {
    
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    var refKisiler = Database.database().reference().child("kisiler")
    
    
    func tumKisileriAl() {
        refKisiler.observe(.value, with: { snapshot in
            var liste = [Kisiler]()
            
            if let gelenVeri = snapshot.value as? [String:AnyObject] {
                for kisiKey in gelenVeri {
                    if let d = kisiKey.value as? NSDictionary {
                        let kisiId = kisiKey.key
                        let kisiAd = d["kisiAd"] as? String ?? ""
                        let kisiTel = d["kisiTel"] as? String ?? ""
                        
                        let kisi = Kisiler(kisiId: kisiId, kisiAd: kisiAd, kisiTel: kisiTel)
                        liste.append(kisi)
                    }
                }
            }
            self.anasayfaPresenter?.presentaraVeriGonder(kisilerListesi: liste)
        })
    }
    
    
    func kisiAra(aramaKelimesi: String) {
        refKisiler.observe(.value, with: { snapshot in
            var liste = [Kisiler]()
            
            if let gelenVeri = snapshot.value as? [String:AnyObject] {
                for kisiKey in gelenVeri {
                    if let d = kisiKey.value as? NSDictionary {
                        let kisiId = kisiKey.key
                        let kisiAd = d["kisiAd"] as? String ?? ""
                        let kisiTel = d["kisiTel"] as? String ?? ""
                        
                        if kisiAd.lowercased().contains(aramaKelimesi.lowercased()) {
                            let kisi = Kisiler(kisiId: kisiId, kisiAd: kisiAd, kisiTel: kisiTel)
                            liste.append(kisi)
                        }
                    }
                }
            }
            self.anasayfaPresenter?.presentaraVeriGonder(kisilerListesi: liste)
        })
    }
    
    
    func kisiSil(kisiId: String) {
        refKisiler.child(kisiId).removeValue()
    }
    
    
}
