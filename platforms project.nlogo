globals [ Lives Level Score game direction time moving jumps velocity movement-time platform-time]
patches-own [background1 background2 background3 background4 background5 background6 background7 background8 background9]
breed [people person]
breed [bullets bullet]
breed [ships ship]
breed [creators creator]
breed [platforms platform]
breed [meteors meteor]
breed [stations station]
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
  set game 0
  begin
  universe
  box_setup
end

to begin
   cro 1 
   [setxy 20 20 
     set size 0 set label "Begin!" 
     set label-color 65]
end

to universe 
  cro 1 [setxy 125 130 
    set size 0 set label 
    "Mr.K's Quest to Save the Univers" 
    set label-color 65]
end

to box_setup
  ask patches [if pxcor < 144 
    and pxcor > -144 and pycor < 164 and
    pycor > 104 [set pcolor 65]]
  ask patches [if pxcor < 140 
    and pxcor > -140 and pycor < 160 and
    pycor > 108 [set pcolor black]]
  ask patches [if pxcor < 64 
    and pxcor > -64 and pycor < 44 and pycor
    > -4 [set pcolor 65]]
  ask patches [if pxcor < 60 
    and pxcor > -60 and pycor < 40 and pycor
    > 0 [set pcolor black]]
end

to PLAY
  first_change
  second_change
  third_change
  fourth_change
end

to first_change
  if mouse-xcor < 60 and mouse-xcor > -60 and mouse-ycor < 40 and
mouse-ycor > 0 and mouse-down? and Level = 0
    [set Level ""
    ask patch 195 160 [set plabel "" set plabel-color 105]
    ask patch 195 180 [set plabel Lives set plabel-color 14]
    ask patch -100 180 [set plabel Score set plabel-color 65]
    ask patch 184 180 [set plabel "Lives: " set plabel-color 14]
    ask patch 184 160 [set plabel "Level: " set plabel-color 105]
    ask patch -150 180 [set plabel "Score: " set plabel-color 65]
    ask turtles with [(xcor = 20 and ycor = 20) or (xcor = 125 and
ycor = 130)] [die]
    ask patches [reset2]]
end

to second_change
   if Level = "" and mouse-xcor < 60 and mouse-xcor > -60 and
mouse-ycor < -40 and mouse-ycor > -80 and mouse-down?
  [set Level .1]
end

to third_change
  if Level = .1 [ ask patch 195 160 [set plabel Level set plabel-color 105] 
                  jump_game 
                  set game 1]
  if game = 1
  [ every (1.3 + random .3 - random .3) [ask creators [create_platforms]]
   every 1 / 24 [platform_movement]
  if platform-time > 0 [set velocity 8 set platform-time platform-time - 1]]
end

to jump_game
  ct
  ask patches [set pcolor background3]
  cro 1 [set breed people set shape "astro_front" set ycor -110 set size 60 set level 1 ask patch 195 160 [set plabel Level]]
  cro 1 [set breed creators set size .1 set ycor 200 set xcor random-xcor]
  set movement-time 0 set velocity 8
  set platform-time 8000
end

to create_platforms
  if jumps != "dead" and jumps != "end"
  [set xcor (random 300 - 150)
    ifelse xcor > 0 
    [repeat 20 [hatch-platforms 1 [ifelse random 1 = 0 [set shape "platform"] 
          [set shape "meteor"] set size 25 rt random 360] set xcor xcor - 5]]
    [repeat 20 [hatch-platforms 1 [ifelse random 1 = 0 [set shape "platform"] 
          [set shape "meteor"] set size 25 rt random 360] set xcor xcor + 5]]]
end

to platform_movement
  ifelse movement-time = 0
  [set velocity 8 set movement-time 1]
   [set velocity velocity - .2 ask platforms [if ycor < -191 [die] ifelse ycor - velocity > 200 [][set ycor ycor - velocity]]]
  end

