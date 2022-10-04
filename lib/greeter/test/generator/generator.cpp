#include "test/generator/generator.h"
#include "src/generator/generator.h"

QTEST_MAIN(TestGenerator)

void TestGenerator::testConstructor()
{
    std::unique_ptr<Generator> generator{new Generator{}};
    QVERIFY(generator != nullptr);
}

void TestGenerator::testGenerator()
{
    std::unique_ptr<Generator> generator{new Generator{}};
    QVERIFY(generator->greet().length() > 0);
}