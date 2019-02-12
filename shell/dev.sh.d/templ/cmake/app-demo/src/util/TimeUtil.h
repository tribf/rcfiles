///////////////////////////////////////////////////////////////////////////////
/// @brief the description of the file
/// @author tribf tribf@tribf.com
/// @version 1.0
/// @date 19-2-12
/// @note
///////////////////////////////////////////////////////////////////////////////

#ifndef TIMEUTIL_H
#define TIMEUTIL_H

#include <chrono>

using namespace std;

class TimeUtil {
public:
    static int get_now_timestamp_s() {
        chrono::seconds s = chrono::duration_cast<chrono::seconds>(chrono::system_clock::now().time_since_epoch());
        return static_cast<int>(s.count());
    }

    static long long get_now_timestamp_ms() {
        chrono::milliseconds m = chrono::duration_cast<chrono::milliseconds>(
                chrono::system_clock::now().time_since_epoch());
        return m.count();
    }
};

#endif //TIMEUTIL_H
