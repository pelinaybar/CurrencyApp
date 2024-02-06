//
//  ContentView.swift
//  ConverterApp
//
//  Created by Pelin Aybar on 2.02.2024.
//

import SwiftUI
import SwiftData
import TipKit

struct ContentView: View //yapımızın bir görünüm olduğunu söyler. 
{
    //var import struct gibi kelimeler anahtar sözcüklerdir ve bu yüzden renklidir.
    //State izin ver anlamı taşır. Gövde de değişkenlere izin ver. //property wrapper
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    
    @State var leftAmount = "" //boş bir dizedir.
    @State var rightAmount = ""
    
    //odaklanma durumu özelliği, uygulamamızın neresinde olduğunu takip etmemizi sağlar.
    @FocusState var leftTyping
    @FocusState var rightTyping
    
    @State var leftCurrency = Currency.silverPiece
    @State var rightCurrency = Currency.goldPenny
    
    var body: some View {
        
        ZStack{
            //Background Image
            Image(.background) // nokta yaptığımızda hatamızı daha iyi bulma şansımız var.
                .resizable() // yeniden boyutlandırma orjinal
                .ignoresSafeArea() // alan tamamı kaplama
            VStack{
                //Image
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit() //sığacak şekilde ölçeklendir
                    .frame(height: 200)
                //Text
                Text("Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                //Conversion Section
                HStack{
                    //Left Conversion
                    VStack{
                        HStack{
                            //Image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height:35)
                            //Text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(.bottom,0)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        //Textfield
                        TextField("Amount", text: $leftAmount) //bindingstring - bağlayıcı string dolar işareti bu yüzden var.Eğer dolar işareti ollmazsa kullanıcadan alamayız ve kodu biz değiştiriyoruz manası alır. Dolar işareti kullanıcdan veriyi de aldırtır ve bağlar birbirine dizeleri.
                            .focused($leftTyping) //sağ metin otomatik güncelleniyor
                            .textFieldStyle(.roundedBorder)
                            //.padding(.horizontal)
                            
                            .keyboardType(.decimalPad) //klavye tipi ayarlama
                    }
                    //Equal Sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .symbolEffect(.pulse)
                    
                    //Right Conversion
                    VStack{
                        HStack{
                            //Text
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            //Image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 35)
                        }
                        .padding(.bottom,0)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        //dokunma hareketine başka değiştirici eklemek
                        .popoverTip(CurrencyTip(),arrowEdge: .bottom)
                        TextField("Amount", text: $rightAmount) //bindingstring - bağlayıcı string dolar işareti bu yüzden var.Eğer dolar işareti ollmazsa kullanıcadan alamayız ve kodu biz değiştiriyoruz manası alır. Dolar işareti kullanıcdan veriyi de aldırtır ve bağlar birbirine dizeleri.
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightTyping) //sol metin otomatik güncelleniyor
                            
                            .keyboardType(.decimalPad) //klavye tipi ayarlama
                            //.padding(.horizontal)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                Spacer() //ayırıcı
                //Info Button
                HStack {
                    Spacer()
                    Button{
                        showExchangeInfo.toggle() //.toggle() boolen ifadeyi her tıklandığında değiştir demek.
                    }label: {
                        Image(systemName: "info.square.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                }
                    .padding(.trailing)
                    
            }
            //.border(.blue)
        }
            //arka planda kod çalıştırmamızı sağlar.
            .task {
                //try bu fonksiyonu çalıştırmayı dene hataları
                try? Tips.configure()
            }
            .onChange(of: leftAmount){
            if leftTyping == true{
        rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
            }
    }
            
        .onChange(of: leftCurrency){
            rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
        }
            .onChange(of: rightAmount){
            if rightTyping == true{
                leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
            }
    }
        .onChange(of: rightCurrency){
            leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
        }
            .sheet(isPresented: $showExchangeInfo){
                ExchangeInfo()
            }
            .sheet(isPresented: $showSelectCurrency){
                SelectCurrency(topCurrency: $leftCurrency,bottomCurrency: $rightCurrency)
            }
            }
    }
}

#Preview {
    ContentView()
}
