#define _CRT_SECURE_NO_WARNINGS

#include <iostream>
#include <sstream>
#include <iomanip>
#include <windows.h>
#include <vector>
#include <ctime>
#include <fstream>
#include <direct.h>

#define SHA256_HASH_SIZE 32

using namespace std;

string bytes_to_hex(const std::vector<unsigned char>& bytes) {
    std::ostringstream oss;
    for (auto byte : bytes) {
        oss << std::hex << std::setw(2) << std::setfill('0') << (int)byte;
    }
    return oss.str();
}

string compute_sha256(const std::string& input) {
    HCRYPTPROV hProv = 0;
    HCRYPTHASH hHash = 0;
    std::vector<unsigned char> hash(SHA256_HASH_SIZE, 0);
    DWORD hash_len = hash.size();

    if (CryptAcquireContext(&hProv, NULL, NULL, PROV_RSA_AES, CRYPT_VERIFYCONTEXT)) {
        if (CryptCreateHash(hProv, CALG_SHA_256, 0, 0, &hHash)) {
            if (CryptHashData(hHash, reinterpret_cast<const BYTE*>(input.c_str()), input.size(), 0)) {
                if (CryptGetHashParam(hHash, HP_HASHVAL, hash.data(), &hash_len, 0)) {
                    CryptDestroyHash(hHash);
                    CryptReleaseContext(hProv, 0);
                    return bytes_to_hex(hash);
                }
            }
            CryptDestroyHash(hHash);
        }
        CryptReleaseContext(hProv, 0);
    }
    return "";
}

string generate_random_string(int length) {
    string chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    string random_string;
    srand(static_cast<unsigned>(time(0)));

    for (int i = 0; i < length; ++i) {
        random_string += chars[rand() % chars.length()];
    }
    return random_string;
}

void store_mined_data(const string& mined_data) {
    string folder_path = "C:\\DummyCryptoMiner";

    if (_mkdir(folder_path.c_str()) != 0 && errno != EEXIST) {
        cerr << "Error creating directory at " << folder_path << endl;
        return;
    }

    time_t t = time(nullptr);
    tm* now = localtime(&t);
    char filename[100];
    strftime(filename, sizeof(filename), "crypto_bro.txt", now);

    string file_path = folder_path + "\\" + filename;

    ofstream file(file_path, std::ios::app);
    if (file.is_open()) {
        file << mined_data << endl;
        file.close();
    }
    else {
        cerr << "Unable to open file at " << file_path << endl;
    }
}

int main() {
    while (true) {
        string random_value = generate_random_string(64);
        string mined_hash = compute_sha256(random_value);
        store_mined_data(mined_hash);

        Sleep(1000);
    }

    return 0;
}
