//
//  AnasayfaInteractor.swift
//  KisilerViperPattern
//
//  Created by Burak AÇIK on 30.08.2022.
//

import Foundation

class AnasayfaInteractor: PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    func tumKisileriAl() {
        var liste = [Kisiler]()
        
        let k1 = Kisiler(kisiId: 1, kisiAd: "Burak AÇIK", kisiTel: "0 532 488 2405")
        let k2 = Kisiler(kisiId: 2, kisiAd: "Seda AÇIK", kisiTel: "0 536 633 5472")
        liste.append(k1)
        liste.append(k2)
        anasayfaPresenter?.presentaraVeriGonder(kisilerListesi: liste)
    }
    
    func kisiAra(aramaKelimesi: String) {
        print("Arama sonucu: \(aramaKelimesi)")
    }
    
    func kisiSil(kisiId: Int) {
        print("\(kisiId) silindi.")
    }
    
    
}
