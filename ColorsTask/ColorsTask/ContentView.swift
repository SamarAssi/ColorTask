//
//  ContentView.swift
//  ColorsTask
//
//  Created by Samar Assi on 17/03/2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var colorViewModel: ColorViewModel
    @State var description: String = Constant.Description.DEEP_TEAL
    @State var background: Color = Color("DeepTeal")
    @State var showSheet: Bool = false
    
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    var body: some View {
        NavigationStack {
            if (horizontalSizeClass == .compact && verticalSizeClass == .regular) {
                portraitMode
            } else {
                landscapeMode
            }
        }
        .sheet(isPresented: $showSheet, content: {
            AddNewColor(showSheet: $showSheet)
        })
    }
}

extension ContentView {
    var headerView: some View {
        HStack {
            Text("Colors")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
            
            EditButton()
                .foregroundStyle(Color.black)
                .fontWeight(.bold)
                .padding(.top, 5)
        }
        .padding()
    }
    var portraitMode: some View {
        VStack(alignment: .leading, spacing: 0) {
            List {
                ForEach(colorViewModel.colorViewModel, id: \.self) { color in
                    Text(color.colorName)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                        .padding(.vertical, 8)
                        .listRowBackground(color.color)
                        .onTapGesture {
                            description = color.description
                            background = color.color
                        }
                                            
                }
                .onDelete(perform: colorViewModel.delete)
                .onMove(perform: colorViewModel.move)
            }
            .listStyle(.inset)
            .navigationBarBackButtonHidden()
            .navigationTitle("Colors")
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                    Button {
                        showSheet.toggle()
                    } label: {
                        Text("Add")
                    }
            )
            .foregroundStyle(.black)
            .fontWeight(.bold)
                
            descriptionView.padding(20)
        }
        .background(background)
    }
    
    var landscapeMode: some View {
        GeometryReader { geo in
            HStack {
                List {
                    ForEach(colorViewModel.colorViewModel, id: \.self) { color in
                        Text(color.colorName)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                            .listRowBackground(color.color)
                            .padding(8)
                            .padding(.leading, 40)
                            .onTapGesture {
                                description = color.description
                                background = color.color
                            }
                    }
                }
                .listStyle(.inset)
                .navigationBarBackButtonHidden()
                .ignoresSafeArea()
                
                descriptionView
                    .frame(width: geo.size.width * 2 / 3)
                    .padding()
            }
            .background(background)
        }
    }
    
    var descriptionView: some View {
        VStack(alignment: .leading) {
            Text("Descpription")
                .fontWeight(.bold)
                .padding(.bottom)
            Text(description)
            Spacer()
        }
        .foregroundStyle(Color.white)
    }
}

#Preview {
    ContentView()
        .environmentObject(ColorViewModel())
}
