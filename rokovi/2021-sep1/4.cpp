#include <cctype>
#include <string>
#include <range/v3/all.hpp>

using namespace ranges;

char transformChar(std::size_t i, char c) {
    bool even = (i % 2 == 0);
    if (std::isalpha((unsigned char)c))
        return even ? std::toupper((unsigned char)c) : std::tolower((unsigned char)c);
    if (std::isdigit((unsigned char)c)) {
        int d = c - '0';
        d = even ? (d + 1) % 10 : (d + 9) % 10;   // -1 ciklicno = +9 mod 10
        return char('0' + d);
    }
    return c;
}

std::string transformString(const std::string& s) {
    return s
        | views::enumerate                       // (indeks, znak)
        | views::transform([](auto p){ auto [i, c] = p; return transformChar(i, c); })
        | ranges::to<std::string>();
}
