//
//  ContentView.swift
//  Piye
//
//  Created by Pauline Broängen on 2022-10-24.
//

import SwiftUI
//nedanför importerar vi firebase
import Firebase

struct ContentView: View {
    //nedanför skapar vi en variabel (singleton). skapar bara EN instans av denna. db = database. firestore -> self.
    var db = Firestore.firestore()
    
    //skapar en instans till User.
    //_ = läggs till innan try.
    func addUserToStore(user: User) {
        do {
            _ = try db.collection("testing").addDocument(from: user)
        } catch {
            print("Error saving data")
        }
    }
    
    //en funktion som tar emot två parametrar, snapshot och error.
    func listenToStore() {
        
        //i funktionen listenToStore så har jag lagt in en funktion som heter addSnapshotListener som lyssnar efter förändringar. för varje förändring som sker så kommer den här funktionen att köras en gång. en snapshot är en kopia av hela min collection. ett ögonblick av vårt innehåll. den tar en ögonblicklig bild av allt som finns i vår collection.
        db.collection("testar").addSnapshotListener{
         snapshot, error in
            
            
            //guard till snapshot
            guard let snapshot = snapshot else {
                return
            }

            
            if let error = error {
                print("Error occured \(error)")
                return
            }
            //varje gång vi lägger till ett dokument eller tar bort ett dokument så kommer snapshot funktionen in. i testar collection.
            for document in snapshot.documents {
                //as är vad för format som .self som är innehållet i User filen.
                let result = Result {
                    try document.data(as: User.self)
                }
            }
            
        }
    }
    
    
    
    
    
    
    
    var body: some View {
        
        VStack {
        
        Text("Piye!")
        Text("Find out what skin tone you got.")
            .padding()
            
            
            //nedanför lägger vi till en knapp med en dictionary. nyckeln är stringvärdet.
            Button(action: {
                //db.collection("test").addDocument(data: ["name": "Pauline Broängen"])
                addUserToStore(user: User(username: "Pauline", password: "Boll"))
            }, label: {
                Text("Add to firestore")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
