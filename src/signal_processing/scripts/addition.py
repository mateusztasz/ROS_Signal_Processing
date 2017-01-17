#!/usr/bin/env python

import rospy
from std_msgs.msg import String, Float64

from inc import const
from signal_processing.msg import Signal


class Addition:
    def __init__(self):
        self.input1 = Signal()
        self.input2 = Signal()
        self.result = Signal()

        self.input1_ready = False
        self.input2_ready = False

        rospy.init_node('addition', anonymous=True)
        rospy.Subscriber('input_topic1', Signal, self.callback_input1)
        rospy.Subscriber('input_topic2', Signal, self.callback_input2)
        self.pub = rospy.Publisher('output_topic', Signal, queue_size=10)
        self.rate = rospy.Rate(const.sample_freq)

        rospy.spin()  # keeps python from exiting until this node is stopped

    def callback_input1(self, data):
        u''' Function is called when new data arrives. In the result
        it computes a power and push data in send function '''

        self.input1 = data  # read data
        self.input1_ready = True
        if self.input1_ready and self.input2_ready:
            self.send()

    def callback_input2(self, data):
        u''' Function is called when new data arrives. In the result
        it computes a power and push data in send function '''

        self.input2 = data  # read data
        self.input2_ready = True
        if self.input1_ready and self.input2_ready:
            self.send()

    def send(self):
        u''' Simply publish result of computation in proper topic'''
        self.result.time = self.input1.time  # take time from input to result

        self.result.value = self.input1.value + self.input2.value
        self.input1_ready = False
        self.input2_ready = False
        self.pub.publish(self.result)


if __name__ == '__main__':
    try:
        Addition()
    except rospy.ROSInterruptException:
        pass
