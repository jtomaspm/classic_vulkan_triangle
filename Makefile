CC=g++
CFLAGS= -std=c++17 -O2 -Wall -Wextra -Werror -DNDEBUG
DUBUGFLAGS= -std=c++17 -O0 -Wall -Wextra -Werror -g -DDEBUG
LDFLAGS= -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi

MAIN=main.cpp

BIN=app

$(BIN): main.cpp
	$(CC) $(CFLAGS) -o $(BIN) $(MAIN) $(LDFLAGS)

.PHONY: debug test clean

debug: main.cpp
	$(CC) $(DUBUGFLAGS) -o $(BIN) $(MAIN) $(LDFLAGS)
	./$(BIN)

test: $(BIN)
	./$(BIN)

clean:
	rm -f $(BIN)