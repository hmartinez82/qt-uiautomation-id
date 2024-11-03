#include <QApplication>
#include <QQmlApplicationEngine>
#include <iostream>
#include "form.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    if (argc < 2)
    {
        std::cout << "'widget' or 'quick' must be passed as a param" << std::endl;
        return -1;
    }
    auto testType = QString::fromLocal8Bit(argv[1]);

    if (testType == "quick")
    {
        QQmlApplicationEngine engine;
        const QUrl url(u"qrc:/Test/Main.qml"_qs);
        QObject::connect(
            &engine,
            &QQmlApplicationEngine::objectCreated,
            &app,
            [url](QObject *obj, const QUrl &objUrl) {
                if (!obj && url == objUrl)
                    QCoreApplication::exit(-1);
            },
            Qt::QueuedConnection);
        engine.load(url);
        return app.exec();
    }
    else
    {
        Form form;
        form.show();

        return app.exec();
    }
}
