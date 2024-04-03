import getopt
import sys
from sf_agent import SFHostInputAgent


def main():
    try:
        opts, _ = getopt.getopt(sys.argv[1:], "p:k:w:i:s:r:c:y:l:e:m:g:",
                                ["port=", "pkcs12=", "password=",
                                 "plugininfo=", "server=", "runondc=",
                                 "csvfile=", "syslog", "stderr", "logfile=",
                                 "level=", "ipv6"])
    except getopt.GetoptError as err:
        print(str(err))
        sys.exit(2)

    parsed_opts = {}
    for opt, arg in opts:
        if opt in ("-p", "--port"):
            parsed_opts["port"] = int(arg)
        elif opt in ("-k", "--pkcs12"):
            parsed_opts["pkcs12"] = arg
        elif opt in ("-w", "--password"):
            parsed_opts["password"] = arg
        elif opt in ("-i", "--plugininfo"):
            parsed_opts["plugininfo"] = arg
        elif opt in ("-s", "--server"):
            parsed_opts["server"] = arg
        elif opt in ("-r", "--runondc"):
            parsed_opts["runondc"] = arg
        elif opt in ("-c", "--csvfile"):
            parsed_opts["csvfile"] = arg
        elif opt in ("-y", "--syslog"):
            parsed_opts["syslog"] = True
        elif opt in ("-l", "--logfile"):
            parsed_opts["logfile"] = arg
        elif opt in ("-e", "--stderr"):
            parsed_opts["stderr"] = True
        elif opt in ("-m", "--level"):
            parsed_opts["level"] = int(arg)
        elif opt in ("-g", "--ipv6"):
            parsed_opts["ipv6_flag"] = True

    try:
        agent = SFHostInputAgent()
        agent.processCommandLine(parsed_opts)
        agent.process()
    except Exception as e:
        print("Error detected during run of Host Input Agent:", str(e))
        sys.exit(2)


if __name__ == "__main__":
    main()
