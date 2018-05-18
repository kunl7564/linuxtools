# coding=utf-8
from time import sleep

from CpuMonitor import CpuMonitorThread
from MemMonitor import MemMonitorThread


if __name__ == '__main__':
    cpuThread = CpuMonitorThread("testserver", 85, 10)
    cpuThread.start()
    memThread = MemMonitorThread("testserver", 1300, 1)
    memThread.start()
    sleep(1)
