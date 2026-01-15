# 🎉 Mood Evolution Counter - Flutter Assignment 3

A creative and interactive Flutter application demonstrating the powerful use of `setState()` for dynamic UI updates.

## 📱 Screenshots

<div align="center">
  <img src="assets/screenshots/screenshot1.png" width="250" alt="Initial State"/>
  <img src="assets/screenshots/screenshot2.png" width="250" alt="Mid Progress"/>
  <img src="assets/screenshots/screenshot3.png" width="250" alt="Legendary Mode"/>
</div>

## ✨ Features

### 1. 🎨 Dynamic Background Color
- Background color changes randomly with every button press
- Smooth animated transitions between colors

### 2. 😊 Emoji Mood Evolution
- Counter progresses through 9 different mood stages:
  - 😴 Sleeping (0-4)
  - 😐 Neutral (5-9)
  - 🙂 Slight Smile (10-14)
  - 😊 Happy (15-19)
  - 😄 Very Happy (20-24)
  - 😁 Grinning (25-29)
  - 🤩 Star-struck (30-34)
  - 🥳 Party Mode (35-39)
  - 🚀 Legendary (40+)

### 3. 🔷 Shape Morphing
- Container cycles through 4 different shapes every 5 counts
- Smooth shape transitions

### 4. 📏 Dynamic Size Animation
- Container grows larger as the counter increases
- Smooth AnimatedContainer transitions

### 5. 💬 Motivational Quotes
- Displays encouraging messages based on progress
- Smooth text transitions

### 6. 🎬 Scale Animation
- Container "pops" with scale effect on button press
- Provides satisfying visual feedback

## 🎮 How to Use

- **➕ Green Button** - Increment the counter
- **➖ Red Button** - Decrement the counter
- **🔄 Gray Button** - Reset to zero

## 🏗️ Project Structure
```
lib/
├── main.dart          # Entry point, MaterialApp configuration
└── home_screen.dart   # HomeScreen widget with setState() logic
```

## 🧠 setState() Concepts Demonstrated

1. **Multiple State Variables** - Managing multiple states simultaneously
2. **Conditional Rendering** - Different UI based on counter value
3. **Color Manipulation** - Random color generation
4. **Shape Transformations** - Dynamic border radius changes
5. **Size Animations** - Container size updates with smooth transitions
6. **Animation Integration** - Combining AnimationController with setState()

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK (2.17.0 or higher)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/mohddanish305/Assignment-3.git
cd Assignment-3
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## 👨‍💻 Author

**Mohd Danish**
- GitHub: [@mohddanish305](https://github.com/mohddanish305)

## 📝 Assignment Details

- **Course**: Flutter Development
- **Assignment**: Assignment-3 - Creative Use of setState()
- **Objective**: Demonstrate interactive use of setState() method for dynamic UI updates

---

⭐ If you found this project helpful, please give it a star!