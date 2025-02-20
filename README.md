## **SVG Interactive Visualizer (Processing & Geomerative)**

### **Overview**  
This project is an **interactive SVG visualizer** built using **Processing** and the **Geomerative** library. It allows users to dynamically manipulate an SVG file with **mouse interactions** and **smooth animations**, incorporating **lighting effects, color variations, and motion-based transformations** for an engaging visual experience.

### **Features**  
✅ **Interactive Mouse Control** – Dragging the mouse rotates the SVG in 3D space, while releasing it smoothly resets the position.  
✅ **Dynamic Coloring** – The stroke colors change based on mouse position, creating a visually adaptive experience.  
✅ **Lighting Effects** – Directional and ambient lights enhance depth and realism.  
✅ **Smooth Motion** – Uses `lerp()` for natural transitions and fluid animation.  
✅ **Typography Integration** – Displays text elements with custom fonts.  

### **Installation & Setup**  
#### **Prerequisites**  
- [Processing](https://processing.org/download) installed  
- [Geomerative Library](http://www.ricardmarxer.com/geomerative/) added to Processing  

#### **Steps to Run the Project**  
1. **Clone the repository:**  
   ```bash
   git clone https://github.com/yourusername/svg-visualizer.git
   cd svg-visualizer
   ```
2. **Open the Sketch in Processing**  
3. **Ensure the SVG file (`file2.svg`) is in the sketch's `data/` folder**  
4. **Run the project**  

### **Controls**  
- **Click & Drag** – Rotate the SVG dynamically  
- **Release Mouse** – Smoothly returns to the original position  
- **Move Mouse Left/Right** – Changes color dynamically  
- **Move Mouse Up/Down** – Adds a vertical tilt effect  

### **File Structure**  
```
📂 svg-visualizer
 ├── 📄 README.md
 ├── 📁 data
 │   ├── file2.svg  # The SVG file being visualized
 ├── 📄 sketch.pde  # The main Processing script
```

### **Technologies Used**  
- **Processing (P3D Mode)** – 3D rendering and visualization  
- **Geomerative Library** – SVG manipulation and point extraction  
- **Java-based Processing Syntax** – Used for interactive graphics  

### **Customization Options**  
To tweak the **mouse sensitivity, rotation speed, or return animation**, adjust these variables in the script:  
```java
float sensitivity = 0.0005;  // Adjusts rotation sensitivity  
float returnSpeed = 0.05;  // Controls the speed of resetting rotation  
float verticalTiltSpeed = 0.05;  // Adjusts vertical tilt responsiveness  
```

### **Potential Enhancements**  
🚀 **Add Gesture Support** – Implement touch-based controls for mobile devices.  
🎨 **Color Customization** – Allow users to change the color scheme dynamically.  
📂 **Load Multiple SVGs** – Enable loading different SVG files for diverse visuals.  

### **License**  
📜 This project is **open-source** under the **MIT License**. Feel free to modify and expand it!

