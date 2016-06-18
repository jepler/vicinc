# An incremental game in BASIC for the unexpanded Vic 20 (1980)

## Variable reference:
 - A$(): Name of properties
 - N%(): Number of properties
 - B(): Base price of property
 - P(): Base production of property
 - C: Cash on hand
 - Q: Quantity to purchase

 - R: Selected row
 - M: Max row to display

 - T: time of next tick

 - J, E: used to print numbers (J=number to print)

 - X: total number of items

## Initial setup
~~~~
10 print"{clr}"
20 dim a$(10),n%(10),b(10),p(10)
30 c=100:n%(1)=1:q=1:r=1:m=2:t=ti+60:x=7
40 fori=1tox:reada$(i),b(i),p(i):next
~~~~

## These are the properties you can own
~~~~
60001 data"{blk}c1530 datasette",25,1
60002 data"{pur}3k ram pack",300,3
60003 data"{red}vicmodem",900,20
60004 data"{cyn}8k ram pack",1600,80
60005 data"{blu}c1540 disk drive",4000,100
60006 data"{yel}16k ram pack",16000,200
60007 data"{grn}commodore 64",200000,500
~~~~

## Calculate the price of the next item
"fn pr" is the price function
~~~~
100 def fn pr(n)=.2*n+.05*n*n+1
~~~~

## The main "event" loop
.. It runs at 1 update per second on an NTSC VIC20 ('ti' increments at 1 per
jiffy)

~~~~
1000 gosub 20000
1010 gosub 21000
1020 ift<tithengosub22000:t=t+60:goto1020
1030 getc$:ifc$=""then1000
1040 ifc$="j"andr<mthenr=r+1
1040 ifc$="k"andr>0thenr=r-1
1050 ifc$="b"thengosub23000
1060 goto1030
~~~~

## Utility functions
###Print a number in exponential notation with up to 3 digits:
~~~~
10000 e=0:ifj<1thenj=0
10010 ifj>=1000thene=e+1:j=j/10:goto10010
10020 j$=mid$(str$(int(j)),2,99)
10030 ifethenj$=str$(int(j)/100)+"e"+mid$(str$(e+2),2,99)
10100 j$=left$(j$+"             ",8)
10110 k=int((pos(0)+10)/11)*11+2:printtab(k);j$;:return
~~~~
In principle, 10100 is an entry point for printing a string but I never used it.

### Print the main game screen
~~~~
20000 print "{home}vic20 incremental game":print"     accessory":print"  price","production":print
20010 fori=1tom:printn%(i);"{left} ";a$(i);"{blu}"
20020 j=fn pr(n%(i))*b(i):ifj<cthenprint"{rvon}";
20030 gosub10000:print"{rvof}";
20040 j=p(i)*n%(i):gosub10000:print:next
20050 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}";
20060 print"income";:gosub24000:gosub10000:print
20070 print"cash";:j=c:gosub10000:print
20080 print"k=up j=down b=buy";
20090 return
~~~~

### Print the selection mark
~~~~
21000 print"{home}{down}{down}{down}";
21010 fori=1tor:print"{down}{down}";:next
21020 print">"
~~~~

### A second has passed, update things
~~~~
22000 gosub24000:c=c+j
22010 return
~~~~

### Buy a thing
~~~~
23000 ifc<fnpr(n%(r))*b(r)thenreturn
23010 n%(r)=n%(r)+1:c=c-fnpr(n%(r))*b(r)
23020 ifr=mandm<xthenm=r+1
23030 return
~~~~

### Calculate total income in j
~~~~
24000 j=0:fori=1tox:j=j+p(i)*n%(i):next:return
~~~~

## License
Copyright © 2016
Jeff Epler <jepler@unpythonic.net>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
