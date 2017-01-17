#!/usr/bin/env python

import rospy

from inc import const
from signal_processing.msg import Signal


class Amplification:
    def __init__(self):
        self.input = Signal()
        self.result = Signal()

        rospy.init_node('amplification', anonymous=True)
        rospy.Subscriber('input_topic', Signal, self.callback)
        self.pub = rospy.Publisher('output_topic', Signal, queue_size=10)
        self.rate = rospy.Rate(const.sample_freq)

        self.amp = rospy.get_param('~amp')

        rospy.spin()  # keeps python from exiting until this node is stopped

    def callback(self, data):
        u''' Function is called when new data arrives. In the result
        it computes a power and push data in send function '''

        self.input = data  # read data
        self.send()

    def send(self):
        u''' Simply publish result of computation in proper topic'''
        self.result.time = self.input.time  # take time from input to result
        self.result.value = self.input.value * self.amp  # change value of signal
        self.pub.publish(self.result)


if __name__ == '__main__':
    try:
        Amplification()
    except rospy.ROSInterruptException:
        pass
