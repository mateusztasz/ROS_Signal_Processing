#!/usr/bin/env python

import rospy
from std_msgs.msg import String, Float64
import math

from inc import const
from signal_processing.msg import Signal
import random


def time_generator(time):
    while True:
        yield time
        time += 1/const.sample_freq


def generator():
    pub = rospy.Publisher('output_topic', Signal, queue_size=10)
    rospy.init_node('generator', anonymous=True)
    rate = rospy.Rate(const.sample_freq)

    omega = rospy.get_param('~omega')
    shift = rospy.get_param('~shift')
    time = time_generator(0)
    result = Signal()
    t = None

    while not rospy.is_shutdown():
        t = time.next()
        result.time = t
        result.value = math.cos(omega * t + shift) #+ random.uniform(-0.0001, 0.0001)

        rospy.loginfo(t)
        pub.publish(result)
        rate.sleep()

if __name__ == '__main__':
    try:
        generator()
    except rospy.ROSInterruptException:
        pass
