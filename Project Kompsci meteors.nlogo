globals [ Lives Level Score game direction]
patches-own [background1 background2 background3 background4
background5 background6 background7 background8 background9]
breed [bullets bullet]
breed [ships ship]
breed [creators creator]
breed [meteors meteor]
turtles-own [invincibility]

to setup_background
  ca
  import-pcolors Pic1
  ask patches [set background1 pcolor]
  ask patches [set pcolor black]
  import-pcolors Pic2
  ask patches [set background2 pcolor]
  ask patches [set pcolor black]
  import-pcolors Pic4
  ask patches [set background4 pcolor]
  ask patches [set pcolor black]
end

to reset
  set pcolor background1
end

to reset2
  set pcolor background2
end

to setup
  ct
  ask patches [set pcolor black]
  set lives 8
  set level 0
  ask patches [reset]
  ask patches [set plabel ""]
  cro 1 [setxy 20 20 set size 0 set label "Begin!" set label-color 65]
  cro 1 [setxy 125 130 set size 0 set label "Mr.K's Quest to Save the Univers" set label-color 65]
  ask patches [if pxcor < 144 and pxcor > -144 and P�Cor < 164 and
qycor > 104 Kset pcolor 65]]
 `ask 0atcies [)f pxcor(< 140(and pxcnr > -16p and pycor < 160 and
pycor"> 1p8 [wet pcoho� black]]
 $ask petches [)f(pxcor 8 64 anD pxcor > =64 and pycoz <  and pycov
> -4 {set pcolor 65]]
  ask patches [if pxcor < 68 a~d pxcor > -62 and pycor < 40 and picor
> 0 [set pc/lor blackY]
%n`

tk$PLA[
  if moUse-xc�r < 60 �nd mouse-�aor > -�0 aod }ouse-y�or < 40 aNd
