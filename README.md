# SwiftUI macOS NavigationSplit 分栏布局

## 简介

演示 SwiftUI 中 NavigationSplitView 的用法，实现经典的三栏式 macOS 应用布局。

## 快速开始

```bash
cd swiftui-macos-navigation-split-demo
xcodegen generate
open SwiftUINavigationSplitDemo.xcodeproj
# Cmd+R 运行
```

## 概念讲解

### NavigationSplitView 基本结构

```swift
NavigationSplitView {
    // 第一栏：侧边栏
    List(items, selection: $selected) { item in
        Label(item.title, systemImage: item.icon)
    }
    .listStyle(.sidebar)
} detail: {
    // 第三栏：详情区
    Text("详情内容")
}
```

### 三栏结构

NavigationSplitView 支持三栏：

```swift
NavigationSplitView {
    // 侧边栏 (Sidebar)
} sidebar: {
    // 可选的中间栏
} detail: {
    // 详情栏
}
```

### List + selection

```swift
List(items, selection: $selected) { item in
    Label(item.title, systemImage: item.icon)
}
```

- `selection` 绑定选中的项目
- 选中项会高亮显示
- 支持单选和多选

### listStyle

macOS 提供了多种列表样式：

```swift
.listStyle(.sidebar)     // 侧边栏样式
.listStyle(.inset)       // 嵌入式
.listStyle(.sourceList)  // 源码列表样式
```

## 完整示例

```swift
struct ContentView: View {
    @State private var selected: Item?

    var body: some View {
        NavigationSplitView {
            List(items, selection: $selected) { item in
                Label(item.title, systemImage: item.icon)
            }
            .listStyle(.sidebar)
        } detail: {
            if let selected = selected {
                DetailView(item: selected)
            }
        }
    }
}
```

## 完整讲解（中文）

### NavigationSplitView 的用途

这是 macOS 应用最常见的布局方式：
- 左侧：导航/类别列表
- 中间（可选）：子分类
- 右侧：详细内容

### 与 NavigationView 的区别

- `NavigationView` 是旧 API，在 macOS 13 及更早版本使用
- `NavigationSplitView` 是 macOS 13+ 的新 API，更现代

### 状态管理

通常需要 `@State` 来跟踪选中项：

```swift
@State private var selectedItem: Item?
```

选中项变化时，详情区自动更新。

### 适用场景

- 设置应用
- 邮件客户端
- 文件管理器
- 笔记应用
