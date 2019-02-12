///////////////////////////////////////////////////////////////////////////////
/// @brief the description of the file
/// @author tribf tribf@tribf.com
/// @version 1.0
/// @date 19-2-12
/// @note
///////////////////////////////////////////////////////////////////////////////

#ifndef LOGGER_H
#define LOGGER_H

#include <string>
#include <cstdio>
#include <cstdarg>
#include <sys/time.h>

#define ERROR(fmt, ...) do{ \
	Logger::log_error(__FILE__, __FUNCTION__, __LINE__, fmt, __VA_ARGS__); \
}while(0)

//#define WARNING(...) do{\
//	fprintf(stdout, "[WARNING]%s %s(Line %d): ",__FILE__,__FUNCTION__,__LINE__); \
//	fprintf(stdout, __VA_ARGS__); \
//}while(0)
//

#define INFO(fmt, ...) do{ \
	Logger::log_info(__FILE__, __FUNCTION__, __LINE__, fmt, __VA_ARGS__); \
}while(0)




class Logger {
public:
    static void log_error(const char* filename, const char* func, int line, const char* fmt, ...) {
        fprintf(stderr, "%s [ERROR] (%s:%d:%s): ", unixtime_str2().c_str(), path_to_filename(filename).c_str(), line, func);

        va_list args;
        va_start(args, fmt);
        vfprintf(stderr, fmt, args);
        va_end(args);

        fprintf(stderr, "\n");
    }

    static void log_info(const char* filename, const char* func, int line, const char* fmt, ...) {
        fprintf(stdout, "%s [INFO] (%s:%d:%s): ", unixtime_str2().c_str(), path_to_filename(filename).c_str(), line, func);

        va_list args;
        va_start(args, fmt);
        vfprintf(stdout, fmt, args);
        va_end(args);

        fprintf(stdout, "\n");
    }

private:
    static std::string path_to_filename(std::string path) {
        return path.substr(path.find_last_of("/\\") + 1);
    }

    static std::string unixtime_str() {
        time_t now = time(nullptr);
        struct tm tstruct;
        char buf[80];
        tstruct = *localtime(&now);
        strftime(buf, sizeof(buf), "%Y-%m-%d.%X", &tstruct);
        return buf;
    }

    static std::string unixtime_str2() {
        timeval curTime;
        gettimeofday(&curTime, nullptr);
        int milli = (int) curTime.tv_usec / 1000;

        char buffer [80];
        strftime(buffer, 80, "%Y-%m-%d %H:%M:%S", localtime(&curTime.tv_sec));

        char currentTime[84] = "";
        sprintf(currentTime, "%s.%03d", buffer, milli);

        return currentTime;
    }
};
#endif //LOGGER_H
