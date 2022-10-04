//
// Created by Matthew Crowell on 10/2/2022.
//

#ifndef UNITTESTS_TEMP_HPP
#define UNITTESTS_TEMP_HPP

#include <string>

template<typename T>
class TemplateClass
{
public:
    TemplateClass() = default;
    ~TemplateClass() = default;
    std::string doSomething()
    {
        return "I did something!\n";
    }
};

#endif //UNITTESTS_TEMP_HPP
