//
//  ContentView.swift
//  ColorsTask
//
//  Created by Samar Assi on 17/03/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var colorList: ColorViewModel = ColorViewModel()
    
    @State var description: String
    @State var background: Color
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
        .sheet(isPresented: $showSheet) {
            AddNewColor(
                addColorModel: AddColorViewModel(colorViewModel: colorList),
                showSheet: $showSheet
            )
        }
        .onAppear {
            colorList.colors = colorList.userDefaultManager.loadColors()
            description = colorList.colors[0].description
            background = Color(colorList.colors[0].color)
        }
        .onChange(of: colorList.colors) { oldValue, newValue in
            guard !newValue.isEmpty else {
                description = "The list is empty"
                return
            }
            description = newValue[0].description
            background = Color(newValue[0].color)
        }
    }
}

extension ContentView {
    var portraitMode: some View {
        VStack(alignment: .leading, spacing: 0) {
            ListView(
                listEditModel: ListEditViewModel(colorViewModel: colorList),
                description: $description,
                background: $background,
                showSheet: $showSheet
            )
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
                ListView(
                    listEditModel: ListEditViewModel(colorViewModel: colorList),
                    description: $description,
                    background: $background,
                    showSheet: $showSheet
                )
                
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
    ContentView(description: "", background: Color.white)
}
