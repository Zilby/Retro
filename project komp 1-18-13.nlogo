globals [ Lives Level Score game direction time moving jumps velocity movement-time platform-time gravity coloring]
patches-own [background1 background2 background3 background4 background5]
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
  import-pcolors Pic3
  ask patches [set background3 pcolor]
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
  set coloring "color"
  set time 0
  set score 0
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

to skip1
  ifelse level != 1
  [ask patch 184 180 [set plabel "Lives: " set plabel-color 14]
  ask patch 184 160 [set plabel "Level: " set plabel-color 105] 
  ask patch -150 180 [set plabel "Score: " set plabel-color 65]
  set level .2]
  [set time 0]
  
end

to PLAY
  if level != 0 [ask patch -100 180 [set plabel Score set plabel-color 65]]
  first_change
  second_change
  third_change
  fourth_change
  GameOver
end

to GameOver
  if lives = 0 [user-message (word "GAME OVER   Score: " score "  Press OK to restart") setup]
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
   if Level = ""
   [if coloring = "color" [
                          cro 1 [set size 0 setxy 165 125 
                                 set label "One day, while Mr. K is going through space" set label-color 9.9]
                          cro 1 [set size 0 setxy 175 105
                                 set label "on some asteroids when he feels a disturbance." set label-color 9.9]
                          cro 1 [set size 0 setxy 140 85
                                 set label "It's his duty to investigate, after all," set label-color 9.9]
                          cro 1 [set size 0 setxy 140 65
                                 set label "he is an Intergalactic Security Agent." set label-color 9.9]
                          cro 1 [set size 0 setxy 170 45
                                 set label "He uses his remote to send his spaceship, on" set label-color 9.9]
                          cro 1 [set size 0 setxy 165 25
                                 set label "autopilot, to certain coordinates where he" set label-color 9.9]
                          cro 1 [set size 0 setxy 165 5
                                 set label "will meet it. He will need to maneuver his" set label-color 9.9]
                          cro 1 [set size 0 setxy 140 -15
                                 set label "way over there in time. Once onboard," set label-color 9.9]
                          cro 1 [set size 0 setxy 130 -35
                                 set label "he will fly through a meteor shower to" set label-color 9.9]
                          cro 1 [set size 0 setxy 130 -55
                                 set label "find the source of this disturbance." set label-color 9.9]
                          cro 1 [set size 0 setxy 140 -75
                                 set label "Control Mr. K as he jumps to his ship," set label-color 9.9]
                          cro 1 [set size 0 setxy 160 -95
                                 set label "hurdles through space, and fights a villain." set label-color 9.9]
                          cro 1 [set size 0 setxy 35 -130 
                                 set label "Level One" set label-color 65]
     ask patches [if pxcor < 64 
    and pxcor > -64 and pycor < -110 and pycor
    > -150 [set pcolor 65]]
  ask patches [if pxcor < 60 
    and pxcor > -60 and pycor < -113 and pycor
    > -147 [set pcolor black]] set coloring "no"]
     if mouse-xcor < 60 and mouse-xcor > -60 and mouse-ycor < -90 and mouse-ycor > -130 and mouse-down?
       [set Level .1]]
end

to third_change
  if Level = .1 [ ask patch 195 160 [set plabel Level set plabel-color 105] 
                  jump_game 
                  set game 1
                  ask patch 195 180 [set plabel Lives set plabel-color 14]]
  
  if game = 1
  [move
   ask patch 195 180 [set plabel Lives]
   every 1 [if time > 0 [set time time - 1]]
   ifelse timer > 100 
   [every (.6 + random .1 - random .1) [ask creators [create_platforms]]]
   [every (1 + random .2 - random .2) [ask creators [create_platforms]]]
   every 1 / 42 [platform_movement]
   every 1 / 42 [ask people [platform_detection]]
  if platform-time > 0 [set velocity 8 set platform-time platform-time - 1 every .3 [ask creators [create_platforms]]]
   if velocity < -18 [dead]
   if time = 0 
     [cro 1 [set breed ships set shape "spaceship" set size 80 rt 90 setxy -200 -20] 
       set time -9001 set score score + 100 ask platforms [die]]
     if time = -9001
     [every 1 / 42 [set velocity 0] 
     every 1 / 42 [ask ships [fd 5]] 
     ask people [if any? ships in-radius 40 [die]]
     if any? ships with [xcor > 190] [set level .2]]]
