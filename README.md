TODO: A short decript how to config in native for using this package

# Android

### In android/app add this config to `build.gradle` :

```gradle
...
android {
    ...
    defaultConfig {
        ...
        manifestPlaceholders += [
                'appAuthRedirectScheme': '<your_custom_scheme>'
        ]
    }
}
```

Example :

```gradle
android {
    ...
    defaultConfig {
        ...
        manifestPlaceholders += [
                'appAuthRedirectScheme': 'com.example.auth'
        ]
    }
}
```

Note : The `last of applicationId` (ex: com.example.auth with the last is `auth`) **do not dulicate** with the `last of appAuthRedirectScheme`.

### In android/app/src/main add this config to `AndroidManifest.xml` :

#### In `mainest` tag :

```XML
    <queries>
        <intent>
            <action android:name="android.intent.action.VIEW" />
            <category android:name="android.intent.category.BROWSABLE" />
            <data android:scheme="https" />
        </intent>
        <intent>
            <action android:name="android.intent.action.VIEW" />
            <category android:name="android.intent.category.APP_BROWSER" />
            <data android:scheme="https" />
        </intent>
    </queries>
```

#### In `application` tag :

```XML

<meta-data android:name="flutter_deeplinking_enabled" android:value="true" />
<intent-filter>
    <action android:name="android.intent.action.VIEW"/>
    <category android:name="android.intent.category.DEFAULT"/>
    <category android:name="android.intent.category.BROWSABLE"/>
    <data android:scheme='<your_custom_scheme>'/>
</intent-filter>

<!-- App Links -->
<meta-data android:name="flutter_deeplinking_enabled" android:value="true" />
<intent-filter android:autoVerify="true">
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.DEFAULT" />
    <category android:name="android.intent.category.BROWSABLE" />
    <!-- Accepts URIs that begin with https://YOUR_HOST -->
    <data
    android:scheme="https"
    android:host='<your_server_open_id_url>' />
</intent-filter>

<!-- App Links if your server support http and https -->
<meta-data android:name="flutter_deeplinking_enabled" android:value="true" />
<intent-filter android:autoVerify="true">
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.DEFAULT" />
    <category android:name="android.intent.category.BROWSABLE" />
    <!-- Accepts URIs that begin with https://YOUR_HOST -->
    <data
    android:scheme="http"
    android:host='<your_server_open_id_url>' />
</intent-filter>
```

# IOS

### in `ios\Runner\Info.plist` add this into `dict` tag :

```XMl
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLSchemes</key>
        <array>
        <string>your_custom_scheme</string>
        </array>
    </dict>
</array>
```

# Usage

TODO: How to use this package.

```dart
SignWithUnicloudId signWithUnicloudId = SignWithUnicloudId.instance;
signWithUnicloudId.setConfig(redirectUrl: "com.example.autho");
var ret = await signWithUnicloudId.authorize();
```
