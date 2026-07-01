#include <fstream>
#include <iostream>
#include <iterator>
#include <string>
#include <variant>
#include <cassert>

class program_t {
private:
    class init_t {

    };

    class running_t {
        public:
            running_t(const std::string &file_name) : m_file(file_name) {}

            void count_words() {

            }

            unsigned count() const {
                return m_count;
            }

        private:
            unsigned m_count = 0;
            std::ifstream m_file;
    };

    class finished_t {
        public:
            finished_t(unsigned count = 0): m_count(count) {}

            unsigned count() const { return m_count;}
        private:
            unsigned m_count;
    }



public:
    program_t() : m_state(init_t()) {}

    void count_words(const std::string &file_name) {

    }
};

int main() {
    program_t program;
    program.count_words("main.cpp");

    std::cout << program.count() << std::endl;
}
