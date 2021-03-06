import cv2
import numpy as np
from matplotlib import pyplot as plt

imgL = cv2.imread('../../samples/tsukuba_l.png', 0)
imgR = cv2.imread('../../samples/tsukuba_r.png', 0)

stereo = cv2.StereoBM_create(numDisparities=16, blockSize=15)
disparity = stereo.compute(imgL, imgR)
plt.imshow(disparity, 'gray')
plt.show()
