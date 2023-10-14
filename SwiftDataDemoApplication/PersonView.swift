//  PersonViewView.swift
//  SwiftDataDemoApplication
//  Created by Holger Hinzberg on 14.10.23.

import SwiftUI

enum PersonViewWindowSize {
    static let min = CGSize(width: 450, height: 300)
    static let max = CGSize(width: 450, height: 300)
}

struct PersonView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.presentationMode) var presentationMode
    @State var firstName = ""
    @State var lastName = ""
    @State var age = ""
    
    var body: some View {
        
        VStack {
            Text("First Name")
                .foregroundColor(Color.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 15))
            
            TextField("", text: $firstName)
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
            
            Text("Last Name")
                .foregroundColor(Color.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 15))
            
            TextField("", text: $lastName)
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
            
            Text("Age")
                .foregroundColor(Color.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 15))
            
            TextField("", text: $age)
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
            
            Spacer()
            
            HStack {
                Spacer()
                
                Button("Cancel") { self.presentationMode.wrappedValue.dismiss() }
                    .keyboardShortcut(.cancelAction)
                
                Button("Submit") { self.presentationMode.wrappedValue.dismiss()
                    addPerson() }
                .keyboardShortcut(.defaultAction)
            }
            .padding(EdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 15))
            
        }
        .frame(minWidth: PersonViewWindowSize.min.width, minHeight: PersonViewWindowSize.min.height)
        .frame(maxWidth: PersonViewWindowSize.max.width, maxHeight: PersonViewWindowSize.max.height)
    }
    
    private func addPerson() {
        withAnimation {
            let person = Person(firstName: self.firstName, lastName: self.lastName, age: self.age)
            modelContext.insert(person)
        }
    }
}

#Preview {
    PersonView()
}
