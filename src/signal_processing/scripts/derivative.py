#!/usr/bin/env python

import rospy

from inc import const
from signal_processing.msg import Signal


class Derivative:
    def __init__(self):
        self.input = Signal()
        self.result = Signal()
        self.old_input = Signal()

        rospy.init_node('derivative', anonymous=True)
        rospy.Subscriber('input_topic', Signal, self.callback)
        self.pub = rospy.Publisher('output_topic', Signal, queue_size=10)
        self.rate = rospy.Rate(const.sample_freq)

        rospy.spin()  # keeps python from exiting until this node is stopped

    def callback(self, data):
        u''' Function is called when new data arrives. In the result
        it computes a power and push data in send function '''

        self.input = data  # read data
        self.send()

    def send(self):
        u''' Simply publish result of computation in proper topic'''
        self.result.time = self.input.time  # take time from input to result

        dt = self.input.time - self.old_input.time
        self.result.value = (self.input.value - self.old_input.value) / dt

        self.old_input = self.input
        self.pub.publish(self.result)


if __name__ == '__main__':
    try:
        Derivative()
    except rospy.ROSInterruptException:
        pass
