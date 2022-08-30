//
//  KisiKayitPresenter.swift
//  KisilerViperPattern
//
//  Created by Burak AÇIK on 30.08.2022.
//

import Foundation

class KisiKayitPresenter: ViewToPresenterKisiKayitProtocol {
    
    var kisiKayitInteractor: PresenterToInteractorKisiKayitProtocol?
    
    func ekle(kisiAd: String, kisiTel: String) {
        kisiKayitInteractor?.kisiEkle(kisiAd: kisiAd, kisiTel: kisiTel)
    }
    
    
}
