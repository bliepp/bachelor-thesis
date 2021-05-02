#!/usr/bin/env python
#
#
#

import numpy as np

data = np.loadtxt("equi_block.eng").T
zeros_crossing = np.where(np.diff(np.sign(data[3])))[0][-1]
print(*data[:,zeros_crossing])
