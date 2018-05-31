# coding=utf-8
import os
import time
import sys
import re
import MailUtils
import socket
import threading
from time import sleep
import SystemUtils

class CpuMonitorThread(threading.Thread):
    def __init__(self, serverName, threshold=80, pollingGap=10):
        threading.Thread.__init__(self)
        self.serverName = serverName
        self.threshold = threshold
        self.pollingGap = pollingGap
    def run(self):
        print "Starting CpuMonitorThread on " + self.serverName
        subject = self.serverName + " cpu持续占用异常!"
        alarm = False
        maillist = "liangkun@tpson.cn;liuandong@tpson.cn;wuqinghua@tpson.cn;caifushou@tpson.cn;mayuefeng@tpson.cn"
        while True:
            # 获取本机ip
            if SystemUtils.getCpuUsage(60) > self.threshold:
                if alarm == False:
                    alarm = True
                    toptext = os.popen('top -b -n 1').read()
                    MailUtils.sendMail(maillist, subject, toptext)
            else:
                alarm = False                        
            sleep(self.pollingGap)
