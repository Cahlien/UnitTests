#ifndef CLOSER_CALLER_TEST_H
#define CLOSER_CALLER_TEST_H

#include <QTest>
#include <QObject>

class TestCaller : public QObject
{
Q_OBJECT
private slots:
    void testConstructor();
    void testExit();
};

#endif
