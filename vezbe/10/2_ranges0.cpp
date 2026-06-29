#include <iostream>
#include <vector>
#include <string>
#include <cstdlib>
#include <functional>
#include <range/v3/view.hpp>

using namespace ranges::v3;
using namespace std::placeholders;

int main() {
    std::vector<int> collection{-1, -3, -5, 1, 3, 5};
    auto results = collection
        | views::transform([](int value) { return std::abs(value); })
        | views::filter(std::bind(std::less<>(), _1, 6))
        | views::transform([](auto value) { return std::to_string(value); });

    for (auto value : results)
        std::cout << value << std::endl;

    return 0;
}
