#Requires AutoHotkey v2.0

Home::Exitapp

sleep(1500)

while(true) {
    MouseClick "Left", 1250, 410
    sleep(250)
    MouseClick "Left", 1250, 635
    Send "{f}"
    sleep(250)
}