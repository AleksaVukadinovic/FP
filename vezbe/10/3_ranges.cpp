#include <iostream>
#include <vector>
#include <functional>
#include <range/v3/view.hpp>

using namespace ranges::v3;

bool index_filter(size_t index) {
    return index % 2 != 0;
}

int main() {
    std::vector<int> xs{-1, -3, -5, 1, 2, 3};
    auto results =
        view::zip(xs, view::ints(1, unreachable))
        | view::filter([](auto value) {return index_filter(value.second);})
        | view::transform([](auto value) {return value.first;})
        ;

    return 0;
}
