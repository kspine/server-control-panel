#ifndef SELFUPDATER_H
#define SELFUPDATER_H

#include <QJsonObject>
#include <QObject>

namespace Updater
{
    class SelfUpdater : public QObject
    {
        Q_OBJECT

        public:
            SelfUpdater();
            ~SelfUpdater();

            void run();
            bool updateAvailable();            

            void downloadNewVersion();
            void switchToNewExecutable();

            void indicateNeedForRestart();

        private:
            QString getUpdateCheckURL();
            QJsonObject getVersionInfo();
            QJsonObject versionInfo;

        signals:
            QJsonObject notifyUpdateAvailable(QJsonObject versionInfo);

    };

}

#endif // SELF_UPDATE_H