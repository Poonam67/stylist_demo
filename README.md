# Stylist Demo App

A Flutter application to showcase search functionality with products API list and details.

---

## 📱 Screenshots

### 🤖 Android

| Home Screen | Detail Screen | 
|-------------|----------------|
| ![Android Home](https://github.com/Poonam67/stylist_demo/blob/main/screenshots/android/android1.png?raw=true) | ![Android Detail](https://github.com/Poonam67/stylist_demo/blob/main/screenshots/android/android2.png?raw=true) |

---

### 🍎 iOS

| Home Screen | Profile Screen | 
|-------------|----------------|
| ![iOS Home](https://github.com/Poonam67/stylist_demo/blob/main/screenshots/ios/ios1.png?raw=true) | ![iOS Details](https://github.com/Poonam67/stylist_demo/blob/main/screenshots/ios/ios2.png?raw=true) | 

---

### 🖥️ Web

| Home Screen | Details Screen |
|-------------|------------------|
| ![Web Home](https://github.com/Poonam67/stylist_demo/blob/main/screenshots/web/web1.png?raw=true) | ![Web Details](https://github.com/Poonam67/stylist_demo/blob/main/screenshots/web/web2.png?raw=true) |


---

## 🛠️ Setup Instructions

To run this project locally:

1. **Clone the repository:**

   ```bash
   git clone https://github.com/Poonam67/stylist_demo.git
   cd tyre_demo


## 🔁 State Management

The app uses the **`Provider`** pattern for scalable and reactive state management.

---

### 🧠 Core Concepts

- ✅ **ChangeNotifier** is used to create reactive ViewModels  
- ✅ **Separation of concerns** between UI and business logic using MVVM
- ✅ **Real-time updates**: UI listens to changes and rebuilds automatically  
- ✅ Promotes **testability** and **maintainability** of the codebase  

---

### 📂 Structure

```bash
lib/
├── viewmodels/
│   └── home_view_model.dart     # Uses ChangeNotifier
├── ui/
│   ├── screens/
│   └── widgets/
├── core/
│   └── models/
```
---

### 🌐 API Used

This app consumes a RESTful API to fetch stylist data and related information.

---

### 🔍 API Details

| Feature          | Endpoint URL                      | Description                      |
|------------------|-----------------------------------|----------------------------------|
| Get Products     | `https://dummyjson.com/products`  | Retrieves a list of products     |



### Example API call snippet

final response = await http.get(Uri.parse('https://dummyjson.com/products'));

if (response.statusCode == 200) {
  final data = jsonDecode(response.body);
  // Parse data to models
} else {
  throw Exception('Failed to load stylists');
}


## 📦 Packages Used

| Package                | Purpose                       |
|------------------------|-------------------------------|
| `provider`             | State management              |
| `http`                 | API calls                     |
| `carousel_slider`      | For multiple images           |
| `cached_network_image` | Load and cache network images | 
| `get_it`               | Dependency Injection          |


## 💻 Flutter Version

To check your Flutter SDK version, run the following command in your terminal:

flutter --version >> "3.32"