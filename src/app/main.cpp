#include "src/app/main.h"
#include "src/caller/caller.h"
#include "src/generator/generator.h"
#include "src/app/temp.hpp"
#include <iostream>

int main(int argc, char *argv[])
{
    TemplateClass<int> temp{};

    std::cout << temp.doSomething();
    QGuiApplication app(argc, argv);

    qmlRegisterType<Generator>("dev.crowell.test.greeter", 0, 1, "Greeter");
    qmlRegisterType<Caller>("dev.crowell.test.closer", 0, 1, "Closer");

    QTranslator translator;
    const QStringList uiLanguages = QLocale::system().uiLanguages();
    for (const QString &locale : uiLanguages) {
        const QString baseName = "UnitTests_" + QLocale(locale).name();
        if (translator.load(":/i18n/" + baseName)) {
            app.installTranslator(&translator);
            break;
        }
    }

    QQmlApplicationEngine engine;
    auto* context{engine.rootContext()};

    const QUrl url(u"qrc:/ui/windows/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
