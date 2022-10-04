#include <random>

#include "generator/generator.h"

QString Generator::greet()
{
    std::vector<QString> greetings{
        "Hello World", 
        "Hello, World!", 
        "HELLO WORLD", 
        "hello world", 
        "Hello, world"
    };

    std::random_device rd;
    std::mt19937 gen{rd()};
    std::uniform_int_distribution<> dis{0, static_cast<int>(greetings.size()) - 1};

    return greetings[dis(gen)];
}
