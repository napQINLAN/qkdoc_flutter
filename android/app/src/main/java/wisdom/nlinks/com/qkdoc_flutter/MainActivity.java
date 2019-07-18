package wisdom.nlinks.com.qkdoc_flutter;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;
import wisdom.nlinks.com.qkdoc_flutter.plugins.UpdateVersionPlugin;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    UpdateVersionPlugin.registerWith(registrarFor("com.nlinks.wisdom/update_version"));
  }
}
