//
//  KisiDetayInteractor.swift
//  KisilerViperPattern
//
//  Created by Burak AÇIK on 30.08.2022.
//

import Foundation

class KisiDetayInteractor: PresenterToInteractorKisiDetayProtocol {
    func kisiGuncelle(kisiId: Int, kisiAd: String, kisiTel: String) {
        print("Kişi ID:\(kisiId) - Kişi adı:\(kisiAd) - Kişi tel:\(kisiTel)")
    }
    
    
}
