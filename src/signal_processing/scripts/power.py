#!/usr/bin/env python

import rospy
from std_msgs.msg import String, Float64

from inc import const
from signal_processing.msg import Signal


class Power:
    def __init__(self):
        self.input = Signal()
        self.result = Signal()

        rospy.init_node('power', anonymous=True)
        rospy.Subscriber('input_topic', Signal, self.callback)
        self.pub = rospy.Publisher('output_topic', Signal, queue_size=10)
        self.rate = rospy.Rate(const.sample_freq)

        self.pow = rospy.get_param('~pow')

        rospy.spin()  # keeps python from exiting until this node is stopped

    def callback(self, data):
        u''' Function is called when new data arrives. In the result
        it computes a power and push data in send function '''

        self.input = data  # read data
        self.send()

    def send(self):
        u''' Simply publish result of computation in proper topic'''
        self.result.time = self.input.time  # take time from input to result

        self.result.value = pow(self.input.value, self.pow)
        self.pub.publish(self.result)


if __name__ == '__main__':
    try:
        Power()
    except rospy.ROSInterruptException:
        pass
