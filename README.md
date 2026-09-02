# System Health Monitor using Bash

A lightweight **Linux System Health Monitoring tool built with Bash scripting**. This script collects important system resource information, monitors usage levels, generates warning alerts, and automatically saves reports into timestamped log files.

## Features

* Displays system hostname
* Displays current date and time
* Displays system uptime
* Monitors CPU usage
* Monitors memory usage
* Monitors disk usage
* Displays currently logged-in users
* Generates warning alerts for high resource usage
* Automatically saves system reports to log files
* Creates timestamped logs for historical monitoring

## Technologies Used

* Bash Scripting
* Linux
* `top`
* `free`
* `df`
* `uptime`
* `awk`
* `sed`
* `grep`
* `bc`

## Project Structure

```text
System-Health-Monitor/
│
├── health_monitor.sh
├── README.md
├── LICENSE
│
├── logs/
│   ├── system_health_2026-08-31_21-19-00.log
│   └── ...
│
└── screenshots/
```

## How It Works

The script collects system health information and displays it in the terminal.

It also saves the complete output into a timestamped log file.

Example:

```text
logs/system_health_2026-09-02_20-00-00.log
```

Every time the script runs, a new log file is created. This allows historical monitoring and comparison of system resource usage.

## Resource Monitoring

### CPU Usage

The script collects CPU usage using:

```bash
top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}'
```

If CPU usage exceeds **80%**, a warning alert is displayed.

Example:

```text
CPU Usage: 85%
WARNING: CPU Usage is above 80%!
```

---

### Memory Usage

Memory usage is calculated using the `free` command and `awk`.

If memory usage exceeds **80%**, the script displays a warning.

Example:

```text
Memory Usage: 85%
WARNING: Memory Usage is above 80%!
```

---

### Disk Usage

Disk usage is checked using:

```bash
df -h /
```

If disk usage exceeds **80%**, a warning alert is displayed.

Example:

```text
WARNING: Disk Usage is above 80%!
```

---

### System Uptime

The script displays how long the system has been running.

Example:

```text
Uptime: up 2 hours, 15 minutes
```

---

### Logged-in Users

The script displays currently active users and sessions using the `w` command.

---

## Logging

The script automatically creates a timestamped log file.

Example:

```text
system_health_2026-09-02_20-10-30.log
```

This is achieved using:

```bash
LOG_FILE="logs/system_health_$(date +%Y-%m-%d_%H-%M-%S).log"
```

The script uses `tee` to display output in the terminal while simultaneously saving it to the log file.

## Installation

Clone the repository:

```bash
git clone <your-repository-url>
```

Navigate to the project directory:

```bash
cd System-Health-Monitor
```

Make the script executable:

```bash
chmod +x health_monitor.sh
```

Run the script:

```bash
./health_monitor.sh
```

## Example Output

```text
==============================
    SYSTEM HEALTH MONITOR
==============================
Hostname   : linux-server
Date       : Tue Sep 2 20:00:00 PKT 2026
Uptime     : up 2 hours, 15 minutes
==============================

CPU Usage: 42%
CPU Usage is normal

==============================

Memory Usage: 35%
Memory Usage is normal

==============================

Disk Usage: 98%
WARNING: Disk Usage is above 80%!

==============================

Logged-in Users:
user1
user2
```

## Warning Thresholds

| Resource     | Warning Threshold |
| ------------ | ----------------- |
| CPU Usage    | Above 80%         |
| Memory Usage | Above 80%         |
| Disk Usage   | Above 80%         |

## Future Improvements

Possible future enhancements include:

* Email alerts
* Slack notifications
* Configurable warning thresholds
* HTML system health reports
* CSV report generation
* Automatic cleanup of old logs
* Cron job integration for scheduled monitoring
* Network connectivity monitoring

## Learning Objectives

This project helped me practice:

* Bash scripting
* Linux system monitoring
* Variables
* Conditional statements
* Command substitution
* Pipes
* AWK
* SED
* System resource monitoring
* Log management
* Linux commands
* Git and GitHub

## Author

**Muhammad Hasnain**

Aspiring DevOps & Cloud Engineer

## License

This project is licensed under the MIT License.
