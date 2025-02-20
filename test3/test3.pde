import geomerative.*;

RShape grp;
RPoint[][] pointPaths;

float xmag = 0, ymag = 0;
float z = 0;

boolean ignoringStyles = false;
boolean isDragging = false;  // Flag to check if mouse is being dragged
float lastMouseX, lastMouseY;  // Store the last mouse position

float initialX = 0, initialY = 0;  // Store the initial position of the image

PFont romanticFont;  // Declare font variable

float sensitivity = 0.0005;  // Adjust this value to control the mouse sensitivity
float returnSpeed = 0.05;  // Speed at which the object returns to the original position

void setup() {
  size(800, 600, P3D);  // Set the canvas size here
  
  // Initialize the library
  RG.init(this);
  RG.ignoreStyles(ignoringStyles);

  // Load the SVG file
  grp = RG.loadShape("file2.svg");

  if (grp == null) {
    println("Error: SVG file not loaded properly.");
    exit();
  }

  // Center the shape and prepare the point paths
  grp.centerIn(this.g, 100, 1, 1);
  pointPaths = grp.getPointsInPaths();

  // Store the initial position of the image
  initialX = grp.getX();
  initialY = grp.getY();

  // Set up the text
  Font = createFont("Georgia", 32); 
  textFont(Font);  // Apply the font
  textSize(32);  // Set text size
  fill(255, 255, 150);  // Soft yellow color for the text
}

float smoothSpeed = 0.05;  // Control the speed of smoothing
float verticalTiltSpeed = 0.05;  // Speed of the vertical tilt effect

void draw() {
  // Drawing code
  translate(width / 2, height / 2);

  if (isDragging) {
    // Calculate the change in mouse position
    float deltaX = mouseX - lastMouseX;
    float deltaY = mouseY - lastMouseY;

    // Update rotation angles based on mouse movement and sensitivity
    xmag += deltaX * sensitivity;
    ymag -= deltaY * verticalTiltSpeed * sensitivity;  // Inverted for a natural feel

    // Smooth out the rotation
    xmag += (deltaX * smoothSpeed - xmag) * smoothSpeed;
    ymag += (deltaY * verticalTiltSpeed - ymag) * verticalTiltSpeed;
  } else {
    // Smoothly return to the original position when not dragging
    xmag = lerp(xmag, 0, returnSpeed);  // Smooth transition to 0 (original position)
    ymag = lerp(ymag, 0, returnSpeed);  // Smooth transition to 0 (original position)
  }

  // Apply the rotations: Horizontal on Y-axis, Vertical on X-axis
  rotateY(-xmag);
  rotateX(ymag);  // Apply the vertical tilt
  
  // Set the background to dark purple
  background(30, 0, 30);

  // Apply lighting effects
  directionalLight(255, 204, 255, 1, 0, -1);  
  directionalLight(255, 180, 200, -1, 0, -1); 
  ambientLight(150, 100, 200);
  
  // Introduce a soft glowing effect
  float newMouseY = map(mouseY, 0, 1000, 0, 100);
  z = 1 * sin(newMouseY / 500.0 * PI);
  
  // Add text
  textAlign(CENTER, CENTER);  // Center the text
  text("top", 0, -200);  // Display text at the top
  text("bottom", 0, 200);
  
  for (int i = 0; i < pointPaths.length; i++) {
    translate(0, 0, z);

    if (mouseX > displayWidth / 2) {
      if (pointPaths[i] != null) {
        beginShape(POINTS);
        for (int j = 0; j < pointPaths[i].length; j++) {
          vertex(pointPaths[i][j].x, pointPaths[i][j].y);
          
          // Apply multiple colors to the grains
          if (mouseX > 500) {
            // Light purple when mouse is on the right side
            stroke(255, 150, 255);
            vertex(pointPaths[i][j].x, pointPaths[i][j].y);
            stroke(255);
            vertex(pointPaths[i][j].x + 10, pointPaths[i][j].y + 10);
          }
          
          if (random(1) > 0.98) {  // Further reduced frequency of yellow stroke
            stroke(255, 255, 0, 100);  // Slightly less alpha transparency for a softer effect
            point(pointPaths[i][j].x, pointPaths[i][j].y);
          }
        }
        endShape();
      }
    }

    if (mouseX < displayWidth / 2) {
      if (pointPaths[i] != null) {
        beginShape(POINTS);
        for (int j = 0; j < pointPaths[i].length; j++) {
          vertex(pointPaths[i][j].x, pointPaths[i][j].y);
          
          // Apply multiple colors to the grains
          if (mouseX < displayWidth / 2) {
            stroke(100, 150, 255);
            vertex(pointPaths[i][j].x, pointPaths[i][j].y);
            stroke(255);
            vertex(pointPaths[i][j].x + 2, pointPaths[i][j].y + 2);
          }

          // Make the yellow grain effect more subtle
          if (random(1) > 0.98) {  // Further reduced frequency of yellow stroke
            stroke(255, 255, 0, 100);  // Slightly less alpha transparency for a softer effect
            point(pointPaths[i][j].x, pointPaths[i][j].y);
          }
        }
        endShape();
      }
    }
  }
}

void mousePressed() {
  isDragging = true;  // Start dragging when mouse is pressed
  lastMouseX = mouseX;  // Update last mouse position
  lastMouseY = mouseY;
}

void mouseReleased() {
  isDragging = false;  // Stop dragging when mouse is released
}

