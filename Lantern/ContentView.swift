//
//  ContentView.swift
//  Lantern
//
//  Created by Eatmyself on 2021/3/4.
//

import SwiftUI

struct ContentView: View {
    @State private var s: Int = 0
    @State private var c: Int = 0
    @State private var showAlert = false
    let a = [["脫了紅袍子，是個白胖子；去了白胖子，是顆黑丸子。","荔枝","包心粉圓","荔枝"],
             ["狼來了。","楊桃","楊桃","草莓"],
             ["麻屋子紅帳子，裡面一個白胖子。","花生","火龍果","花生"],
             ["一群黃雞娘，生蛋進船艙。烤後一聲響，個個大過娘。","爆米花","爆米花","鞭炮"],
             ["身穿綠衣裳，肚裡水汪汪，生的子兒多，個個黑臉膛。","西瓜","葡萄","西瓜"],
             ["沒到手想搶到手，搶到手卻扔出手。","籃球","籃球","炸彈"],
             ["不是糕點不是糖，潔白芬芳袋裡裝，不能吃來不能喝，每天你都要嘗嘗。","牙膏","肥皂","牙膏"],
             ["兄弟幾十個，分成幾面坐，見到有人來，從你頭上過。","跳棋","跳棋","牙齒"],
             ["兩姐妹一樣長，出入都成雙，酸甜苦辣味，他們總先嘗。","筷子","牙齒","筷子"],
             ["人脫衣服，它穿衣服，人脫帽子，它戴帽子。","衣帽架","衣帽架","鏡子"],
             ["國王搭飛機","王菲","王菲","關羽"],
             ["兩張兩百一張一百","伍佰","林志玲","伍佰"],
             ["金金金金金","金城武","金城武","蕭敬騰"],
             ["七十二小時","晶","朋","晶"],
             ["雙十國慶","朝","朝","艹"],
             ["早不說晚不說","許","寅","許"],
             ["金木水火","坎","坎","天"],
             ["有點自大","臭","休","臭"],
             ["少了一本書","缺一不可","缺一不可","牛角掛書"],
             ["不能到加油站上班的人","油腔滑調","油頭粉面","油腔滑調"],
    ]
    var body: some View {
        ZStack{
            Image("OnPF2zC")
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .edgesIgnoringSafeArea(.all)
            if c == 0 {
                Button("Start"){
                    s = Int.random(in: 0...19)
                    c += 1
                }
                .padding()
                .frame(width: 100.0)
                .background(Color.white)
                .cornerRadius(40)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.gray, lineWidth: 2)
                )
            } else if c>=11{
                VStack{
                    Text("You WIN!")
                        .font(.largeTitle)
                        .foregroundColor(Color.gray)
                        .frame(height: 300.0)
                    Spacer()
                    Button("Restart"){
                        s = Int.random(in: 0...19)
                        c = 1
                    }
                    .padding()
                    .frame(width: 100.0)
                    .background(Color.white)
                    .cornerRadius(40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.gray, lineWidth: 2)
                    )
                }
            } else {
                VStack{
                    Text("\(c)")
                        .foregroundColor(Color.gray)
                    Text(a[s][0])
                        .font(.title3)
                        .padding()
                        .foregroundColor(Color.gray)
                    Spacer()
                    HStack{
                        Button(a[s][2]){
                            if a[s][1]==a[s][2]{
                                s = Int.random(in: 0...19)
                                c += 1
                            }else{
                                showAlert = true
                            }
                        }
                        .foregroundColor(.green)
                        .padding(.horizontal, 4.0)
                        .cornerRadius(40)
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.green, lineWidth: 3)
                        )
                        .padding()
                        .alert(isPresented: $showAlert) {
                            let t = c-1
                            return Alert(title: Text("Your Score: \(t)"), dismissButton: .default(Text("OK"), action: {
                                    c=0
                                }))
                        }
                        Button(a[s][3]){
                            if a[s][1]==a[s][3]{
                                s = Int.random(in: 0...1)
                                c += 1
                            }else{
                                showAlert = true
                            }
                        }
                        .foregroundColor(.orange)
                        .padding(.horizontal, 4.0)
                        .cornerRadius(40)
                        .padding(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.orange, lineWidth: 3)
                        )
                        .padding()
                        .alert(isPresented: $showAlert) {
                            let t = c-1
                            return Alert(title: Text("Your Score: \(t)"), dismissButton: .default(Text("OK"), action: {
                                    c=0
                                }))
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
