#include "caller/caller.h"

Caller::Caller(QObject* parent)
        : QObject{parent}
{
    connect(this, &Caller::exit, this, &Caller::onExit);
}

Caller::~Caller()
{
    this->deleteLater();
}

void Caller::close()
{
    emit exit();
}

void Caller::onExit()
{
    QGuiApplication::exit();
}