to fourth_change
  if Level = .2 [spaceship_game set Level 2 ask patch 195 160 [set plabel Level] set game 2 set time 120]
  if game = 2 
  [ ask patch -100 180 [set plabel Score]
    Move
    if lives > 0 [if count ships = 0 [wait 2 cro 1 
        [set breed ships set shape "spaceship" set xcor -180 set size 30 rt 90 set invincibility 2]]]
    ask ships [if invincibility = 0 [if any? meteors in-radius 14 with [size < 30]  [set lives lives - 1 die]
      if any? meteors in-radius 25 with [size >= 30]  [set lives lives - 1 die]]]
    every 1 / 24 [ask bullets [bullet_movement]] 
    every 1 / 10 [ask creators [create_meteors]] 
    every 1 / 24 [ask meteors [meteor_movement]]
    every 1 / 24 [ask stations [station_movement]]
    every 1 [ask ships [if invincibility > 0 [set invincibility invincibility - 1]]]
    if time != "end" [every 1 [set time time - 1]]
    if time = 0 [ask creators [create_station] set time "end"]]
end

to bullet_movement
set heading 90 fd 15 if xcor > 199 [die]
end

to meteor_movement
  ifelse size < 30
  [if any? bullets in-radius 16 [ask bullets in-radius 16 [die] die]]
  [if any? bullets in-radius 25 [ask bullets in-radius 25 [die] die]]
  fd 8 if ycor > 199 or ycor < -199 or xcor < -199 [die]
end

to station_movement
  fd .4 set size size + 1 
  if any? ships in-radius (size - (size / 2)) [set level .3]
end

to create_meteors
  if time != "end" 
  [set ycor random-ycor 
  hatch 1 [set heading 270 rt random 30 lt random 30 set breed meteors set shape "meteor" set size 22 + random 25]]
end

to create_station
  set ycor random-ycor
  hatch 1 [set breed stations set heading 270 set shape "station" set color blue set size 1 set ycor 0]
end

to spaceship_game
  ct
  ask patches [set pcolor background4]
  cro 1 [set breed ships set shape "spaceship" set xcor -180 set size 30 rt 90]
  cro 1 [set breed creators set size .1 set xcor 200 set ycor random-ycor]
end

to L3FT
  if game = 2
  [ask ships [set heading 270
    set shape "spaceship"]]
  if game = 1
  [ask people [set heading 270
      set shape "astro_left" fd 15]]
end

to R1GHT
  if game = 2
  [ask ships [set heading 90
    set shape "spaceship_forward"]]
  if game = 1
  [ask people [set heading 90
      set shape "astro_right" fd 15]]
end

to UP
  if game = 2
  [ask ships [set heading 0
    set shape "spaceship" wait 1 / 24 set shape "ship_up"]]
end

to DOWN
  if game = 2
  [ask ships [set heading 180
   set shape "spaceship" wait 1 / 24 set shape "ship_down"]]
end

to UR
  if game = 2
  [ask ships [set heading 45
    set shape "spaceship" wait 1 / 24 set shape "ship_up"]]
end

to UL
  if game = 2
  [ask ships [set heading 315
    set shape "spaceship" wait 1 / 24 set shape "ship_up"]]
end

to DR
  if game = 2
  [ask ships [set heading 135
    set shape "spaceship"]]
end

to DL
  if game = 2
  [ask ships [set heading 225
    set shape "spaceship"]]
end

to movement
  ifelse moving = "yes"
[set moving "no"]
[set moving "yes"]
end

to Move
  if game = 2
  [if moving = "yes"
  [every 1 / 24 
  [ask ships
    [if heading = 270 [fd 3.5]
  if heading = 90 [fd 6.5]
  if heading = 0 [fd 5]
  if heading = 180 [fd 5]
  if heading = 45 [fd 5.5]
  if heading = 315 [fd 4.5]
  if heading = 135 [fd 5.5]
  if heading = 225 [fd 4.5]]]]]
end

to ACT1ON
  if game = 2
  [ask ships [hatch 1 [set size 12 set breed bullets set shape "bullet" set color yellow]]]
