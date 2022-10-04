#ifndef CLOSER_CALLER_H
#define CLOSER_CALLER_H

#ifdef CLOSER_EXPORTS
    #ifdef _WIN32
        #define CLOSER_API __declspec(dllexport)
    #elif __GNUC__ >= 4
        #define CLOSER_API __attribute__((visibility("default")))
    #else
        #define CLOSER_API
    #endif
#else
    #ifdef _WIN32
        #define CLOSER_API __declspec(dllimport)
    #else
        #define CLOSER_API
    #endif
#endif

#include<QGuiApplication>
#include<QObject>

class CLOSER_API Caller : public QObject
{
Q_OBJECT
public:
    explicit Caller(QObject* parent = nullptr);
    ~Caller() override;
    Q_INVOKABLE void close();
signals:
    void exit();

private slots:
    void onExit();
};

#endif     
