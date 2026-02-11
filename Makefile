CC=g++
CFLAGS= -std=c++17 -O2 -Wall -Wextra -Werror -DNDEBUG
DUBUGFLAGS= -std=c++17 -O0 -Wall -Wextra -Werror -g -DDEBUG
LDFLAGS= -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi

MAIN=main.cpp

BIN=app

$(BIN): main.cpp shaders
	$(CC) $(CFLAGS) -o $(BIN) $(MAIN) $(LDFLAGS)

.PHONY: debug test clean

debug: main.cpp shaders
	$(CC) $(DUBUGFLAGS) -o $(BIN) $(MAIN) $(LDFLAGS)
	./$(BIN)

test: $(BIN)
	./$(BIN)

shaders: shaders/frag.spv shaders/vert.spv

shaders/frag.spv: shaders/shader.frag
	glslc $< -o $@

shaders/vert.spv: shaders/shader.vert
	glslc $< -o $@

clean:
	rm -f $(BIN)
	rm -f shaders/frag.spv
	rm -f shaders/vert.spv