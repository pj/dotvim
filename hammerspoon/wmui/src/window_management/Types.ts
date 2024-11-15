
export type Screen = {
    id: string
    name: string
    isMain: boolean
    currentVirtualDesktop: VirtualDesktop | null
    layout: Layout | null
    x: number
    y: number
    width: number
    height: number
}

export type LayoutType = "root" | "columns" | "rows" | "stack" | "pinned" | "empty"

export type RootLayout = {
    type: "root"
    child: Layout
    name: string
    quickKey: string
    span: number
}

export type ColumnsLayout = {
    type: "columns"
    columns: Layout[]
    span: number
}

export type RowsLayout = {
    type: "rows"
    rows: Layout[]
    span: number
}

export type StackLayout = {
    type: "stack"
    span: number
}

export type PinnedLayout = {
    type: "pinned"
    span: number
    application?: string
    title?: string
}

export type EmptyLayout = {
    type: "empty"
    span: number
}

export type Layout = RootLayout | ColumnsLayout | RowsLayout | StackLayout | PinnedLayout | EmptyLayout

export type Window = {
    id: string
    title: string
    focused: boolean
}

export type VirtualDesktop = {
    id: string
    windows: Window[]
    focusedWindow: Window | null
}

export type WindowManagementState = {
    screens: Screen[]
}