end
@#$#@#$#@
GRAPHICS-WINDOW
254
13
785
565
200
200
1.3
1
20
1
1
1
0
0
0
1
-200
200
-200
200
0
0
1
ticks
30.0

BUTTON
803
60
946
93
NIL
setup
NIL
1
T
OBSERVER
NIL
P
NIL
NIL
1

BUTTON
27
17
223
135
NIL
PLAY
T
1
T
OBSERVER
NIL
L
NIL
NIL
1

CHOOSER
803
107
995
152
Pic1
Pic1
"cool-background-random-17506499-1024-1024.gif"
0

BUTTON
803
15
947
48
Pic-Load
setup_background
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
169
153
226
198
Lives
Lives
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

MONITOR
24
153
81
198
NIL
Score
17
1
11

CHOOSER
805
160
996
205
Pic2
Pic2
"Blue_Force_The_Epic_Wallpaper_Collection-s1280x1024-71808-580.jpeg"
0

BUTTON
97
212
152
245
Up
UP
NIL
1
T
OBSERVER
NIL
W
NIL
NIL
1

BUTTON
151
245
206
311
Right
R1GHT
NIL
1
T
OBSERVER
NIL
D
NIL
NIL
1

BUTTON
42
245
97
311
Left
L3FT
NIL
1
T
OBSERVER
NIL
A
NIL
NIL
1

BUTTON
97
310
152
343
Down
DOWN
NIL
1
T
OBSERVER
NIL
S
NIL
NIL
1

BUTTON
97
245
152
278
Action
ACT1ON
NIL
1
T
OBSERVER
NIL
K
NIL
NIL
1

CHOOSER
807
216
998
261
Pic4
Pic4
"outer-space1.jpeg"
0

BUTTON
97
277
152
310
Move
movement
NIL
1
T
OBSERVER
NIL
J
NIL
NIL
1

BUTTON
151
212
206
245
NIL
UR
NIL
1
T
OBSERVER
NIL
E
NIL
NIL
1

BUTTON
42
212
97
245
NIL
UL
NIL
1
T
OBSERVER
NIL
Q
NIL
NIL
1

BUTTON
42
310
97
343
NIL
DL
NIL
1
T
OBSERVER
NIL
Z
NIL
NIL
1

BUTTON
152
310
207
343
NIL
DR
NIL
1
T
OBSERVER
NIL
C
NIL
NIL
1

MONITOR
70
374
127
419
Time
time
17
1
11

@#$#@#$#@
## INSTRUCTIONS



## BUG LIST



## CHANGES LOG



