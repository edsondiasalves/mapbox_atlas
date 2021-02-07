<h1>An Atlas map provided by MapBox</h1>

## Getting Started

### Clone the project:
* `git clone https://github.com/edsondiasalves/mapbox_atlas.git`
### Enter in the root directory: 
- `cd mapbox_atlas`
### Download the dependencies:
* `flutter pub get`
### Set the credentials
#### For getting you API Key sign up to the [Google Cloud](https://mapbox.com/)

#### Ios:
> In the `ios/Runner/Info.plist` file change the highlighted value
```
<key>MGLMapboxAccessToken</key>
<string>[PUT YOUR TOKEN HERE]]</string>
```

#### Android:
> In the `app/src/main/AndroidManifest.xml` file change the API Key

```
<application
        android:name="io.flutter.app.FlutterApplication"
        android:label="mapbox_atlas"
        android:icon="@mipmap/ic_launcher">

        <meta-data android:name="com.mapbox.token" 
          android:value="[PUT YOUR TOKEN HERE]" />

```
### Run the project:
* `flutter run lib/src/main.dart`