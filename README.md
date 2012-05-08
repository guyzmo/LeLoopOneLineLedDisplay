HOW TO USE
==========

Open a serial terminal on your Arduino, and juste write text on it.

HOW TO COMPILE
==============

Use a damn arduino IDE, or just do :

 % PORT=/dev/tty.damnUSBport make upload

if you're using something else than an Arduino Uno, get it from :

 % make list

and do (with e.g. an Arduino duemilanove):

 % ARDUINO=atmega328 PORT=/dev/tty.damnUSBport make upload

WHERE TO GET THE SOURCES
========================

http://github.com/guyzmo/LeLoopOneLineLedDisplay

WHAT'S THE FSCKING LICENSE ?
============================

It's WTFPL ! And as a beerware-compatible license, I wish to add that I
prefer good belgian brown beer :) 

Patches and improvements are also welcome!

CONTRIBS
========

Thanks to my friend Clem who gave me the font I'm using to display on it, 
and to my friends gric and lekernel who helped me out starting on that one.
