#### google_fonts

The google_fonts package for Flutter allows you to easily use any of the 977 fonts (and their variants) from fonts.google.com in your Flutter app.

#### Why is this here ?

With the google_fonts package, `.ttf` or `.otf` files do not need to be stored in your assets folder and mapped in the pubspec. Instead, they can be fetched once via http at runtime, and cached in the app's file system. This is ideal for development, and can be the preferred behavior for production apps that are looking to reduce the app bundle size. Still, you may at any time choose to include the font file in the assets, and the Google Fonts package will prioritize pre-bundled files over http fetching. Because of this, the Google Fonts package allows developers to choose between pre-bundling the fonts and loading them over http, while using the same API.