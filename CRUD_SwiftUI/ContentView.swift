//
//  ContentView.swift
//  CRUD_SwiftUI
//
//  Created by Md Sifat on 2/17/20.
//  Copyright © 2020 Md Sifat. All rights reserved.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    var body: some View {
        ZStack{
            //Color.green.edgesIgnoringSafeArea(.all)
            VStack{
                FrontView()
                Section(header: Text("Display Personal Information")){
                List(0..<5){ item in
                    Image(systemName: "photo")
                    VStack (alignment: .leading){
                        Text("name")
                        Text("example@gmail.com")
                    }
                }}
            }


        }
    }
}
struct FrontView: View {
        @State private var inputName = ""
        @State private var inputEmail = ""
    var body: some View{
        
                VStack{
                    Text("Personal Information")
                    HStack{
        
                        Text("Name : ")
                        TextField("Enter Your Name",  text: $inputName)
                    }
                    HStack{
                        Text("Email : ")
                        TextField("Enter your Email",  text: $inputEmail)
                    }
                    Button(action: {
                        let config = Realm.Configuration(schemaVersion: 1)
                        do{
                            let realm = try Realm(configuration: config)
                            let data = DataSet()
                            data.name = self.inputName
                            data.email = self.inputEmail
                            try realm.write({
                                realm.add(data)
                                print("Success")
                            })
                        }
                        catch{
                            print (error)
                        }
        
                    })
                    {
                        Text("Save")
                    }
                    Button(action: {
                        let config = Realm.Configuration(schemaVersion: 1)
                        do{
                            let realm = try Realm(configuration: config)
                            let result = realm.objects(DataSet.self)
                            print(result)
                        }
                        catch{
                            print (error)
                        }
        
                    })
                    {
                        Text("Display Data")
                    }
        }.padding()
            
        }

    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

class DataSet : Object {
    @objc dynamic var name = ""
    @objc dynamic var email = ""
}
