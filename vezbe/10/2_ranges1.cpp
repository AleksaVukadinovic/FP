#include <iostream>
#include <vector>
#include <cstdlib>
#include <range/v3/view.hpp>

using namespace ranges::v3;
using namespace std::placeholders;

template<typename Pred, typename Acc, typename Collection>
Acc filtered_sum(Pred predicate, Acc init, const Collection& collection) {
    return std::accumulate(collection | view::filter(predicate), init);
}


int main() {
    std::vector<int> collection{-1, -3, -5, 1, 3, 5};

    std::cout << filtered_sum(
        [] (auto val) { return val > 0; },
        0,
        collection
    ) << '\n';

    return 0;
}
