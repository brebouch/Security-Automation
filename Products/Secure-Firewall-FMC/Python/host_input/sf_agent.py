import signal
import sys
from sf_log import SFHILog


class SFHostInputAgent:
    def __init__(self):
        self.VERSION = '1.0.1-8'
        self.DEFAULT_PORT = 8307
        self.sendData_max_size = 4000
        self.sendData_buf = ''
        self.sendData_buf_len = 0
        signal.signal(signal.SIGTERM, self.signalHandler)
        signal.signal(signal.SIGINT, self.signalHandler)

    def signalHandler(self, signum, frame):
        if 'CLIENT' in self.__dict__ and self.CLIENT:
            self.CLIENT.close()
            self.LOG.log(SFHILog.INFO, "Client closed on Socket.")
        self.LOG.log(SFHILog.INFO, f"-Caught Signal ({signum})")
        sys.exit(1)

    def getLogger(self):
        return self.LOG

    def getOptions(self):
        return self.OPTIONS

    def processCommandLine(self, opts):
        ipv6_flag = opts.get('ipv6')
        log_params = {
            'syslog': opts.get('syslog'),
            'stderr': opts.get('stderr'),
            'logfile': opts.get('logfile'),
            'loglevel': opts.get('level')
        }

        if 'plugin' not in opts:
            self.LOG.log(SFHILog.ERROR, "Please Specify Which Plugin Will Be Using")
            self.usage()

        self.OPTIONS = opts
        self.LOG = SFHILog(log_params)

    def printOptions(self):
        str = "\n\nCommand Options:\n"
        for opt, value in self.OPTIONS.items():
            if isinstance(value, SFHILog):
                str += f"\t- {opt}: SFHILog\n"
            elif opt != 'runondc' and value:
                str += f"\t- {opt}: {value}\n"
        self.LOG.log(SFHILog.DEBUG, f"{str}\n")

    def process(self):
        opts = self.OPTIONS
        if opts.get('runondc') == 'y' or opts.get('csvfile'):
            if opts.get('server') or opts.get('port') or opts.get('pkcs12') or opts.get(
                    'password') or opts.get('ipv6'):
                log_str = ''
                log_str += f"-server {opts['server']} " if opts.get('server') else ''
                log_str += f"-port {opts['port']} " if opts.get('port') else ''
                log_str += f"-pkcs12 {opts['pkcs12']} " if opts.get('pkcs12') else ''
                log_str += f"-password {opts['password']} " if opts.get('password') else ''
                log_str += f"-ipv6 {opts['ipv6']} " if opts.get('ipv6') else ''
        self.printOptions()
