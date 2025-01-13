package dev.les3.capacitor.webview;

import android.graphics.Color;
import android.content.res.Configuration;
import android.content.Context;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginConfig;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "Webview")
public class WebviewPlugin extends Plugin {

    private Webview implementation = new Webview();

    @PluginMethod
    public void echo(PluginCall call) {
        String value = call.getString("value");

        JSObject ret = new JSObject();
        ret.put("value", implementation.echo(value));
        call.resolve(ret);
    }

    @Override
    public void load() {
        PluginConfig config = getConfig();
        String darkBackgroundColor = config.getString("darkBackgroundColor", "#000000");
        String lightBackgroundColor = config.getString("lightBackgroundColor", "#ffffff");

        int nightModeFlags = getContext().getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;

        if (nightModeFlags == Configuration.UI_MODE_NIGHT_YES) {
            getBridge().getWebView().setBackgroundColor(Color.parseColor(darkBackgroundColor));
        } else {
            getBridge().getWebView().setBackgroundColor(Color.parseColor(lightBackgroundColor));
        }
    }
}
