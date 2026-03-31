import Cocoa

@main
struct NavigationSplitApp: App {
    var body: some Scene {
        Window("分栏布局 NavigationSplit", id: "main") {
            ContentView()
        }
        .defaultSize(width: 700, height: 500)
    }
}
