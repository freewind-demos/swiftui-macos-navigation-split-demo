import SwiftUI

struct SidebarItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let icon: String
}

struct ContentView: View {
    @State private var selectedSidebar: SidebarItem?
    @State private var selectedDetail: String = "请从左侧选择一个项目"

    let sidebarItems = [
        SidebarItem(title: "首页", icon: "house.fill"),
        SidebarItem(title: "设置", icon: "gearshape.fill"),
        SidebarItem(title: "用户", icon: "person.fill"),
        SidebarItem(title: "消息", icon: "envelope.fill"),
        SidebarItem(title: "收藏", icon: "star.fill")
    ]

    var body: some View {
        NavigationSplitView {
            // 侧边栏
            List(sidebarItems, selection: $selectedSidebar) { item in
                Label(item.title, systemImage: item.icon)
            }
            .listStyle(.sidebar)
            .frame(minWidth: 150)
        } detail: {
            // 详情区
            VStack(spacing: 20) {
                if let selected = selectedSidebar {
                    Image(systemName: selected.icon)
                        .font(.system(size: 60))
                        .foregroundColor(.blue)

                    Text(selected.title)
                        .font(.largeTitle)

                    Text("这是 \(selected.title) 页面的内容")
                        .foregroundColor(.secondary)

                    Spacer()
                } else {
                    Text("请从左侧选择一个项目")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
        }
    }
}
