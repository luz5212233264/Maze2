PImage laberinto;
int jugadorX, jugadorY;
boolean ganar;

void setup() {
  size(402, 402);
  laberinto = loadImage("Laberinto.png");
  jugadorX = 10; 
  jugadorY = 10; 
  ganar = false;
}

void draw() {
  background(255);
  image(laberinto, 0, 0);

  if (!ganar) {
    moverJugador();
    verificarGanar();
  } else {
    textSize(30);
    fill(255, 0, 0);
    text("¡Ganaste!", 150, 180);
  }

  fill(0, 255, 0);
  ellipse(jugadorX, jugadorY, 10, 10); 
}

void moverJugador() {
  if (keyPressed) {
    if (keyCode == UP) {
      if (puedeMover(jugadorX, jugadorY - 1)) {
        jugadorY -= 1;
      }
    } else if (keyCode == DOWN) {
      if (puedeMover(jugadorX, jugadorY + 1)) {
        jugadorY += 1;
      }
    } else if (keyCode == LEFT) {
      if (puedeMover(jugadorX - 1, jugadorY)) {
        jugadorX -= 1;
      }
    } else if (keyCode == RIGHT) {
      if (puedeMover(jugadorX + 1, jugadorY)) {
        jugadorX += 1;
      }
    }
  }
}

boolean puedeMover(int x, int y) {
  color c = laberinto.get(x, y);
  return brightness(c) > 200; 
}

void verificarGanar() {
  if (jugadorX >= 392 && jugadorY >= 392) { 
    ganar = true;
  }
}
