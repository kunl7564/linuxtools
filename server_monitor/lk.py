# coding=utf-8
import os
import time
import sys
import re
import MailUtils
import socket
from time import sleep

def main():
    too_busy = 0
    os.system("top -n 2 -b > .tmp")
#     B:\\tools\\server_monitor\\
    fin = open(".tmp", "r")
    lines = fin.readlines()  # 读取全部内容  
    fin.close()
    
    fout = open(".top", "w")
    counter = 0
    for line in lines:
        if line.startswith("%Cpu"):
            counter += 1
            if counter < 2:
                continue
            tmpline = line
            tmpline = re.sub(r"\s{2,}", " ", tmpline)  # 多个空格替换成1个
            element = tmpline.split(' ')  # 一次只能分割一个字符穿
            print tmpline, "\n", element
            print "idle=", element[7]
            try:
                idle = float(element[7])
                print ("idle=%f" % (idle))
                if idle < 30:
                    too_busy = 1
            except:
                print element[7]
        if counter == 2:
#             print line
            fout.write(line)
            
    
    fout.close()
    return too_busy

if __name__ == '__main__':
    while True:        
        too_busy = main()
	if too_busy == 1:
            myname = socket.getfqdn(socket.gethostname())
            # 获取本机ip
            ip = socket.gethostbyname(myname)
            subject = ip + " cpu占用异常!"
            if len(sys.argv) > 1:
                subject = sys.argv[1] + " cpu占用异常!"
            topfile = open('.top');
            try:
                toptext = topfile.read();
            finally:
                topfile.close();

            MailUtils.sendMail("liuandong@tpson.cn;wuqinghua@tpson.cn;mayuefeng@tpson.cn;liangkun@tpson.cn;", subject, toptext)
            #MailUtils.sendMail("liangkun@tpson.cn;", subject, toptext)
            # os.system("mail -s '[AutoDetect]Hacker found!' lk8823@qq.com < .top")
            #os.system("mail -s '[AutoDetect]Hacker found!' -c liminhgd@qq.com -c yao.chen@coollu.com.cn -c chao.cao@coollu.com.cn lk8823@qq.com < .top")
        sleep(600)

