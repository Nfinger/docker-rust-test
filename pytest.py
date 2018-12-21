from ctypes import *

lib = CDLL("target/release/libwakawaka.so")

lib.print_test()