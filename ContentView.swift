import SwiftUI
import FirebaseAuth
import FirebaseDatabase


struct ContentView: View {
    @AppStorage("isLoggedIn") var userIsLoggedIn: Bool = false
    var body: some View {
        if userIsLoggedIn {
            HomepageView(isUserLoggedIn: $userIsLoggedIn)
        }else {
            SignInView(userIsLoggedIn: $userIsLoggedIn)
        }
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}


struct SignInView: View {
    @State var email = ""
    @State var password = ""
    @State var fullName = ""
    @State var username = ""
    @State var university = ""
    @State var year = ""
    
    @Binding var userIsLoggedIn: Bool
    @State private var showForgotPassword = false
    
    var body: some View {
        NavigationView{
            ZStack {
                Color.black
                
                VStack(spacing: 20){
                    Text("Welcome")
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .offset(x: -100, y: -100)
                    
                    TextField("Email", text: $email)
                        .foregroundColor (.white)
                        .textFieldStyle(.plain)
                        .placeholder(when: email.isEmpty){
                            Text("Email")
                                .foregroundColor(.white)
                                .bold()
                        }
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(.gray)
                    
                    SecureField("Password", text: $password)
                        .foregroundColor(.white)
                        .textFieldStyle(.plain)
                        .placeholder(when: password.isEmpty){
                            Text("Password")
                                .foregroundColor(.white)
                                .bold()
                        }                                                   
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(.gray)
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            showForgotPassword.toggle()
                        }, label: {
                            Text("Forgot Password?")
                        })
                        .font(.system(size: 16, weight: .bold))
                        .sheet(isPresented: $showForgotPassword) {
                            resetPasswordView()
                        }
                    }
                    
                    
                    
                    Button{
                        login()
                    } label: {
                        Text("login")
                            .bold()
                            .frame(width: 200, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.linearGradient(colors: [.pink, .red], startPoint: .top, endPoint: .bottomTrailing))
                            )
                            .foregroundColor(.white)
                    }
                    .padding(.top)
                    .offset(y: 100)
                    
                    NavigationLink("Create Account", destination: SignUpView)
                }
                .frame(width: 350)            }
            .ignoresSafeArea()
        }
    }
    
    var SignUpView: some View {
        NavigationView{
            ZStack {
                Color.black
                
                VStack(spacing: 20){
                    Text("Sign Up")
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .offset(x: -100, y: -100)
                    
                    //VStack{
                        TextField("Email", text: $email)
                            .foregroundColor (.white)
                            .textFieldStyle(.plain)
                            .placeholder(when: email.isEmpty){
                                Text("Email")
                                    .foregroundColor(.white)
                                    .bold()
                            }
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.gray)
                    //}
                    
                    //VStack{
                        SecureField("Password", text: $password)
                            .foregroundColor(.white)
                            .textFieldStyle(.plain)
                            .placeholder(when: password.isEmpty){
                                Text("Password")
                                    .foregroundColor(.white)
                                    .bold()
                            }
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.gray)
                    // }
                    
                    
//                    VStack{
//                        TextField("Full Name", text: $fullName)
//                            .foregroundColor (.white)
//                            .textFieldStyle(.plain)
//                            .placeholder(when: fullName.isEmpty){
//                                Text("Full Name")
//                                    .foregroundColor(.white)
//                                    .bold()
//                            }
//
//                        Rectangle()
//                            .frame(height: 2)
//                            .foregroundColor(.gray)
//                    }
//
//                    VStack{
//                        TextField("Username", text: $username)
//                            .foregroundColor (.white)
//                            .textFieldStyle(.plain)
//                            .placeholder(when: username.isEmpty){
//                                Text("Username")
//                                    .foregroundColor(.white)
//                                    .bold()
//                            }
//
//                        Rectangle()
//                            .frame(height: 2)
//                            .foregroundColor(.gray)
//                    }
//
//                    VStack{
//                        TextField("University", text: $university)
//                            .foregroundColor (.white)
//                            .textFieldStyle(.plain)
//                            .placeholder(when: university.isEmpty){
//                                Text("University")
//                                    .foregroundColor(.white)
//                                    .bold()
//                            }
//                        Rectangle()
//                            .frame(height: 2)
//                            .foregroundColor(.gray)
//
//                    }
                    
//                    VStack{
//
//                        TextField("Year", text: $year)
//                            .foregroundColor (.white)
//                            .textFieldStyle(.plain)
//                            .placeholder(when: year.isEmpty){
//                                Text("Year")
//                                    .foregroundColor(.white)
//                                    .bold()
//                            }
//
//                        Rectangle()
//                            .frame(height: 2)
//                            .foregroundColor(.gray)
//
//
//                    }
                    

                    
                    Button{
                        register(email: email, password: password, name: fullName, university: university, year: year, username: username)
                    } label: {
                        Text("Create Account")
                            .bold()
                            .frame(width: 200, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.linearGradient(colors: [.pink, .red], startPoint: .top, endPoint: .bottomTrailing))
                            )
                            .foregroundColor(.white)
                    }
                    .padding(.top)
                    .offset(y: 100)
                }
                .frame(width: 350)
                .onAppear{
                    Auth.auth().addStateDidChangeListener{auth, user in
                        if user != nil {
                            userIsLoggedIn.toggle()
                        }
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
    func login() {
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
            else {
                userIsLoggedIn = true
            }
            
        }
    }
    func register(email: String, password: String, name: String, university: String, year: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                let user = result?.user
                let data: [String: Any] = [
                    "email": email,
                    "name": fullName,
                    "university": university,
                    "year": year,
                    "username": username
                ]
                let databaseRef = Database.database().reference().child("users").child(user!.uid)
                databaseRef.setValue(data) { (error, ref) in
                    if error != nil {
                        print(error!.localizedDescription)
                    } else {
                        userIsLoggedIn = true
                    }
                }
            }
        }
    }
}