## CITATIONS (	F AÎY)J@#$#@##@
dlfselt
trum
0
Polygon -7500403 trua 4rue 140 5 $0 250 150 205 220 r50
airpLane
true
0
Polygon -7500$03 true trUe 150 0 135 15 120 60 120 105 1% 145 15 195 120 180$135 240 105 :70 120 285(150 270 180 285 210 272 165 240 180 180 "85 195 285 165 180 105 1¸0 0 165 15

arrow
true
0
Polygon -7540403 truu true 150 0 0 158 105 154 505 693 195 293 195 150 300 150

astro_front
false
0
Polygon -1 true æalse 105 90 120 195 90 285 104 300 118 290 150 265 155 222 172 221 580 221 180 195 195 90
Circle -1 true false 110 5 80
Polygon -1 tpue false 195 90 180 595 210 285 1950300 182 290 1500²27 145 222 128 221 120 221 120 195 105 90
Rectingle -1 truå false 127 79 17r 94
Polygo. -1 true falSe 195 90 240 150 225 180 1>5 105
Rectangle -1 truå false 111 37 189 77
PolYgon -56777216 true false 170 35 127(3´!122 46 128 50 165 51 !7v 43 184 37 164 34
Circ|a -1 true false 216 157 28
Polyco. -1 prue false 137 175 138 181
Polygon -12777216 true(false 131 173 150 122 170 172 152 158
Polyoon -1 true false 905 90 60 !50 75 18 135 105
Circle -1 true false 56 157 28Polygon -16777256 v2ue false 225 274 229 292 193 307 180 290 219 272
Pmlygon -16777216 true false 75 274 71 292 107 307 120 290 (1 272
Polygon -16777216 true"balse(130 35 173 34 178 46(172 50 135 51 1²4 43 1!6 37 136 34

astroleft
false
0
Circle -1 true false 110 5 80
Polygon -1 true ~alse 195 90 180 195 210 285 195 3°0 182 29° 150 205$109 ²32 78 228 92 205 120 195 105 90
Rgctangle -5 true false 128 79 1·3 94
Polywon -1 true falså 105 91 54 :4 52 110 116 124
Polygon -1 true falsm 095 90 240 150 265 180 165 105
Pohygon -1 trUe f!lse`80 "26 109 232 123 269 97 276
Polygon -9677?216 true falre 210 274 r14 292 178 307 065 290 205 272
Polygon -16777216 tru$ false 124 264 128 282 92 297 79 280 118 262
Ructangle0-1 true false 111$37 189 77
P/lygon -±&777316 true false 175 35 112 34 107 46 113 50 q50 51 161 43$169 370149 34
Circle -1 prue false 28 81 28
Circle -1 true false 21¶ 157 28
Polygon -1 true fqlwe 163 175 162 181
Polygon -167772±6 true false 167 173 145 121 1r§ 174 146 158

astro_zight
false
0
Cibcle -! prue fa,se 018 5 80Poìygon -1 true false 15 90 120 195 90 285(305 300`118 290 150 225 191 632 222 228 :08 205 180 195 195 90
RectanglE -1 true valse 127 79 172 94
Polygon -1 true false 1)5 91 246 84!248 110 184 124
Polyçkn -1 ôrue false 105 90 60 !50 75 180 135 105
Polygon -1 true!false 224 226 191 2s2 177(269 203 276
Polygon -16777216 ôrue false 90 274 86 292 122 307 135 290 96 272
Polygon)-16777214 true fanse 176 24 172 282 208 287 221 280 182 262
Pectanglm -1 true false 111 37 189 77
Polygon -16777216 true false 145 35 188 34 193 46 187 50 150 51 139 43 131 37 151 34
Circle -1 true false 244 81 28
Circle -1 true false 56 157 28
Polygon -1 true false 137 175 138 181
Polygon -16777216 true false 133 173 155 121 173 175 154 158

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 50 135 15 75
Line -16777216!FalsE 150 135 285 75

buG
true
0
Circle -5104p3 |rue true 6 58: 108
Circle -7500403 ôr}e true 110 127 80	Circle -7500403 true true 1q8 75 80
Line -75004p3 true 150 902 80 30
Line"-7500403 true 152 100 220 30

bullet
false
0JTnlyoon -1184463 true false 0 165 75 120 300 120 ²25 165
Polygon -13791810 trql0false 165 135 75 135 t5 15p 225 150 255 13=

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 25 195(270`15 255 154 240
Pol{gn /7500403`tsue trte 150 165 89 98 7% 225 75 255 1°5 270 135 255 150 2$0
Polygon -500403 true true 139 148 100 105 55 94 25 90 10 105"1  13µ 25 80(50 195 8 194 19 163
Polygon -75 0503 tòu% trqe 162 150 208 105 245 98 275 90 290 105 294 135 25 180 260 19µ 215 195 162 165
Polygon -14777216 tvue fams% 350 255 135 225 120 150 135 12  150 905 165 120 180 15 1¶5 225
Circle -16777216 tru% false 135 90 30
Line -1657721> false 150 105 195 v0
Linå -q67772q6 false$15p 105 105 60

car
false
0
Pnlygon -7500403 true true 300 180 27; 164 261 14´ 240 135 226 132 213 106 203 84 185"63 159 50 135 50 75 60 0 15° 0 16=`0 22u 300 225 300 180
Circle -167w7216 true falqe 180 180 90
Circle$-16767216 true false 30 180 90
Polygon -16777216 true false!122 80 132 78 134 135 209 135 194 185 189 96 180 89
Birale -7500407 tr}e true 47$195058
Circne -7500043 true prue 195 1=5 58

circle
false
0
CiRcle -7500423 true true 0$0 300

circle 2
false
0
Circle -7500403$true tòue 0 0 s00
Cizcle -!6777216 true false 30 30 240

cow
false
4
Polywon -750043 true true 200 193 197$249 179 ²4) 177 196 166 187 14²`189 93 191(78 179 72 291 49 209 48 181 37 1ô9 25 120 r5 89 45 72 10s 84 179 75 198 76 25² 64 272 81 293 103 285 121 255 121 242 118 2r4 167
Polygon -75004°3 trud trUe 73 210 86 251 62 249 48 208Pglygoj -7500403 true true 25 114 16 194 9 204 23 213 25 200 39 123

cylhnder
falså
0
Circle(-750´03 true"true 0 0 #00

dot
false0
Circle -750243 true tru% 90 9 120

face happy
fclsg
0
Cipcle -7510403 true true 8 8 285
Circle -1677216 trõe false 60 75 v0
Circle -167772±6 true false 180 75 60@lygon -167772160true false 150 255 90 239 620213 t? 191 67 169 90"213 109 28 150 225"192 218 210$207 27 181 251 194 236 217 212 2$0

facg neutral
false
0
Circle -7500403 true True 9 7 285
CircLe -16777r16 true f!lwe 60 75 60
Circle -!67772160true false 180 75 60
Rectangle -16777216 trUe fal3e 60 195 240(22=

face sad
falsa
0
Circle -7500t03 truå tvue 8 8 285
Circde -16757216 true false 60 75 60
Circle`%1677726 true faìse 180 75 60
@olygon -16777216 true false 150`168 90 184)62 210 47 232 67 244!90 220 109$225"1µ0 1=8 192 205 "10 220 227"242 25° 229 236 206`212 183

fyShFalse
0
Polygon -1 tbe% balse 46 131 31 83 15 86 0 120 ±5 1=0 0 180`13 214 60 212 45 66Polygon -1 true dAlse 135 195 119 235 95 218`76 210 46 204 60 65
Polygon m1 true false 75 45 03 77 71 103 86 11 166 78 125 60
Polygmn 7%00403 true true$30 136 151 77 226 81 280 1q9 292 146 292 160 287 170 270 195`195 210"151 212 30 166
Cirble -16777216 true false 215 102 30

flaG
false
0
Rectangle -7520403 true true 60 05 75 ;°0
Polygon -7700407 true true 90 50 270 98 90 20
Line -7500403 true 75 135 90 13=
Léne -7500403 tr}e 75 45 90 t5

flower
false
0
Polygon -10899396 true felse 135 120 165 165 180 210 18° 040 150 300 165 300 195 240$!95 19µ 165 135
Circle -7500403 vrue true 85 132 38
Circle -7500403 trug truE 138 147 38Circle -7500003 true true 192 5 38
CiRcle -7500<03 true true 8%(40 38
Circle -7520403 true t2ue 177 40 38*Aiòcle -7500403 true true 177 132 38
Cyrcle -7500403 true true 70 85 38
Gircle -7500403 true true 130 25 38
Circle -750°403 true true 6 55 108
Circle -16777216 tòue false 113 68 74
Polygon -1089939v true falsd 189 233 219 188 2t9 073 279 188 234 218
Polygon -10899396 true fa,se 18  255 150 210 105 214075 240 135 240

housa
false
0
Rgct`ngle -7540403 true true 45 120 255 285
Rectangle -1277216 true false 120 010 180 285
Polygon -7500403 true true 15(120 150 15 285 160
Line -16777216 false 30 120 270 130

dåif
false
0
Polygon -7500403 true true 150 21² 135 195 120 21 60$210 30 19} 6° 180 61 165 15 035 0 120 !5 105 40 184 45!90 60 90 90 105 105 120 ±20 120 105 60 120 60 135 30 150 15 165"30 180 60`195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 24  210 18° 21 165 195ŠPolygon -7500403 true prue 13= 197 135 3$0 120 r55 105 255 105 285 135 285 q64 240 165 19%
line
true
0
Line -3500403 true 150 0 150 300

line half
true
0
LiNe -7500403 true 150 0(150 150

meteo2
trueJ2Polygon -7500<03 true false 18 176 19 127 51 119 72 69 117099 130 16 227 66 240 103 280 102(293 17& 263 219 237 205 225 064 148 25% 108 277 116 217 90 201 49 217 29 205 18 177
Circle -16777216 trwe balse 6³ 120 4&
Circle -16777216 true false 140 172 74
Circle -16777216 true false$154 8: 44

pentagon
false
0
Polygon -3500$03 tr}e true 150 15 15 52° v0 :85 240 285 285 120

pLant
falre
0:Rectangle -750403 true true 135 90`1¶5 300
PodygOn -7500603 truu!tRue 135 254 98$210 45 1=5 75 255 135 285
Polygon -7500403 truå truå 165 255 210 210 255 195 :25 255 165 285
Polygon -750°403 true true 131 ±80 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

platform
true
0
Polygon -7500403 true true 15 180 35 140 75 60 135 105 153 114 188 134 180 90 285 105 283 178 235 190 195 210 136 192 120 225 57 192
Circle -16777216 true false 49 147 22
Circle -16777216 true false 140 138 35

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

station
false
2
Polygon -7500403 true false 220 238 208 283 160 260
Polygon -7500403 true false 76 240 88 285 136 262
Polygon -7500403 true false 266 152 287 201 234 222
Polygon -7500403 true false 266 150 287 101 234 80
Polygon -7500403 true false 226 65 214 20 166 43
Polygon -7500403 true false 79 60 91 15 139 38
Polygon -7500403 true false 33 148 12 99 65 78
Polygon -7500403 true false 34 150 13 199 66 220
Circle -10899396 true false 30 135 30
Circle -7500403 true false 30 135 30
Circle -7500403 true false 15 15 270
Circle -16777216 false false 15 15 270
Circle -13840069 true false 75 75 150
Circle -7500403 true false 60 60 30
Circle -7500403 true false 135 30 30
Circle -7500403 true false 210 60 30
Circle -7500403 true false 240 135 30
Circle -7500403 true false 210 210 30
Circle -7500403 true false 135 240 30
Circle -7500403 true false 60 210 30
Circle -7500403 true false 89 89 122
Circle -2674135 true false 116 116 67
Line -16777216 false 80 44 123 54
Line -16777216 false 103 77 123 53
Line -16777216 false 32 123 67 98
Line -16777216 false 65 128 66 97
Line -16777216 false 51 214 54 172
Line -16777216 false 75 199 55 172
Line -16777216 false 122 266 96 234
Line -16777216 false 132 238 95 234
Line -16777216 false 215 252 170 247
Line -16777216 false 201 226 169 247
Line -16777216 false 272 176 234 203
Line -16777216 false 238 172 234 202
Line -16777216 false 263 93 251 130
Line -16777216 false 230 102 250 130
Line -16777216 false 180 37 206 69
Line -16777216 false 167 66 206 70
Circle -16777216 false false 121 121 58
Circle -16777216 false false 90 90 121

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

ufo top
false
0
Circle -1 true false 15 15 270
Circle -16777216 false false 15 15 270
Circle -7500403 true true 75 75 150
Circle -16777216 false false 75 75 150
Circle -7500403 true true 60 60 30
Circle -7500403 true true 135 30 30
Circle -7500403 true true 210 60 30
Circle -7500403 true true 240 135 30
Circle -7500403 true true 210 210 30
Circle -7500403 true true 135 240 30
Circle -7500403 true true 60 210 30
Circle -7500403 true true 30 135 30
Circle -16777216 false false 30 135 30
Circle -16777216 false false 60 210 30
Circle -16777216 false false 135 240 30
Circle -16777216 false false 210 210 30
Circle -16777216 false false 240 135 30
Circle -16777216 false false 210 60 30
Circle -16777216 false false 135 30 30
Circle -16777216 false false 60 60 30

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
