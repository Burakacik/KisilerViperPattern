//
//  KisiDetayPresenter.swift
//  KisilerViperPattern
//
//  Created by Burak AÇIK on 30.08.2022.
//

import Foundation

class KisiDetayPresenter: ViewToPresenterKisiDetayProtocol {
    var kisiDetayInteractor: PresenterToInteractorKisiDetayProtocol?
    
    func guncelle(kisiId: Int, kisiAd: String, kisiTel: String) {
        kisiDetayInteractor?.kisiGuncelle(kisiId: kisiId, kisiAd: kisiAd, kisiTel: kisiTel)
    }
    
    
}
