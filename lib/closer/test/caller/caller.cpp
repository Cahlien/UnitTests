#include "test/caller/caller.h"
#include "src/caller/caller.h"
#include <QSignalSpy>
#include <QTest>

#include <iostream>

QTEST_MAIN(TestCaller)

void TestCaller::testConstructor()
{
    qDebug() << "TestCaller::testConstructor()";
    std::unique_ptr<Caller> caller{std::make_unique<Caller>()};
    QVERIFY(caller.get() != nullptr);
}

void TestCaller::testExit()
{
    std::unique_ptr<Caller> caller{std::make_unique<Caller>()};
    QSignalSpy spy{caller.get(), &Caller::exit};
    caller->close();
    QCOMPARE(spy.count(), 1);
}