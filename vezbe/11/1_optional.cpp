#include <functional>
#include <iostream>
#include <algorithm>
#include <optional>
#include <string>
#include <vector>

std::optional<std::string> user_full_name(const std::string &login) {
    return { "full name: " + login };
}

std::optional<std::string> to_html(const std::string &text) {
    return { "<p>" + text + "</p>"};
}

template <typename T>
std::optional<T> join(const std::optional<std::optional<T>> &opt) {
    if (opt) {
        return opt.value();
    } else {
        return {};
    }
}

template<typename In, typename F>
auto transform(std::optional<In> opt, F f) -> std::optional<decltype(f(opt.value()))> {
    if (opt) {
        return f(opt.value());
    } else {
        return {};
    }
}

int main() {
    // std::optional<int> i;
    // i = 5;

    // std::string s1{};
    // std::string s2("hello world");
    // std::string s3 = "hello";
    // std::string s4{'h', 'e', 'l', 'l', 'o'};

    // auto res = transform(i, isalnum);

    std::optional<std::string> login;

    std::cout << join(transform(
        join(transform(
            login,
            user_full_name
        )),
        to_html))
    << std::endl;

    return 0;
}
