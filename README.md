# 📦 App OngKir - Indonesian Shipping Cost Calculator

A mobile application to calculate shipping costs between cities in Indonesia using the RajaOngkir API.

## ✨ Key Features

- Real-time shipping cost calculation
- Origin and destination city selection across Indonesia
- Support for multiple shipping carriers
- User-friendly interface
- Accurate cost estimation

## 🚀 Technology Stack

- Flutter
- Dart
- RajaOngkir API
- HTTP package for network requests

## 📹 Demo Video

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/WmINECXwJKI/0.jpg)](https://youtube.com/shorts/WmINECXwJKI?si=ZuxR2Pr0EWZRiA-t)

## 📱 Screenshots

<p align="center">
  <img src="https://github.com/user-attachments/assets/43d94e2f-b58d-40cc-9377-661a44742ac5" width="200" hspace="10">
  <img src="https://github.com/user-attachments/assets/0309048d-235a-4c3a-a581-e67a35e4b4ff" width="200" hspace="10">
  <img src="https://github.com/user-attachments/assets/9313c56d-934a-4193-9562-53562a132492" width="200" hspace="10">
</p>

## 🛠️ Installation

1. Make sure you have Flutter SDK installed and environment setup
2. Clone this repository
```bash
git clone https://github.com/wildanarkan/app_ongkir.git
```
3. Navigate to project directory
```bash
cd app_ongkir
```
4. Install dependencies
```bash
flutter pub get
```
5. Run the application
```bash
flutter run
```

## 🔑 API Configuration

1. Register an account at [RajaOngkir](https://rajaongkir.com/)
2. Get your API key
3. Create a `.env` file in the project root
4. Add your API key:
```
RAJAONGKIR_API_KEY=your_api_key_here
```

## 💡 How to Use

1. Open the application
2. Select origin city
3. Select destination city
4. Enter package weight (in grams)
5. Choose shipping carrier
6. System will display shipping cost estimation

## 🌟 Features in Detail

### Supported Shipping Carriers
- JNE
- TIKI
- POS Indonesia

### Cost Calculation
- Real-time rates from RajaOngkir API
- Support for various service levels (Regular, Express, etc.)
- Weight-based calculation
- Distance consideration

### City Coverage
- All major cities in Indonesia
- Accurate postal codes
- Updated city database
