//
//  DestinationSearchView.swift
//  Airbnb
//
//  Created by Declan on 28/02/2025.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var show: Bool
    @State private var destination = ""
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests = 0
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    withAnimation(.snappy){
                        show.toggle()
                    }
                }label:{
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                Spacer()
                
                if !destination.isEmpty{
                    Button("Clear"){
                        destination = ""
                    }
                    .foregroundStyle(.black)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
            VStack(alignment: .leading){
                if selectedOption == .location{
                    Text("Where to?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        TextField("Search desitination", text: $destination)
                            .font(.subheadline)
                        
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay(){
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 1.0)
                            .foregroundStyle(Color(.systemGray4))
                    }
                
                }  else {
                    CollapsedPickerView(title: "Where", description: "Add Destination")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) {selectedOption = .location}
            }
            
            
            VStack(alignment: .leading){
                if selectedOption == .dates{
                    // Date selection view
//                    HStack{
//                        Text("Show expanded")
//                        Spacer()
//                    }
                    
                    Text("When is your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    VStack{
                        DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                        Divider()
                        DatePicker("End Date", selection: $endDate, displayedComponents: .date)
                    }
                } else{
                    CollapsedPickerView(title: "When", description: "Add dates")
                    
                        
                }
                
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .dates ? 180 : 64)
            .onTapGesture {
                withAnimation(.snappy) {selectedOption = .dates}
            }
           
        
            
            VStack(alignment: .leading){
                if selectedOption == .guests{
                    // Date selection view
//                    HStack{
//                        Text("Show expanded view")
//                        Spacer()
//                    }
                    
                    Text("Who's coming with you?")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Stepper{
                        Text("\(numGuests) adults")
                    } onIncrement: {
                        numGuests += 1
                    } onDecrement: {
                        guard numGuests > 0 else { return }
                        numGuests -= 1
                    }
                } else{
                    CollapsedPickerView(title: "Who", description: "Add guests")
                      
                }
                
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .guests ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) {selectedOption = .guests}
            }
            Spacer()
        }
    }
}

#Preview {
    DestinationSearchView(show: .constant(false))
}

struct CollapsibleDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}

struct CollapsedPickerView: View {
    let title: String
    let description: String
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                Spacer()
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
//        .padding()
//        .background(.white)
//        .clipShape(RoundedRectangle(cornerRadius: 12))
//        .padding()
//        .shadow(radius: 10)
    }
}
