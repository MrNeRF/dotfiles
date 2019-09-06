python
import sys
sys.path.append('/home/paja/gdb')
from printers3 import register_eigen_printers
register_eigen_printers (None)
end


python
import sys 
sys.path.insert(0, '/home/paja/gdb') 
from libstdcpp import register_libcxx_printers 
register_libcxx_printers (None) 
end
