# ----------------------------------------------------------------------------------
# Copyright (c) 2021 by Enclustra GmbH, Switzerland.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this hardware, software, firmware, and associated documentation files (the
# "Product"), to deal in the Product without restriction, including without
# limitation the rights to use, copy, modify, merge, publish, distribute,
# sublicense, and/or sell copies of the Product, and to permit persons to whom the
# Product is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Product.
#
# THE PRODUCT IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
# INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
# PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# PRODUCT OR THE USE OR OTHER DEALINGS IN THE PRODUCT.
# ----------------------------------------------------------------------------------

# Project settings for Mercury XU7 Reference Design
# Valid module codes
# ME-XU7-6EG-1I-D11E
# ME-XU7-9EG-2I-D12E
# ME-XU7-15EG-2I-D12E

# ----------------------------------------------------------------------------------
# Modify this variable to select your module
if {![info exists module_name]} {set module_name ME-XU7-6EG-1I-D11E}
if {![info exists baseboard]}   {set baseboard PE1}
# ----------------------------------------------------------------------------------

# ----------------------------------------------------------------------------------
# Don't modify anything beyond this line
# ----------------------------------------------------------------------------------

#if any file argument are present, use this value
if {[lindex $argv 0] != ""} { set module_name [lindex $argv 0] }

set module Mercury_XU7

switch $module_name {
  ME-XU7-6EG-1I-D11E {
    set part xczu6eg-ffvc900-1-i 
    set PS_DDR PS_D11E
    set PL_DDR PL_1_D11E
  }
  ME-XU7-9EG-2I-D12E {
    set part xczu9eg-ffvc900-2-i 
    set PS_DDR PS_D12E
    set PL_DDR PL_2_D12E
  }
  ME-XU7-15EG-2I-D12E {
    set part xczu15eg-ffvc900-2-i 
    set PS_DDR PS_D12E
    set PL_DDR PL_2_D12E
  }
  default {
    puts "$module_name not available"
    break
  }
}

#create project name for design
if {![info exists project_name]} {
  set project_name ${module}
  if {[info exists baseboard]} {
    lappend project_name ${baseboard}
    puts $project_name
  }
  set project_name [string map {" " "_"} "${project_name}"]
}

puts "INFO: settings.tcl file loaded."