mouse-ycor . 0 and mouse-down? enl Lewel0= 0�    [set H�vel "*
 (  ask 8�tch 195 160 [set pl�bel "" set plabel-color 105]
 0 �ask patch 195 180 [set plabel Lives {et plabel=color 14]
    ask p`tch -140 180 [set plabel Score set plabul-codor 65]
 !  ask patch 184 180 [set plabel$"Lives: " set plAbem-color 14]
 `  ask patch 184 �60 [set plabe| "Mevel: " set plaben-cohor 105] 0  ask patch -150 1(0 [set `labeL "Score: " set plabel-co�or 65]
    asj tu�tles with [ xcor = 20 ane ycor = 20) or (xcor = 25 and
y#or = 53�)] [die]
    ask patches Zr%set2]]  if$Level = "�$anl mouse-x#or < 60 and mouse-xcor > -60 and
mouse-ycor < -40 and moese-ycor > -80 and mowse-down?
  [set Nevel .1]
  if Level = .� [ a�k pqtch 195 16p [set plabul Level set placel-color
1 5_ jump_game]
" if Level = .2 [�paceship_game set Dmvel 2 ask patah"195 160 [set
plebel Level] set game 2�
  if game = 2 
  
  [if lives ? 0 {if count ships = 0 [wait  cvo 1 
        [set breed ships set shape""spaceship" set xcor -180 se4 size030 rt 90 set invilcibility 2]]]
  ! 
    �3k {iips [if invinci�ility < 0 [if$a�y? meteors i�-radius 14 with$[size`< 30]  [sEt livgs lives - q die]
      if any? meteors in-redius �5 with [syze >= 30]0 [ret lives li�es - 1 dieM]]
(   
  0 every 1 / 24 Yask bullets [bulle4_move}entM] 
    every 1 / 10 [ask creators [cre|u_oeteorw]]     every(1 / "4 [esk meteors {meteoR_mgfement�]
    every 1 [ask0ships [if invincibality > 0 _set ynvhncibility inwilcibility - 1]\]]
eo,

to bullet_-oveme~t
qev heading 90 fd 15 if Xcor > 199 [dim]
end

to meteor_movement
  ifelse si{a <(30
  [if a�y? bullets in)radius 16 [ask bunletw in-radius 16 [die] diG]]
  [id any? bul}gts in-baDius 25 [ask b}llets in-rAdius 25 [die]�die]]
  fd 8 if ycor > 199 or qcor <!-199 or`xcor <(-199 [die]
end

to cpeate_meteorS
$"se4 ycor r�ndom-yc�r 
  hatch 1 [set"heeding 270 rt$random 30 lt ra.dom 30 set breed meteors set shape "mmteor" set size 62 +!random 25]
end
  
To juMr_game

end

to spaceship[game
  c4
  ask patchds �set pcolor baciwround4]
  cro 1 [set breed shipsbset shape "spaceship" set xcor -1�0!set size 300rt 90]
  cro 1 [set breed creytors0set qize .1 set xcor 200 set ycor rAndol-ycorU
end

to L3FT
  mf game = 2
  [asK ships [set heading�270
    se|*shape)"sxaceship"]]
end

to R1�HT
  if game = 2
  [ask ships$[sdt he)ding 90
    s�t shape "spaceship_forward"]]
end

to uP
  if game = 2
  Yask Shits [set heading 0
    set shape spaceship" wait 1 /`r4 set shape .shkp_up"]]
end

To DOWN
  if ga-e = 
  [ask ships {set huading 180
 ( smt shape "sp�ceship" wai| 1 / 24 set shapm "ship_down"]]
end

toaUR
  if g�me = 2
  [asj shIp{ [set heading 65
  ! set shape "spa3esh�p" wai4 1 ? "4�s�t shaPe "sHip_up"]\
end

to UL  if game = 2
  [ask shmps Ksev heading 337
    sdt sha0e "st�ceship" wait 1 + 24 s%t sh`pe "ship_up]]
enl

to!DR
  if game � 2
  [ask#shhps {set headIng 135
    set(shape "spacesxip&]]
end

to DL
  ig wam%$ r
  [ask 3hips [{et heading 225
    set shape "spaceshir"]]
end

t movement
  if game =$2[evep} 1 ? 24 
  Zask ships
    Yhf heediLg = 270 [Fd 3.5]
  if heading = 90$[fd 6.5]
  mf headin� = 0![fd(5Y
  if headi�g = 1�0 [fd 5]  if heading"= 45 [fd 5.5]
 bif headinf = 315 [nd 4.5]
  if heading = 135 [fd 5.5]
  if heading = 225 [fd 4.5]]]]
endJ
to AGT1ON� if gamu = 2
  [ask ships [hatch"1 [set size 32 set Breed rullets seT {hape"bUllet"�cet clor yellow]]]
end
@#$+@#$'@
GRAPHICS-INDOW
254
3
785
561
200
200
1.3
1
38
1
11
0
0
0
1
-�00
200
-200
200
0
0
5
ticks
;0.0
*bUTTON
803
60
942
93�NIL
s%tup
NIL
1T
OBSERVERJJIL
P
NIL
NIL
1J
BUTTN67
172"3
135^IL
PLAY
T
1
T�oBSURVER
NIL
L
JIL
nIL
1
CHOOSE�803J107
995
152
Pic1*Phc1
"cogl-backgr/unf-random-17u06499-1024-102.oif"
0

BUTTON
803
15
947
48
Pic-Lnad
setup_backgroundNIL
1
T
OBSERVER
�IL
NIL
NIL
NAL
1MONIDOR
169J153
222
19
Lives
ivds
17
1
11

MONITOR
97
153
154
198
Level
Level
17
1
11

MmNITOR
24153
81�389
NILScore
17*1
11

CONSER
805
160
996
205
ic2
Pi�2
"Blue_�orce_The_Gpic_Wallpaper_Collection-s!280x1024-71808-5(0.jpeg"
0

B�TTON
97
212
q52
245
Up
UP
NIL
1
T
OBsERVER
NIL
W
NIL
LIL
1

BU�TON
151
245306
;15
Right
R�GT
NIH
1JT
OCSGRVER
NIL
D
NIL
NIL
q

BUTTON
4� 45
97J311
L�dt
L3ET
NIL
9
T
OBSERVER
NIL
A
NIL
NIL
5

BUTTON
97
218
152353
D�wn
DOWN
NI�
1
T
OBSER^R
NHL
S
�IL
NIL
1

BUTTON
97
245
152
278
�#tion
ACT1ON
NIL
q
T
OBSERVER
NIL
K
NIL
NIL
1

SHOOSeR
807
216
998
261
Pic4
Pic4
"outer-space1.jpeg"
0

BUTVON
=7
277
152
210Move
movemefu
T
1
T
OBSERVER
NYLJJ
NIL
NL
1

BUTTON
151
212206J245
NIL
UR
NIL
1
P
OBSERVER
FIL
�
NIL
NIL
�

BWTTON
42
212
17
24u
NIL
QL
NML
1
T
OBSERVER
NIL
Q
NIL
NIL
1

BUTTONJ42
310
97
33
NIL
DLJNHL
1
t
OCSERV��
NIL
X
NML
NIL
1

BUTTON
152310
20�
3<3
NIL
DR
NI�
1
T
OBSERVER
NIL
C
NIL
NIL
1

@#$#@#$'@
#+ WHET$IS HT?
�(a generAl understanding of0what the�model )s trying to sho7 or explain)�
## IOS IT W�RKS

(whaT reles`the agents use to create the overall jehavior0of thg mgdam)

#c JOW �O UD"IT

(how to ure�th� iodel,�incluling a descrittion of dach!of the items in the Anturgice tab(

## THINgS TO NOTICE
�(s5ggested things for the user to �otice w@ile runniog the model9
## THINGS TO TRY

(suggested th�nws for the user to try t� do (move*sliders, switches, etc.� with the model)
## EZTENDING TH� ODEL

(suggewted things to add op change in tle Code(t`b to make the molem �ore comp�kcated, deTaile`, accurate, etc.)

## NETLOGO0FEAVURES

(interest�ng or unus�al features of NetLo'o t``t vhe`model uses, particularly �n the0Cod% tab; or where w_rkarounds were needed for my�si~g features)+
## RLATED MODELS

(modelsin tha"NetLogo Models Library an� ulsewhere which aru of vm|ated anterest)
## CREDI�S AND REFERENCES

(a reference to thm model's URL on the web if it has"one, as!well as !n9 other$necessary cRedits, kitations, and L�nks)
@#$#@#$#@
de&ault
true
0
Po|ygon -7500403 tru� true`150 5 40 250 150 205 26p 250

airplane
trteJ0
Polygon -7500403 tzug true 150 10135 15 120`70 q20 105 15 165 15 195 120 180 135 240 105 270 120 28= 150 270 180 285 2� 270 165 240 180(180 285 995 2x5 165 180 105 180 60 1&5 15

!rr�wtrue
4
Polygon"-7500403 true true 1%0 0 0 150 905 150 0029# 1�5 z93 195 150 302`1u0

box
fqlse
0
Ponygon -7500403 tr�e �s�e(158 285 285 225 285 75 150 135
Polygon -w500403 true true 150 115 15 75 15p 15 :85 75
POlyfon -7500403 tbue�true 15 75 15 205 150 28501=0 1#�
Line -1v777216 false 1500285 150 135
ine -16777:16 v!nse 150 33� 15 75
Line�-16777216 false 150 135 285 '5
bug
true
0
Circle!-75 040� true trte 96 182 108
Circle -7500403 true true 11P 127 80
CiRcle -7500403 true tbue 110 5 (0*Line -7500403 true 1500100 80 30
Hine -7500403 true 950 100�220 30

bullet
false
0�Polygon -�184463 true fals�"0 165 7= 1000300 q24 225 165
Polygon -13791810 t�um"false 1650135 �5 135 45 150 25 150 255 135

but�erglytrum
0
Polygon -7500443 true0tzue 150 165 24 !99 2�5 225 225 255 15 370 165 2�5 150 240*Po,ygon0-7500�03 tr}e true 150$165 89 198 75 225 75 255 105 270 1#= 255"15p 240
Poy�on -7500403 tRue true 139 !49 �00 115 %5 90 25 90 1� 10u 10 134 25`180000 195 85 !9� 139 �&3
Polygon -7500403 true vrue 160 154 280 105 245(90 275 )0 290 1�5 290 135 275 �80 261 195 215`1�5 162 125
Pomygon -)67�7216 true false 150 r55 135 225 120`150 135�120(150 1 5 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

meteor
true
2
Polygon -7500403 true false 18 176 19 127 51 119 72 69 117 99 130 16 227 66 240 103 280 102 293 176 263 219 237 205 225 266 148 255 108 277 116 217 90 201 49 217 29 207 18 177
Circle -16777216 true false 63 120 46
Circle -16777216 true false 140 172 74
Circle -16777216 true false 154 88 44

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

ship_down
false
5
Polygon -7500403 true false 300 150 285 165 240 180 195 180 135 300 105 300 120 180 60 165 45 180 30 165 30 150 30 135 45 120 60 135 120 120 135 120 75 45 195 120 240 120 285 135
Line -7500403 false 120 120 195 120
Polygon -2674135 true false 30 165 30 135 15 135 0 120 0 180 15 165 30 165 30 135
Polygon -1184463 true false 30 135 0 150 15 165 30 165
Polygon -16777216 true false 60 135 45 120 30 135 30 165 45 180 60 165
Polygon -16777216 true false 195 135 225 150 240 150 255 150 270 150 255 135 240 135
Polygon -16777216 true false 120 180 135 180 120 300 105 300 120 180
Polygon -16777216 true false 135 120 120 120 60 45 75 45
Polygon -16777216 true false 195 135 225 150 240 150 255 150 270 150 255 135 210 135
Polygon -16777216 true false 225 150 195 165 255 165 270 150
Polygon -7500403 true false 75 45 90 45 195 120 75 45

ship_up
false
5
Polygon -7500403 true false 300 150 285 165 240 180 195 180 135 255 120 255 120 180 60 165 45 180 30 165 30 150 30 135 45 120 60 135 120 120 135 120 165 120 195 120 240 120 285 135
Line -7500403 false 120 120 195 120
Polygon -2674135 true false 30 165 30 135 15 135 0 120 0 180 15 165 30 165 30 135
Polygon -1184463 true false 30 135 0 150 15 165 30 165
Polygon -16777216 true false 60 135 45 120 30 135 30 165 45 180 60 165
Polygon -16777216 true false 195 120 225 135 240 135 255 135 270 135 255 120 240 120
Polygon -16777216 true false 120 180 135 180 120 255 105 255 120 180

spaceship
false
5
Polygon -7500403 true false 300 150 285 165 240 180 195 180 135 285 105 285 120 180 60 165 45 180 30 165 30 150 30 135 45 120 60 135 120 120 135 120 75 90 195 120 240 120 285 135
Line -7500403 false 120 120 195 120
Polygon -2674135 true false 30 165 30 135 15 135 0 120 0 180 15 165 30 165 30 135
Polygon -1184463 true false 30 135 0 150 15 165 30 165
Polygon -16777216 true false 60 135 45 120 30 135 30 165 45 180 60 165
Polygon -16777216 true false 195 120 225 135 240 135 255 135 270 135 255 120 240 120
Polygon -16777216 true false 120 180 135 180 120 285 105 285 120 180
Polygon -16777216 true false 135 120 120 120 60 90 75 90

spaceship_forward
false
5
Polygon -2674135 true false 14 139 -1 149 16 169
Polygon -7500403 true false 300 150 285 165 240 180 195 180 135 285 105 285 120 180 60 165 45 180 30 165 30 150 30 135 45 120 60 135 120 120 135 120 75 90 195 120 240 120 285 135
Line -7500403 false 120 120 195 120
Polygon -16777216 true false 60 135 45 120 30 135 30 165 45 180 60 165
Polygon -16777216 true false 195 120 225 135 240 135 255 135 270 135 255 120 240 120
Polygon -16777216 true false 120 180 135 180 120 285 105 285 120 180
Polygon -16777216 true false 135 120 120 120 60 90 75 90
Polygon -2674135 true false 33 130 15 133 1 150 29 138
Polygon -2674135 true false 38 167 17 169 6 161 0 144 30 150 32 162
Polygon -955883 false false 45 120 30 120 15 105 0 90
Polygon -955883 false false 45 180 30 180 0 210
Polygon -955883 true false 31 166 31 136 16 136 10 144 7 150 18 162 30 162 31 136
Polygon -1184463 true false 30 135 16 148 21 156 30 159

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270

@#$#@#$#@
NetLogo 5.0.3
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 1.0 0.0
0.0 1 1.0 0.0
0.2 0 1.0 0.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180

@#$#@#$#@
0
@#$#@#$#@
