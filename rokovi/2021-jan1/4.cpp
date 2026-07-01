#include <iostream>
#include <string>
#include <range/v3/all.hpp>

using namespace ranges;

// "aaabbb" -> "3a3b"  (run-length encoding)
std::string compress(const std::string& s) {
    return s
        | views::group_by([](char a, char b){ return a == b; })
        | views::transform([](auto block){
            return std::to_string(ranges::distance(block)) + std::string(1, ranges::front(block));
        })
        | views::join
        | ranges::to<std::string>();
}

int main() {
    std::cout << compress("aaabbb")    << "\n";   // ocekivano: 3a3b
    std::cout << compress("aaabccccd") << "\n";   // ocekivano: 3a1b4c1d
    std::cout << compress("a")         << "\n";   // ocekivano: 1a
    std::cout << compress("aabbaa")    << "\n";   // ocekivano: 2a2b2a
    std::cout << compress("")          << "\n";   // ocekivano: (prazno)
}
