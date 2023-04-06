//
//  ContentView.swift
//  ShoppingCart
//
//  Created by Tommy Chiapete on 2/18/21.
//

import SwiftUI


/*
 The ContentView will call other UI elements to show as well.
 Show the header, and the ScrollView will load the ListView struct
 inside a vertical stack to show the items.
 */
struct ContentView: View {
    
    
    
    var body: some View {
        
        // Show header
        HeaderText(text: "Start Shopping!")
        
        
        // Using a ScrollView allows us to create a
        // scrolling container of Views.
        ScrollView {
            VStack(spacing: 10) {
                
                // Call the ListView to show.  Give it some padding on the left and right side.
                ListView()
                    .padding(.leading)
                    .padding(.trailing)
                
            }
            .padding(.top) // add a little padding to the top of the stack
        }
        
    }
}


/*
 The ListView struct will loop through our list of items,
 calling another struct called RowView which builds the actual
 item information, price, and Add button UI.
 */
struct ListView : View {
    
    // Get item list, call ItemMix (inside Models/Item.swift)
    let items = ItemMix()
    
    var body: some View {
        
        // For each item in our Item list, grab
        // the index of the item so we grab the item at
        // each index, and get the name, decription, and
        // price information.
        ForEach(items.items.indices) { idx in
            
            let i = items.items[idx]
            RowView(name: i.name, description: i.description, price: i.price)
            
        }
    }
}


/*
 This RowView struct builds the item's row user interface.
 To act like a table, I decided to use two vertical stacks inside a
 horizontal stack.  In another words, one row with two columns for each item.
 In the first column, I display the item name and description.
 In the second column, I display the price and the "Add" button.
 */
struct RowView: View {
    
    // Each RowView needs an item name, description, and price.
    let name: String
    let description: String
    let price: Double
    
    var body: some View {
        
        // Use a horizontal stack to act like a row in a table
        HStack {
            
            // The first vertical stack (left side)
            VStack {
                
                // Show item name.  Extend the width.  Align left.
                Text(name)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                 
                
                // Show item description.  Extend the width.  Align left.
                Text(description)
                    .font(.caption)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
            }
            
            
            // The second vertical stack (right side)
            VStack {
                
                // Show price with dollar sign.  Bold it.  Limit width to 100.  Align right.
                Text("$" + String(price))
                    .bold()
                    .frame(maxWidth: 100, alignment: .trailing)
                
                
                // Add button -- "Add" as the button text.  Bold the text.
                Button(action: {
                    
                    // Print statement for debugging purposes.
                    print("Adding " + name)
                    
                }) {
                    Text("Add")
                        .bold()
                        .font(.title3)
                        
                }
                .padding(5.0)  // give it some padding to give it some space
                
                // The button color will be an orange and yellow gradient.
                .background(
                    ZStack {
                        Color.yellow
                        LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .leading, endPoint: .trailing)
                    }
                )
                
                // Button text "Add" black for now.
                .foregroundColor(.black)
                
                // Round the corners a bit, because I think it looks better.
                .cornerRadius(5.0)
                .frame(maxWidth: 100, alignment: .trailing)
            }
            
            
        }.padding(.bottom)  // Give this vertical stack some bottom padding.
        
        // Add a separation line.  When all items are rendered, items will
        // be separated by a line break to help readability.
        Rectangle()
            .frame(height: 1.0, alignment: .bottom)
            .foregroundColor(Color.gray)

    }

}

/*
 HeaderText struct returns a View of text that will show
 with some prominence.
 This takes in a string which will be the header text.
 */
struct HeaderText: View {
    
    let text: String
    
    var body: some View {
        
        // The text passed in will be of Title size, bold, and is Blue.
        Text(text)
            .font(.title)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .foregroundColor(.blue)
        
    }
    
}





/*
 Preview our views in Xcode.  Call ContentView.
 ContentView will show all UI elements on the screen when
 previewing is enabled.
 */
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
    
        VStack {
            ContentView()
        }
        
        
        
    }
}

 
