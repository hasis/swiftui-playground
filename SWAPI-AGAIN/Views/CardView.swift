////
////  CardView.swift
////  SWAPI-AGAIN
////
////  Created by Nikita Hasis on 7/8/20.
////  Copyright © 2020 Nikita Hasis. All rights reserved.
////
//
import SwiftUI
import URLImage
//
//
//
//struct CardView: View {
//    @State var item: CharacterResult
//    @EnvironmentObject var favorites: Favorites
//    @State private var translation: CGSize = .zero
//    @State private var swipeStatus: LikeDislike = .none
//
//    private enum LikeDislike: Int {
//        case like, dislike, none
//    }
//
//    var body: some View {
//        GeometryReader { geometry in
//
//            VStack(alignment: .leading) {
//             ZStack(alignment: self.swipeStatus == .like ? .topLeading : .topTrailing) {
//                URLImage(self.item.image,
//                content:  {
//                    $0.image
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .clipped()
//                        .frame(width: geometry.size.width, height: geometry.size.height * 0.75)
//                        .clipShape( Circle())
//                })
//                .frame(width: 100, height: 200)
//                .padding()
//                if self.swipeStatus == .like {
//                        Text("LIKE")
//                            .font(.headline)
//                            .padding()
//                            .cornerRadius(10)
//                            .foregroundColor(Color.green)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(Color.green, lineWidth: 3.0)
//                        ).padding(24)
//                            .rotationEffect(Angle.degrees(-45))
//                    } else if self.swipeStatus == .dislike {
//                        Text("DISLIKE")
//                            .font(.headline)
//                            .padding()
//                            .cornerRadius(10)
//                            .foregroundColor(Color.red)
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(Color.red, lineWidth: 3.0)
//                        ).padding(.top, 45)
//                            .rotationEffect(Angle.degrees(45))
//                    }
//                }
//
//                HStack {
//                    VStack(alignment: .leading, spacing: 6) {
//                        Text(self.item.name)
//                            .font(.title)
//                            .bold()
//                        Text(self.item.status)
//                            .font(.subheadline)
//                            .bold()
//                        Text(self.item.location["name"]!)
//                            .font(.subheadline)
//                            .foregroundColor(.gray)
//                    }
//                    Spacer()
//
//                    Image(systemName: "info.circle")
//                        .foregroundColor(.gray)
//                        .onTapGesture {
//                            print("INFO")
//                    }
//                }.padding(.horizontal)
//            }.padding(.bottom)
//                .background(Color.white)
//                .cornerRadius(10)
//                .shadow(radius: 5)
//                .animation(.interactiveSpring())
//                .offset(x: self.translation.width, y: self.translation.height)
//                .rotationEffect(.degrees(Double(self.translation.width / geometry.size.width) * 25), anchor: .bottom)
//                .gesture(
//                    DragGesture()
//                        .onChanged { value in
//                            self.translation = value.translation
//                        }.onEnded { value in
//                            self.translation = .zero
//                        }
//                )
//        }
//    }
//}
//
//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(item: CharacterResult(
//        id: 1,
//        created: "...",
//        name: "Mortellue Smyth",
//        gender: "n/a",
//        status: "Chronic Masturbator / Explorer",
//        url: "www.google.com",
//        species: "N/A",
//        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/2.jpeg")!,
//        type: "Type",
//        location: ["name": "Some Earth"],
//        origin: ["name": "Earth"]
//        ))
//    }
//}


struct CardView: View {
    @State private var animationCompletion: CGFloat = 0.0
    @State var item: CharacterResult
    
    private enum LikeDislike: Int {
        case like, dislike, none
    }

    var body: some View {
        GeometryReader { geo in
            VStack {
                URLImage(self.item.image,
                content:  {
                    $0.image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                        .clipShape(Circle())
                })
                
                HStack {
                    Text("BOB")
                    Spacer()
                    Text("\(5) km away")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                .padding()
            }
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 4)
        }
    }
}
