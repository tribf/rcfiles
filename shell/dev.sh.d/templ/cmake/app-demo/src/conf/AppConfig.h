///////////////////////////////////////////////////////////////////////////////
/// @brief the description of the file
/// @author tribf tribf@tribf.com
/// @version 1.0
/// @date 19-2-12
/// @note
///////////////////////////////////////////////////////////////////////////////

#ifndef APPCONFIG_H
#define APPCONFIG_H

#include <string>
#include <fstream>
#include <jsoncpp/json/json.h>
#include <log/Logger.h>

using namespace std;

class AppConfig {
public:
    bool loadAppConf(const char *app_home) {
        this->app_home = string(app_home);

        string app_cfgfile = this->app_home + "/conf/app_config.json";

        ifstream ifs(app_cfgfile);
        Json::Reader reader;
        Json::Value conf;

        bool b = reader.parse(ifs, conf);
        if (!b) {
            ERROR("%s", reader.getFormattedErrorMessages().c_str());
            return false;
        } else {
            this->version = conf["version"].asString();
        }
    }

    string buildConfAbsPath(string filename) {
        return this->app_home + "/conf/" + filename;
    }

private:
    string app_home;
    string version;
};

#endif //APPCONFIG_H
