.PHONY: clean 

CC = gcc

CFLAGS = -Iinclude -Iglfw-3.4/include/GLFW -Wall -g 
LDFLAGS = -Llib -lglfw3 -lwayland-client -lwayland-cursor -lwayland-egl -lxkbcommon -ldl -lGL -lpthread -lm

SRC = $(wildcard src/*.c)
OBJ = $(SRC:src/%.c=build/%.o)


main: lib/libglfw3.a $(OBJ)
	@echo "Linking $@"
	@$(CC) $^ -o $@ $(LDFLAGS)

build/%.o: src/%.c
	@mkdir -p build
	@echo "Compiling $@"
	@$(CC) -c $< -o $@ $(CFLAGS)


lib/libglfw3.a:
	@echo "Building GLFW..."
	@mkdir -p third_party/glfw/build
	@cd third_party/glfw/build && cmake .. \
		-DGLFW_BUILD_WAYLAND=ON \
		-DGLFW_BUILD_X11=OFF \
		-DGLFW_BUILD_EXAMPLES=OFF \
		-DGLFW_BUILD_TESTS=OFF \
		-DGLFW_BUILD_DOCS=OFF \
		-DBUILD_SHARED_LIBS=OFF
	@$(MAKE) -C third_party/glfw/build
	@cp third_party/glfw/build/src/libglfw3.a lib/
	@echo "Built GLFW"


clean:
	@rm -rf main build/ third_party/glfw/build lib/libglfw3.a
	@echo "sqeaky clean"
