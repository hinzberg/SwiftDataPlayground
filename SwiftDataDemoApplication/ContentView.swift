//  ContentView.swift
//  SwiftDataDemoApplication
//  Created by Holger Hinzberg on 14.10.23.

// https://useyourloaf.com/blog/swiftui-tables-quick-guide/

import SwiftUI
import SwiftData

enum ContentViewWindowSize {
    static let min = CGSize(width: 400, height: 260)
    static let max = CGSize(width: 400, height: 260)
}

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var persons : [Person]
    @State private var selected = Set<Person.ID>()
    
    @State var showingAddSheet = false
    
    var body: some View {
        
        VStack {
                Table(persons, selection: $selected ) {
                    TableColumn("First Name", value: \.firstName)
                        .width(min: 150, max: 300)
                    TableColumn("Last Name", value: \.lastName)
                        .width(min: 150, max: 300)
                    TableColumn("Age", value: \.age)
                        .width(min: 150, max: 300)
                }
        }
        .toolbar (id: "main") {
            ToolbarItem(id: "files") {
                Button(action: { showingAddSheet.toggle()}) {
                    Label("Add Person", systemImage: "person.fill.badge.plus")
                }
            }
            ToolbarItem(id: "rename") {
                Button(action: {  } ) {
                    Label("Delete Selected", systemImage: "person.badge.minus")
                }
            }
            ToolbarItem(id: "cleanup") {
                Button(action: { deleteAll() }) {
                    Label("Delete all", systemImage: "trash.fill")
                }
            }
        }
        .sheet(isPresented: $showingAddSheet ) {
            showAddPersonSheet()
        }
    }
    
    func deleteAll() {
        print("delete all!")
        do {
            try withAnimation {
                try modelContext.delete(model: Person.self,  includeSubclasses: false)
            }
        } catch {
            print("error: \(error)")
        }
    }
    
    func showAddPersonSheet() -> some View {
        return PersonView()
    }
    
    func getWindowTitleWithVersion() -> String {
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        return "File Name Fixer - Version \(appVersion!)"
    }
    
    
    /*
     private func addItem() {
     withAnimation {
     let newItem = Item(timestamp: Date())
     modelContext.insert(newItem)
     }
     }
     
     private func deleteItems(offsets: IndexSet) {
     withAnimation {
     for index in offsets {
     modelContext.delete(items[index])
     }
     }
     }
     */
}

#Preview {
    ContentView()
        .modelContainer(for: Person.self, inMemory: true)
}