end

to jump_game
  ct
  set time 120
  ask patches [set pcolor background3]
  cro 1 [set breed people set shape "astro_front" set ycor -20 set size 60 set level 1 ask patch 195 160 [set plabel Level]]
  cro 1 [set breed creators set size .1 set ycor 200 set xcor random-xcor]
  set movement-time 0 set velocity 8
  set platform-time 1200
end

to create_platforms
  if jumps != "dead" and jumps != "end"
  [set xcor (random 300 - 150)
    ifelse time > 80
    [ifelse xcor > 0 
    [repeat 13 [hatch-platforms 1 [ifelse random 1 = 0 [set shape "platform"] 
          [set shape "meteor"] set size 25 rt random 360] set xcor xcor - 5]]
    [repeat 13 [hatch-platforms 1 [ifelse random 1 = 0 [set shape "platform"] 
          [set shape "meteor"] set size 25 rt random 360] set xcor xcor + 5]]]
    [ifelse time > 40
      [ifelse xcor > 0 
    [repeat 5 [hatch-platforms 1 [ifelse random 1 = 0 [set shape "platform"] 
          [set shape "meteor"] set size 25 rt random 360] set xcor xcor - 5]]
    [repeat 5 [hatch-platforms 1 [ifelse random 1 = 0 [set shape "platform"] 
          [set shape "meteor"] set size 25 rt random 360] set xcor xcor + 5]]]
      [ifelse xcor > 0 
    [repeat 2 [hatch-platforms 1 [ifelse random 1 = 0 [set shape "platform"] 
          [set shape "meteor"] set size 25 rt random 360] set xcor xcor - 5]]
    [repeat 2 [hatch-platforms 1 [ifelse random 1 = 0 [set shape "platform"] 
          [set shape "meteor"] set size 25 rt random 360] set xcor xcor + 5]]]]]
end

to platform_movement
  ifelse movement-time = 0
  [set velocity 8 set movement-time 1 ask platforms [ifelse ycor - 4 < -200 [] [set ycor ycor - 4]]]
   [set velocity velocity - .2 
        ifelse velocity < 0 [set gravity "down"] [set gravity "up"] 
     ask platforms [if ycor < -191 [die] 
       ifelse ycor - velocity > 200 []
       [set ycor ycor - velocity]]]
  end

to platform_detection
  if any? platforms in-radius 25 with [ycor < ([ycor] of myself - 10)] and gravity = "down"
  [set movement-time 0
   set score score + 10]
end

to dead
  set lives lives - 1
  ifelse (score - 100) > 0 [set score score - 100]
                           [set score 0]
  ask people [die] 
  wait 2 
  cro 1 [set breed people set shape "astro_front" 
    set ycor -20 set size 60]
  set platform-time 2000
end

