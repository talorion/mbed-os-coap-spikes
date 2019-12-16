#include "CppUTest/TestHarness.h"
#include "CppUTest/CommandLineTestRunner.h"

#include<string>

constexpr const char LWM2M_SERVER_ADDR[]="qa-iot.world-direct.at";
constexpr uint16_t LWM2M_SERVER_PORT=5694;

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
