#include "CppUTest/TestHarness.h"
#include "CppUTest/CommandLineTestRunner.h"

TEST_GROUP(Example)
{
    void setup()
    {
    }

    void teardown()
    {
    }
};

TEST(Example, test1)
{
    FAIL("Fail me!");
}

int main( int argc, const char* argv[] )
{
    return CommandLineTestRunner::RunAllTests(argc, argv);
}
