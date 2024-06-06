#Requires AutoHotkey v2.0.2
#SingleInstance Force

Komorebic(cmd) {
    RunWait(format("komorebic.exe {}", cmd), , "Hide")
}

!+^q::Komorebic("close")
!+^m::Komorebic("minimize")

; Focus windows
!+^h::Komorebic("focus left")
!+^j::Komorebic("focus down")
!+^k::Komorebic("focus up")
!+^l::Komorebic("focus right")

!+^[::Komorebic("cycle-focus previous")
!+^]::Komorebic("cycle-focus next")

!+^n::Komorebic("cycle-monitor next")

; Move windows
!+^y::Komorebic("move left")
!+^u::Komorebic("move down")
!+^i::Komorebic("move up")
!+^o::Komorebic("move right")

!+^p::Komorebic("cycle-send-to-monitor next")

; Stack windows
!+^Left::Komorebic("stack left")
!+^Down::Komorebic("stack down")
!+^Up::Komorebic("stack up")
!+^Right::Komorebic("stack right")
!+^;::Komorebic("unstack")

!+^,::Komorebic("cycle-stack previous")
!+^.::Komorebic("cycle-stack next")

; Resize
!=::Komorebic("resize-axis horizontal increase")
!-::Komorebic("resize-axis horizontal decrease")
!+=::Komorebic("resize-axis vertical increase")
!+_::Komorebic("resize-axis vertical decrease")

; Manipulate windows
!+^t::Komorebic("toggle-float")
!+^f::Komorebic("toggle-monocle")

; Window manager options
!+^z::Komorebic("retile")
!+^x::Komorebic("toggle-pause")
!+^c::Komorebic("quick-load-resize")
!+^v::Komorebic("quick-save-resize")

; Layouts
!+^Space::Komorebic("cycle-layout next")
!+^Backspace::Komorebic("cycle-layout previous")

!+^a::Komorebic("change-layout vertical-stack")
!+^s::Komorebic("change-layout bsp")
!+^d::Komorebic("change-layout ultrawide-vertical-stack")
; !x::Komorebic("flip-layout horizontal")
; !y::Komorebic("flip-layout vertical")

; Workspaces
!1::Komorebic("focus-workspace 0")
!2::Komorebic("focus-workspace 1")
!3::Komorebic("focus-workspace 2")
!4::Komorebic("focus-workspace 3")
!5::Komorebic("focus-workspace 4")
!6::Komorebic("focus-workspace 5")
!7::Komorebic("focus-workspace 6")
!8::Komorebic("focus-workspace 7")

; Move windows across workspaces
!+^1::Komorebic("move-to-workspace 0")
!+^2::Komorebic("move-to-workspace 1")
!+^3::Komorebic("move-to-workspace 2")
!+^4::Komorebic("move-to-workspace 3")
!+^5::Komorebic("move-to-workspace 4")
!+^6::Komorebic("move-to-workspace 5")
!+^7::Komorebic("move-to-workspace 6")
!+^8::Komorebic("move-to-workspace 7")

