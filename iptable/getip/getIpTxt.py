#!/usr/bin/python
# coding=utf-8
import json
import os

import requests

login = {
"username":"router",
"passwd":"bd6c2623e37940039c45f7fd0808fc5c",
"remember_password":""
}
test = {
    "func_name":"homepage",
	"action":"show",
	"param":{"TYPE":"ether_info,snapshoot"}
}
headers = {
    'Remote Address':'10.0.0.1:80',
    'Accept': 'application/json, text/plain, */*',
    'Connection': 'keep-alive',
    'Accept-Language':'zh-CN,zh;q=0.9',
    'Content-Length':'122',
    'Content-Type': 'application/json;charset=UTF-8',
    'Host': '10.0.0.1',
    'Origin': 'http://10.0.0.1',
    'Referer': 'http://10.0.0.1/login',
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.138 Safari/537.36',

}


def getIp():
    session = requests.session()
    conteent = session.post('http://10.0.0.1/Action/login', json.dumps(login), headers=headers)
    conteent = session.post('http://10.0.0.1/Action/call', json.dumps(test)).text
    # print(conteent)
    conteent = eval(conteent)
    # print(type(conteent))
    return conteent


if __name__ == '__main__':
    try:
        num = 2
        conteent = getIp()
        ips = conteent["Data"]["snapshoot_wan"]
        PROJECT_ROOT = os.path.abspath(os.path.dirname(__file__))
        # REPORT_XLSX_DIR =os.path.abspath(PROJECT_ROOT+"\ip.xlsx")
        REPORT_XLSX_DIR = os.path.abspath(PROJECT_ROOT + os.sep + "ip.txt")
        # print(REPORT_XLSX_DIR)
        # wt = Write_excel(REPORT_XLSX_DIR, "ip")
        # for ip in ips:
        #     wt.write(num, 1, ip["ip_addr"])
        #     num+=1
        f1 = open(REPORT_XLSX_DIR, "w")
        for ip in ips:
            f1.write(ip["ip_addr"])
            f1.write("\n")
        f1.close()
        os.system("scp %s guest@47.100.63.41:/home/guest/iptable_config/" % (REPORT_XLSX_DIR))
    except:
        print("运行失败")
