import sys
import os
from IPython import start_ipython


def import_lib_paths():
    sys.path.append('/')

import_lib_paths()

if __name__ == '__main__':
    start_ipython(argv=[], user_ns={})