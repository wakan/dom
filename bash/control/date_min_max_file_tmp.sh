#!/bin/bash
stat -c %y /tmp/dom.fromscript.* | cut -d\  -f2 | cut -d. -f1 | cut -d: -f1,2 | sort -nr | head -1 > /tmp/dom.fromscript.control.date_file_tmp_max
stat -c %y /tmp/dom.fromscript.* | cut -d\  -f2 | cut -d. -f1 | cut -d: -f1,2 | sort -n | head -1 > /tmp/dom.fromscript.control.date_file_tmp_min
