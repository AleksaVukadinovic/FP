#include <cctype>
#include <iostream>
#include <string>
#include <vector>

#include <range/v3/all.hpp>

using namespace ranges;


std::string to_camel(const std::string& s) {
    return s
        | views::split('_')
        | views::transform([](auto&& w) {
            return w | ranges::to<std::string>();
        })
        | views::enumerate
        | views::transform([](auto p) {
            auto [i, word] = p;
            if (i != 0 && !word.empty())
                word[0] = std::toupper((unsigned char)word[0]);
            return word;
        })
        | views::join
        | ranges::to<std::string>();
}


std::vector<std::string> to_camel(const std::vector<std::string>& v) {
    return v
        | views::transform([](const std::string& s) { return to_camel(s); })
        | ranges::to<std::vector<std::string>>();
}

int main() {
    return 0;
}
