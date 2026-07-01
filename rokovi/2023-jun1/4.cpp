#include <string>
#include <range/v3/all.hpp>

using namespace ranges;

int minChanges(const std::string& s) {
    auto changesPerRun = s
        | views::group_by([](char a, char b){ return a == b; })   // blokovi uzastopnih istih
        | views::transform([](auto run){                          // blok duzine L -> L/3 izmena
            return static_cast<int>(ranges::distance(run)) / 3;
        });
    return ranges::accumulate(changesPerRun, 0);                  // saberi po blokovima
}

int main() {}
