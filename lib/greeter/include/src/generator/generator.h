#ifndef UNITTESTS_GENERATOR_H
    #define UNITTESTS_GENERATOR_H

    #include<QObject>
    #include<QString>

    class Generator : public QObject
    {
    Q_OBJECT
    public:
        Q_INVOKABLE QString greet();
    };

#endif // UNITTESTS_GENERATOR_H
