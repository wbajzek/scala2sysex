# scala2sysex
Ruby script to convert Scala tuning files to sysex

## wishlist:
* parse [scala
  files](http://www.huygens-fokker.org/scala/scl_format.html) :thumbsup:
* convert to sysex file for
  [midi scale/octave tuning 1-byte form (non real-time)](http://www.midi.org/techspecs/midituning.php),
  which is compatible with my Access Virus KB and Mutable Instruments Yarns
  module :thumbsup:
* convert to sysex file for midi scale/octave tuning 2-byte form (non real-time),
  which is a more precise standard compatible with Yarns
* calculate scales based on specified root notes and/or frequencies. E.g., a Just Major scale with D# 
  as its root rather than C
