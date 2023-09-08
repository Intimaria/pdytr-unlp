#include "checksum.h"

void calculate_checksum(const char *data, size_t len, unsigned char *output) {
    SHA256_CTX sha256;
    SHA256_Init(&sha256);
    SHA256_Update(&sha256, data, len);
    SHA256_Final(output, &sha256);
}
