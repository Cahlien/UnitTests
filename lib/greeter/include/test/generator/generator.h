#ifndef GREETER_GENERATOR_TEST_H
#define GREETER_GENERATOR_TEST_H

#include <QObject>
#include <QTest>

class TestGenerator : public QObject
{
    Q_OBJECT
private slots:
            void testConstructor();

    void testGenerator();
};

#endif
