#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <stdlib.h>

// --- Stub implementations for missing Swift stdlib Unicode functions ---
// These are required when using String operations in Embedded Swift
bool _swift_stdlib_isExtendedPictographic(uint32_t scalar) {
    return false;
}

bool _swift_stdlib_isInCB_Consonant(uint32_t scalar) {
    return false;
}

uint8_t _swift_stdlib_getGraphemeBreakProperty(uint32_t scalar) {
    return 0;
}

uint16_t _swift_stdlib_getNormData(uint32_t scalar) {
    return 0;
}

uint32_t _swift_stdlib_getComposition(uint32_t first, uint32_t second) {
    return 0xFFFFFFFF;  // No composition
}

const uint8_t* _swift_stdlib_nfd_decompositions = NULL;

uint32_t _swift_stdlib_getDecompositionEntry(uint32_t scalar) {
    return 0;
}

// --- readLine() hook ---
// Swift calls swift_stdlib_readLine_stdin(&utf8Start) and frees with _swift_stdlib_free.
// So we malloc() and return count.
int swift_stdlib_readLine_stdin(uint8_t **outBuf) {
    if (!outBuf) {
        return -1;
    }

    // Read from stdin
    char temp[256];
    if (fgets(temp, sizeof(temp), stdin) == NULL) {
        // EOF or error
        return 0;
    }

    // Copy data to the output buffer
    size_t len = strlen(temp);
    *outBuf = malloc(len);
    if (!*outBuf) {
        return -1;
    }
    memcpy(*outBuf, temp, len);
    return (int)len;
}
