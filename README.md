# Kelime Lab

Kelime Lab, Türkçe–İngilizce kelime öğrenmeye odaklanan, Flutter ile geliştirilmiş bir kelime çalışma uygulamasıdır. Kullanıcıların yerel bir kelime listesi oluşturmasına, kayıtlı kelimeler arasında arama yapmasına, otomatik çeviri önerileri almasına ve bilgi kartları ile çoktan seçmeli testler üzerinden pratik yapmasına olanak tanır.

## Projenin Kapsamı

Bu depo; Android, iOS, Web, Windows, Linux ve macOS platformlarını destekleyen çoklu platform bir Flutter uygulamasını içerir.

Kelime verileri SQLite tabanlı yerel bir veritabanında saklanır. Böylece kullanıcılar ekledikleri kelimelere cihaz üzerinde erişebilir ve kelime çalışmalarını yerel olarak sürdürebilir.

## Özellikler

### Yerel Kelime Yönetimi

* İngilizce–Türkçe kelime çiftleri ekleme
* Kelimeleri alfabetik sırayla listeleme
* İngilizce veya Türkçe metne göre arama yapma
* Tek bir kelimeyi silme
* Kayıtlı tüm kelimeleri temizleme

### Çeviri Destekli Kelime Ekleme

* Türkçeden İngilizceye çeviri desteği
* İngilizceden Türkçeye çeviri desteği
* Çeviri sonucunu kelime ekleme ekranında kullanma

### Pratik Modları

#### Kelime Kartları

* Kelimenin Türkçe ve İngilizce karşılığı arasında geçiş yapma
* Kartı çevirerek kelimenin diğer dildeki karşılığını görüntüleme
* Metinden sese özelliğiyle kelimenin telaffuzunu dinleme
* Son görüntülenen kartın sırasını hatırlama

#### Çoktan Seçmeli Test

* Kayıtlı kelimelerden rastgele sorular oluşturma
* Çoktan seçmeli cevap seçenekleri
* Doğru ve yanlış cevap kontrolü
* Oturum boyunca puan takibi

### Oturum ve Arayüz Özellikleri

* Açılış ekranı
* Giriş ekranı
* Ana sayfa, pratik, araçlar ve iletişim ekranları arasında alt menüyle gezinme
* Son görüntülenen bilgi kartı sırasını `shared_preferences` ile saklama

## Kullanılan Teknolojiler

* **Framework:** Flutter
* **Programlama Dili:** Dart
* **Dart SDK:** `^3.6.0`
* **Durum Yönetimi:** `provider`, `flutter_bloc`
* **Yerel Veritabanı:** `sqflite`
* **Ağ İstekleri:** `dio`, `http`
* **Metinden Sese:** `flutter_tts`
* **Yerel Tercihler:** `shared_preferences`
* **Arayüz Yardımcıları:** `flutter_svg`, `fluttertoast`

## Proje Yapısı

```text
Kelime-Lab/
├── lib/
│   ├── main.dart
│   ├── db/                 # SQLite veri erişim katmanı
│   ├── controller/         # Provider tabanlı controller sınıfları
│   ├── cubit/              # Bloc/Cubit durum yönetimi
│   ├── model/              # Veri modelleri
│   ├── util/               # Yardımcı sınıflar ve widget'lar
│   └── views/              # Uygulama ekranları
├── assets/                 # Görseller, ikonlar ve fontlar
├── test/                   # Flutter testleri
└── pubspec.yaml            # Proje bağımlılıkları ve yapılandırması
```

## Gereksinimler

Projeyi çalıştırabilmek için aşağıdaki araçların sisteminizde kurulu olması gerekir:

* Flutter SDK
* Dart SDK
* Hedef platform için gerekli geliştirme araçları
* Android için Android Studio veya uygun Android SDK kurulumu
* iOS ve macOS için Xcode
* Windows masaüstü geliştirme için Visual Studio

Flutter kurulumunuzu kontrol etmek için:

```bash
flutter doctor
```

## Kurulum

### 1. Projeyi klonlayın

```bash
git clone https://github.com/hincim/Kelime-Lab.git
cd Kelime-Lab
```

### 2. Bağımlılıkları yükleyin

```bash
flutter pub get
```

### 3. Uygulamayı çalıştırın

```bash
flutter run
```

Kullanılabilir cihazları listelemek için:

```bash
flutter devices
```

Belirli bir cihazda çalıştırmak için:

```bash
flutter run -d cihaz_kimligi
```

## Giriş Bilgileri

Mevcut uygulama sürümünde giriş kontrolü sabit kullanıcı bilgileri üzerinden yapılmaktadır.

İlgili ekran:

```text
lib/views/LoginPage.dart
```

Giriş bilgileri:

```text
E-posta: hakan@gmail.com
Şifre: 123456
```

> Bu bilgiler yalnızca mevcut geliştirme ve test akışı için kullanılmaktadır. Gerçek bir uygulamada güvenli bir kimlik doğrulama sistemi kullanılmalıdır.

## Mevcut Uygulama Notları

* `ToolsPage` şu anda yalnızca `"Araçlar Ekranı"` metnini gösteren bir taslak ekrandır.
* `SignInPage` kullanıcı arayüzü hazırlanmıştır ancak kayıt işlemleri henüz uygulanmamıştır.
* İletişim panelinde sabit olarak tanımlanmış bir e-posta adresi bulunmaktadır.
* Giriş bilgileri kaynak kod içerisinde sabit olarak tutulmaktadır.
* Kelime verileri yerel SQLite veritabanında saklanır.

## Testler

Projede bulunan Flutter testlerini çalıştırmak için:

```bash
flutter test
```

Belirli bir test dosyasını çalıştırmak için:

```bash
flutter test test/dosya_adi_test.dart
```

## Desteklenen Platformlar

Kelime Lab aşağıdaki platformları destekleyecek şekilde yapılandırılmıştır:

* Android
* iOS
* Web
* Windows
* Linux
* macOS

Platform desteği, geliştirme ortamınıza ve gerekli araçların sisteminizde kurulu olmasına bağlıdır.


## Gelecekte Eklenebilecek Özellikler

* Gerçek kullanıcı kayıt sistemi
* Güvenli kimlik doğrulama
* Kullanıcıya özel kelime listeleri
* Bulut senkronizasyonu
* Yeni test ve pratik modları
* Kelime kategorileri
* Öğrenme istatistikleri
* Günlük çalışma hedefleri
* Favori kelimeler
* Araçlar ekranı için yeni işlevler

## Geliştirici

**hincim**

GitHub deposu:

```text
https://github.com/hincim/Kelime-Lab
```

---

Projeyi faydalı bulduysanız GitHub üzerinden yıldız verebilirsiniz.
