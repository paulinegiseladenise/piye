//
//  User.swift
//  Piye
//
//  Created by Pauline Broängen on 2022-10-24.
//

import Foundation
import FirebaseFirestoreSwift

//nedanför skapar jag en struct för user. vad vill jag ha i en User? username och password. Codable är ett protokoll som kan behövas. @DocumentID gör att firestore ger ett eget ID.

//nedanför har jag skapat ett objekt som heter User. User lade jag sedan in i firestore som User.
struct User: Codable {
    @DocumentID var id: String?
    var username: String
    var password: String
    
    //ps.
    //@DocumentID var id: String?
    //var username: String
    //var password: String
    //är "self" som finns i content view.
    
}