to fourth_change
  if Level = .2 [spaceship_game set Level 2 ask patch 195 160 [set plabel Level] set game 2 set time 120
                ask patch 195 180 [set plabel Lives set plabel-color 14]]
  if game = 2 
  [ ask patch -100 180 [set plabel Score]
    Move
    if lives > 0 [if count ships = 0 [wait 2 cro 1 
        [set breed ships set shape "spaceship" set xcor -180 set size 30 rt 90 set invincibility 2]]]
    ask ships [if invincibility = 0 [if any? meteors in-radius 14 with [size < 30]  
        [set lives lives - 1 ifelse (score - 100) > 0 
          [set score score - 100]
          [set score 0]
          die]
      if any? meteors in-radius 25 with [size >= 30] 
       [set lives lives - 1 ifelse (score - 100) > 0 
         [set score score - 100]
         [set score 0] 
         die]]]
    every 1 / 24 [ask bullets [bullet_movement]] 
    every 1 / 10 [ask creators [create_meteors]] 
    every 1 / 24 [ask meteors [meteor_movement]]
    every 1 / 24 [ask stations [station_movement]]
    every 1 [ask ships [if invincibility > 0 [set invincibility invincibility - 1]]]
    if time != "end" [every 1 [set time time - 1]]
    if time = 0 [ask creators [create_station] set time "end"]
    ask patch 195 180 [set plabel Lives set plabel-color 14]]
    ask stations [if any? ships with [distance myself < 20] [set level .3]]
end

to bullet_movement
set heading 90 fd 15 if xcor > 199 [die]
end

to meteor_movement
  ifelse size < 30
  [if any? bullets in-radius 16 [set score score + 1 ask bullets in-radius 16 [die] die]]
  [if any? bullets in-radius 25 [set score score + 1 ask bullets in-radius 25 [die] die]]
  fd 8 if ycor > 199 or ycor < -199 or xcor < -199 [die]
end

to station_movement
  fd .4 set size size + 1 
  if any? ships in-radius (size - (size / 2)) [set level .3]
end

to create_meteors
  if time != "end" 
  [set ycor random-ycor 
  hatch 1 [set heading 270 rt random 30 lt random 30 
    set breed meteors 
    ifelse random 4 = 0 [set shape "meteor"] 
    [ifelse random 3 = 0 [set shape "meteor2"] 
      [ifelse random 2 = 0 [set shape "meteor3"]
        [set shape "meteor4"]]] 
    set size 22 + random 25]]
end

to create_station
  set ycor random-ycor
  hatch 1 [set breed stations set heading 270 set shape "station" set color blue set size 1 set ycor 0]
end

to spaceship_game
  ct
  ask patches [set pcolor background3]
  cro 1 [set breed ships set shape "spaceship" set xcor -180 set size 30 rt 90]
  cro 1 [set breed creators set size .1 set xcor 200 set ycor random-ycor]
end

to L3FT
  if game = 2
  [ask ships [set heading 270
    set shape "spaceship"]]
  if game = 1
  [ask people [set heading 270
      set shape "astro_left"]]
end

to R1GHT
  if game = 2
  [ask ships [set heading 90
    set shape "spaceship_forward"]]
  if game = 1
  [ask people [set heading 90
      set shape "astro_right"]]
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
  if game = 1
  [ask people [if heading != 0 [every 1 / 18 [fd .02]]]]
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
110
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
"686791-a-green-ish-spiraling-tunnel-vortex--complete-with-a-central-lens-flare-at-the-focal-point.jpeg"
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
127
163
184
208
Lives
Lives
17
1
11

MONITOR
127
115
184
160
Level
Level
17
1
11

MONITOR
65
114
122
159
NIL
Score
17
1
11

CHOOSER
804
167
996
212
Pic2
Pic2
"Cool-Background-wallpapers-327581_1024_768.jpeg"
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
244
206
310
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
806
223
996
268
Pic3
Pic3
"blue_outer_space_dark_desktop_1650x1078_hd-wallpaper-510568.jpeg"
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
X
NIL
NIL
1

BUTTON
151
310
206
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
65
163
122
208
Time
time
17
1
11

BUTTON
817
335
982
368
**Cheat** Skip Level 1
skip1
NIL
1
T
OBSERVER
NIL
2
NIL
NIL
1

INPUTBOX
68
366
223
426
a
0
1
0
Color

@#$#@#$#@
## INSTRUCTIONS



## BUG LIST



## CHANGES LOG



## CITATIONS (IF ANY)
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

