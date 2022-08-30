//
//  KisiKayitInteractor.swift
//  KisilerViperPattern
//
//  Created by Burak AÇIK on 30.08.2022.
//

import Foundation

class KisiKayitInteractor: PresenterToInteractorKisiKayitProtocol {
    func kisiEkle(kisiAd: String, kisiTel: String) {
        print("Kişi adı:\(kisiAd) - Kişi tel:\(kisiTel)")
    }
    
    
}
