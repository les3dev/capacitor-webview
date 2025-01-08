import { Webview } from '@les3dev/capacitor-webview';

window.testEcho = () => {
    const inputValue = document.getElementById("echoInput").value;
    Webview.echo({ value: inputValue })
}