astro_front
false
0
Polygon -1 true false 105 90 120 195 90 285 105 300 118 290 150 225 155 222 172 221 180 221 180 195 195 90
Circle -1 true false 110 5 80
Polygon -1 true false 195 90 180 195 210 285 195 300 182 290 150 225 145 222 128 221 120 221 120 195 105 90
Rectangle -1 true false 127 79 172 94
Polygon -1 true false 195 90 240 150 225 180 165 105
Rectangle -1 true false 111 37 189 77
Polygon -16777216 true false 170 35 127 34 122 46 128 50 165 51 176 43 184 37 164 34
Circle -1 true false 216 157 28
Polygon -1 true false 137 175 138 181
Polygon -16777216 true false 131 173 150 122 170 172 152 158
Polygon -1 true false 105 90 60 150 75 180 135 105
Circle -1 true false 56 157 28
Polygon -16777216 true false 225 274 229 292 193 307 180 290 219 272
Polygon -16777216 true false 75 274 71 292 107 307 120 290 81 272
Polygon -16777216 true false 130 35 173 34 178 46 172 50 135 51 124 43 116 37 136 34

astro_left
false
0
Circle -1 true false 110 5 80
Polygon -1 true false 195 90 180 195 210 285 195 300 182 290 150 225 109 232 78 228 92 205 120 195 105 90
Rectangle -1 true false 128 79 173 94
Polygon -1 true false 105 91 54 84 52 110 116 124
Polygon -1 true false 195 90 240 150 225 180 165 105
Polygon -1 true false 80 226 109 232 123 269 97 276
Polygon -16777216 true false 210 274 214 292 178 307 165 290 204 272
Polygon -16777216 true false 124 264 128 282 92 297 79 280 118 262
Rectangle -1 true false 111 37 189 77
Polygon -16777216 true false 155 35 112 34 107 46 113 50 150 51 161 43 169 37 149 34
Circle -1 true false 28 81 28
Circle -1 true false 216 157 28
Polygon -1 true false 163 175 162 181
Polygon -16777216 true false 167 173 145 121 127 175 146 158

astro_right
false
0
Circle -1 true false 110 5 80
Polygon -1 true false 105 90 120 195 90 285 105 300 118 290 150 225 191 232 222 228 208 205 180 195 195 90
Rectangle -1 true false 127 79 172 94
Polygon -1 true false 195 91 246 84 248 110 184 124
Polygon -1 true false 105 90 60 150 75 180 135 105
Polygon -1 true false 220 226 191 232 177 269 203 276
Polygon -16777216 true false 90 274 86 292 122 307 135 290 96 272
Polygon -16777216 true false 176 264 172 282 208 297 221 280 182 262
Rectangle -1 true false 111 37 189 77
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
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

bullet
false
0
Polygon -1184463 true false 0 165 75 120 300 120 225 165
Polygon -13791810 true false 165 135 75 135 45 150 225 150 255 135

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
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

meteor2
true
2
Polygon -7500403 true false 45 75 105 90 120 45 195 30 195 135 270 165 255 225 210 270 180 255 135 285 105 240 105 195 45 165 30 135 15 150 45 75
Circle -16777216 true false 63 120 46
Circle -16777216 true false 140 172 74

meteor3
true
2
Polygon -7500403 true false 45 105 60 45 107 77 132 28 162 124 268 67 244 180 288 225 208 256 180 292 132 238 100 269 92 204 28 212 33 153 2 115
Circle -16777216 true false 58 116 26
Circle -16777216 true false 99 148 39
Circle -16777216 true false 185 137 28
Circle -16777216 true false 156 210 34

meteor4
true
2
Polygon -7500403 true false 9 87 75 52 80 75 138 52 189 88 227 67 275 140 208 160 249 189 221 217 250 238 202 271 105 257 94 234 41 225 49 185 61 170 81 172 95 182 105 154 73 142 32 126 29 106
Circle -16777216 true false 77 91 29
Circle -16777216 true false 124 169 85
Circle -16777216 true false 195 103 40

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

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
