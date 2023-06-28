import pygame
import os

# Set the stimulus parameters
square_size = 200
bg_color = (0, 0, 0)  # Black background color
square_color = (255, 255, 255)  # White square color
fps = 60  # Frames per second
freq1 = 13  # Blinking frequency of the first square (Hz)

# Initialize Pygame
pygame.init()
os.environ['SDL_VIDEO_WINDOW_POS'] = '0,0'
pygame.display.init()

# Set the window size to match the screen resolution
screen_info = pygame.display.Info()
window_size = (screen_info.current_w, screen_info.current_h)

# Create the Pygame window
window = pygame.display.set_mode(window_size, pygame.FULLSCREEN)
clock = pygame.time.Clock()

# Set initial position and state of the square
padding = 100
pos1 = [(window_size[0] - square_size) // 2, (window_size[1] - square_size) // 2]
is_visible1 = False

# Main game loop
running = True
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    # Toggle visibility based on frequency
    time = pygame.time.get_ticks() / 1000  # Convert milliseconds to seconds
    is_visible1 = (int(time * freq1 * 2) % 2) == 0

    # Clear the window
    window.fill(bg_color)

    # Draw the square on the window if it is visible
    if is_visible1:
        pygame.draw.rect(window, square_color, pygame.Rect(pos1[0], pos1[1], square_size, square_size))

    # Update the display
    pygame.display.flip()
    clock.tick(fps)

# Quit Pygame
pygame.quit()
