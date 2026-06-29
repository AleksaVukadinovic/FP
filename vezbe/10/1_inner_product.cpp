// Napisati sablonsku funkciju count_adj_equals
// koja vraca broj uzastopnih jednakih elemenata kolekcije

#include <iostream>
#include <iterator>
#include <string>
#include <numeric>
#include <vector>

template<typename T>
int count_adj_equals(const T& collection) {
    return std::inner_product(
        std::cbegin(collection),
        std::cend(collection) - 1,
        std::cbegin(collection) + 1,
        0,
        [](const int &x, const int &y){ return x + y;}, // moze i std::plus
        [](const auto &x, const auto y) {return x==y ? 1 : 0;}
    );
}

int main() {
    const std::string text = "Hiooloovoo";
    std::cerr << text << ": " << count_adj_equals(text) << '\n';
    const std::vector<double> numbers {-1.0f, 2.5f, 44.3f, 3.3f, 3.3f, 3.3f};
    std::cerr << "numbers: " << count_adj_equals(numbers) << '\n';


    return 0;
}
