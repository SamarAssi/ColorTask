//
//  ContentView.swift
//  ColorsTask
//
//  Created by Samar Assi on 17/03/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var colorViewModel = ColorViewModel()
    @State var showSheet: Bool = false
    
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    var body: some View {
        NavigationStack {
            if horizontalSizeClass == .compact && verticalSizeClass == .regular {
                portraitMode
            } else {
                landscapeMode
            }
        }
        .sheet(isPresented: $showSheet) {
            AddNewColor(
                addColorViewModel: AddColorViewModel(),
                showSheet: $showSheet,
                colors: $colorViewModel.colors
            )
        }
        .onAppear {
            colorViewModel.fetchData()
        }
    }
}

extension ContentView {
    var portraitMode: some View {
        VStack(alignment: .leading, spacing: 0) {
            listView
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
                
            descriptionView
                .padding(20)
        }
        .background(Color(colorViewModel.background))
    }
    
    var landscapeMode: some View {
        GeometryReader { geo in
            HStack {
                listView
                descriptionView
                    .frame(width: geo.size.width * 2 / 3)
                    .padding()
            }
            .background(Color(colorViewModel.background))
        }
    }
    
    var descriptionView: some View {
        VStack(alignment: .leading) {
            Text("Descpription")
                .fontWeight(.bold)
                .padding(.bottom)
            Text(colorViewModel.description)
            Spacer()
        }
        .foregroundStyle(Color.white)
    }
    
    var listView: some View {
        ListView(
            colorViewModel: colorViewModel,
            showSheet: $showSheet
        )
    }
}

#Preview {
    ContentView()
}
