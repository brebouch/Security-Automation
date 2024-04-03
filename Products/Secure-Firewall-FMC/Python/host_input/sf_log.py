import sys
import syslog
import time

(ERROR, WARNING, INFO, DEBUG) = (0, 1, 2, 3)

levels = {
    ERROR: {'str': "ERROR", 'syslog_type': syslog.LOG_ERR},
    WARNING: {'str': "WARNING", 'syslog_type': syslog.LOG_WARNING},
    INFO: {'str': "INFO", 'syslog_type': syslog.LOG_INFO},
    DEBUG: {'str': "DEBUG", 'syslog_type': syslog.LOG_DEBUG},
}


class SFHILog:
    def __init__(self, log_params):
        self.SYSLOG = log_params.get('syslog', False)
        self.STDERR = log_params.get('stderr', False)
        self.LOGFILE = log_params.get('logfile', './ScanAgent.log')
        self.LOGLEVEL = log_params.get('loglevel', INFO)
        self.PLUGIN = log_params.get('plugin')

        if self.SYSLOG:
            try:
                syslog.openlog(sys.argv[0], 0, syslog.LOG_USER)
            except Exception as e:
                self.STDERR = True
                self.SYSLOG = False
                self.LOGFILE = './ScanAgent.log'
                print("*** Syslog is NOT available, Logging to STDERR and default logfile: ScanAgent.log ***\n",
                      file=sys.stderr)

        if not any([self.SYSLOG, self.STDERR, self.LOGFILE]):
            self.STDERR = True

    def log(self, level, message, layer=None):
        layer = layer or 0
        date = time.strftime("%a %b %d %H:%M:%S %Y", time.localtime())
        frame = sys._getframe(layer + 1)
        file_name = frame.f_code.co_filename
        line_number = frame.f_lineno

        formatted_message = f"[{levels[level]['str']}] {message}"
        if self.LOGLEVEL == DEBUG:
            formatted_message += f" [{file_name}, {line_number}]"

        if self.SYSLOG and level <= self.LOGLEVEL:
            syslog.syslog(levels[level]['syslog_type'], formatted_message)

        formatted_message = f"{date} {formatted_message}\n"

        if self.STDERR and level <= self.LOGLEVEL:
            sys.stderr.write(formatted_message)

        if self.LOGFILE and level <= self.LOGLEVEL:
            with open(self.LOGFILE, 'a') as log_file:
                log_file.write(formatted_message)
