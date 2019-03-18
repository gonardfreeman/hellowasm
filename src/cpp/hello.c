#include <emscripten/emscripten.h>

int EMSCRIPTEN_KEEPALIVE bar(int a, int b) {
    return a * b;
};