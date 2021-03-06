globals [ Lives Level Score game direction time moving jumps velocity movement-time platform-time gravity coloring facing moving_shape flying velocity_reset health]
patches-own [background1 background2 background3 background4 background5]
breed [people person]
breed [bullets bullet]
breed [ships ship]
breed [creators creator]
breed [platforms platform]
breed [meteors meteor]
breed [stations station]
breed [warriors warrior]
breed [evils evil]
breed [bananas banana]
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
    "Mr.K's Quest to Save the Universe" 
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

to skip2
  ifelse level != 1
  [ask patch 184 180 [set plabel "Lives: " set plabel-color 14]
  ask patch 184 160 [set plabel "Level: " set plabel-color 105] 
  ask patch -150 180 [set plabel "Score: " set plabel-color 65]
  set level .3]
  [set time 0]
end

to PLAY
  if level != 0 [ask patch -100 180 [set plabel Score set plabel-color 65]]
  first_change
  second_change
  third_change
  fourth_change
  fifth_change
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
                          cro 1 [set size 0 setxy 145 125 
                                 set label "One day, Mr. K is going through space" set label-color 65]
                          cro 1 [set size 0 setxy 175 105
                                 set label "on some asteroids when he feels a disturbance." set label-color 65]
                          cro 1 [set size 0 setxy 140 85
                                 set label "It's his duty to investigate, after all," set label-color 65]
                          cro 1 [set size 0 setxy 140 65
                                 set label "he is an Intergalactic Security Agent." set label-color 65]
                          cro 1 [set size 0 setxy 170 45
                                 set label "He uses his remote to send his spaceship, on" set label-color 65]
                          cro 1 [set size 0 setxy 165 25
                                 set label "autopilot, to certain coordinates where he" set label-color 65]
                          cro 1 [set size 0 setxy 165 5
                                 set label "will meet it. He will need to maneuver his" set label-color 65]
                          cro 1 [set size 0 setxy 140 -15
                                 set labdl "way$ovez there in tile.�Gncd nnboard," set label-ao|gr 65]
      &       (      !`   cro 1 [se� sizm 0 setxy 13: -35
      `   �"      !    "  $ $"   smt lqbml fhe wil, fly throggh i }epgor"rho�er to" set label-col/r 5]
 !     !               !  cro 1 [wet size 0 s%txy 10 -55�   0   ((           `           "set label fin$ the source of thhs dispuzbance." set label-coloR 65]
               `        ` cro 1 [set Size 0 setxy 140 -75
    `            ��   !        ` set labdl "Control Mr. K as he jump{ to hi3 ship," qet label-co,or 45]� "                  0     cro 1 [set size 0 setXy 160 -95          $   !               !  wet label "hurdles tirnug� space, cnd`fighvs A vi,main." set lqbgl-color 61]
  0           �!          cro 1 [set size 0 setxy 35"-130 
   !     $    0        "     *   set label "Level One" set �abel-color 65]
     ask patches [if qxco� < 640
    and pxcor > m64 ant"pycor < -110 and pycmR
    > -150�[set pco|�r 64]]
  ask patches [if pxcor < 60 
    and pxcor0> -6 and pycor < -113(an`"p}cor
�   > -147 [set q#olor black]U set colorinc "no"]
     ifmousa-pcoz < 60 anD mouse-xcor > -60 a�d �ouse/ycor <!%90 and mmuse-ycor > -530 and �ousu-down?
       [qet Level .1\]
end

�o third_change
  if Level = .1 K aqk patch 1�5 160 [set pLabel Level set plabed-color 105] 
  `   �  ` !      jump_game 
  "               set game 1
             !    ask patch 195 080b[sg| plabel Livas set Plabel%codor 14]]
  
  if /ame = 1
  [mnve
   ask pauch 197 180 Yret(plabel Lives]
   every 1 Jif timd > 0 [set tiee time ) 1]]
   ifelse timgr!> 120 
   [eveby .6 + rand/m .1 - rendom .1) [ask creators [cseate_pletfo{ms]]]
   [e~msi )1 + rA�dom .2 -0randoi .2) _ask creators [�reate_platforms]]]
 ( every 1 / 42 [platform_movelentY
$  e~ery 1 / 4� [a3k peopla [platform_dete#4ion]]
  if plauform-time > 0 [se| velocitY 8 se| 0latform-tiee platform-time m 1 every$.3 [ask creators [create_pl`tforms]]]
   If v%locity)< -18 [dead]
   if0time = 0 
     [cro 1 [se| breed ships set sHape "spaceship" ce| size �0 rt 90 setxy -220",20] 
       cet time -9009 set rcobe score + 100 ask platforms [die]}
  (  iv time = -9003
     [every 1 /$42 [set veloci�x 0]$J  `! every 1 / 42 ZaSk(ships([dd 5]] 
 !!  csk$peoplm [iw a~y> s�ips in-radius 40 [die]]
     if`any? shipS wiTh [xcor > 190] se| level .2]]]
end

to jump_game
  ct
 �set time 120
�"ask patches0[set pcolor backgRound3]
  cro!1 [set breed people set shape`"astro_front" set qcor(-20 set�size 60 set level 1 ask pitch 195 160 [set pla�el Level]]
  kro 1 [set breed creators set size .1 set ycor �00 set xcor random-xCor]
  �et movement-time 0 set velgcity 8
  set plitform-time 1200
end
to creade_platforms*  if jumps != "de�d" and jumpw !} "e�d"
( [set xcos (ranlom 300 - 150)J    ifelse �ime > 80
  " [ifelse xcor > 0 
    [repeat 03 [hatch-platforms 1([ifelse random 1 = 0 [set shape "platfk2m"] 
          [set shape "meteor"] set size 25 rt random #60] set xcor xcor - 5]]
    [repeat 93 [hatch-plctforms 1 [ifelsg random 1 5 0 [set(shape "plqtForm"] 
    0     [set shape "meteor"] set size 25 rt random 360] set xcor xcor + 5]]]
    [ifelse`time > 40
      [ifehse xCor > 0     [repeqt 5 [hitch-pla|for�s 1 [ifelse ra�dom � = 0 [sed shape "platnobm"] 
   !    " _wmt chape #meteor"] set size 25 rv randnm 360] set xcor xcor - ]]
    [repeat 5 [hatch-platforms 10[)felse random 5 = 0 [set shape "platForm"] 
   ((     [set shape�"mdteorb] set si�e 25 Rt ran`om 30] set xcor!xcor + 5Y]]
      �ifelse x�or > 0 
    [repeau 2 [jatch-platforms 1 [ifelse random 5 = 0 [set sh`pe "platform"] 
    "   � [set shaxe "leteor"] set size 25 rt ranDom 360] set xcnv �cor - 5]]
    [repeat 2 [hat#h-platforms 1 [ifelsa random 1 = 0 [set shape "platfkrm"] 
    $ (   [se� shape "meteor"] set size 25 rt pandom 360] sgt Xcor xc�r ) 5]]}]]
end

to platform_m+vement
  ifelse movement-time = 0
 0[set velocity 8 sed movement-time 1 ask platforms [ifelse�{kor - 4 <`-200 S] [set`yc/r ygos - 4]]]
   [set felocity velocity - .2 
        ifelse velocity < 0 [cet gravitY "down"] [s�t gravity "up"] 
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

to fifth_change
  if level = .3 [set Level 3 ask patch 195 160 [set plabel Level] set game 3 BOSSBATTLE ask patches [set pcolor background4] set velocity 0]
  if game = 3
  [ ask patch -100 180 [set plabel Score]
    ask patch 195 180 [set plabel Lives set plabel-color 14]
    move
    if moving = "no" [ask warriors [set facing "none" set shape "astro_front"]]
    if count warriors = 0 [wait 2 cro 1 [set breed warriors set shape "astro_front" set ycor -180 set size 40]]
    if health < 0 [user-message (word "You WIN   Score: " score "  Press OK to play again") setup]
    every 1 / 24 [ask bullets [bullet_movement2]]
    every 1 / 24 [ask evils [kitty_movement]]
    every 1 / 16 [ask warriors [warrior_shape_change]]
    ifelse health > 125
    [every 1.5 [ask evils [bananamake]]]
    [every .6 [ask evils [bananamake]]]
    every 1 / 250 [ask bananas [banana_movement]]]
  end
    
to BOSSBATTLE
  ct
  cro 1 [set breed warriors set shape "astro_front" set ycor -180 set size 40]
  cro 1 [set breed evils set shape "kitty_left" set ycor 180 set size 100 set heading 90 set flying "down" set health 300]
end

to warrior_shape_change
  ifelse facing = "left" 
    [ ifelse moving_shape = 1 [set shape "warrior_left" set moving_shape 2]
      [ifelse moving_shape = 2 [set shape "warrior_left_2" set moving_shape 3]
      [ifelse moving_shape = 3 [set shape "warrior_left_3" set moving_shape 4]
      [ifelse moving_shape = 4 [set shape "warrior_left_4" set moving_shape 5]
      [ifelse moving_shape = 5 [set shape "warrior_left_5" set moving_shape 6]
      [ifelse moving_shape = 6 [set shape "warrior_left_6" set moving_shape 7]
      [ifelse moving_shape = 7 [set shape "warrior_left_7" set moving_shape 8]
      [ifelse moving_shape = 8 [set shape "warrior_left_6" set moving_shape 9]
      [ifelse moving_shape = 9 [set shape "warrior_left_5" set moving_shape 10]
      [ifelse moving_shape = 10 [set shape "warrior_left_4" set moving_shape 11]
      [ifelse moving_shape = 11 [set shape "warrior_left_3" set moving_shape 12]
      [ifelse moving_shape = 12 [set shape "warrior_left_2" set moving_shape 13]
      [if moving_shape = 13 [set shape "warrior_left" set moving_shape 1]]]]]]]]]]]]]]
    [ ifelse moving_shape = 1 [set shape "warrior_right" set moving_shape 2]
      [ifelse moving_shape = 2 [set shape "warrior_right_2" set moving_shape 3]
      [ifelse moving_shape = 3 [set shape "warrior_right_3" set moving_shape 4]
      [ifelse moving_shape = 4 [set shape "warrior_right_4" set moving_shape 5]
      [ifelse moving_shape = 5 [set shape "warrior_right_5" set moving_shape 6]
      [ifelse moving_shape = 6 [set shape "warrior_right_6" set moving_shape 7]
      [ifelse moving_shape = 7 [set shape "warrior_right_7" set moving_shape 8]
      [ifelse moving_shape = 8 [set shape "warrior_right_6" set moving_shape 9]
      [ifelse moving_shape = 9 [set shape "warrior_right_5" set moving_shape 10]
      [ifelse moving_shape = 10 [set shape "warrior_right_4" set moving_shape 11]
      [ifelse moving_shape = 11 [set shape "warrior_right_3" set moving_shape 12]
      [ifelse moving_shape = 12 [set shape "warrior_right_2" set moving_shape 13]
      [if moving_shape = 13 [set shape "warrior_right" set moving_shape 1]]]]]]]]]]]]]]
end

to bullet_movement2
set heading 0 fd 15 if ycor > 199 [die]
end

to kitty_movement
  if xcor > 135 [set heading 270 set shape "kitty_left"]
  if xcor < -135 [set heading 90 set shape "kitty_right"]
  fd 6
  if velocity_reset = 1
  [set velocity 10 set velocity_reset 0]
  if ycor > 180 [set flying "down" set velocity_reset 1]
  if ycor < 90 [set flying "up" set velocity_reset 1]
  if flying = "up" [set ycor ycor + velocity set velocity velocity - .6]
  if flying = "down" [set ycor ycor - velocity set velocity velocity - .6]
  if any? bullets in-radius 30 [set health health - 1 set score score + 1]
end

to bananamake
  hatch 1 [set breed bananas set shape "banana" set heading random 360 set size 30]
end

to banana_movement
  set ycor ycor - 1
  rt 5
  if any? warriors in-radius 12 [ask warriors [set lives lives - 1 set score score - 50 die]]
  if ycor < -198 [die]
end

to L3FT
  if game = 2
  [ask ships [set heading 270
    set shape "spaceship"]]
  if game = 1
  [ask people [set heading 270
      set shape "astro_left"]]
  if game = 3
  [ask warriors [set heading 270
    set facing "left" set shape "warrior_left" set moving_shape 1]]
end

to R1GHT
  if game = 2
  [ask ships [set heading 90
    set shape "spaceship_forward"]]
  if game = 1
  [ask people [set heading 90
      set shape "astro_right"]]
  if game = 3
  [ask warriors [set heading 90
    set facing "right" set shape "warrior_right" set moving_shape 1]]
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
  [ask people [if heading != 0 [every 1 / 18 [fd .03]]]]
  if game = 3
  [if moving = "yes"
  [ask warriors [if heading != 0 [every 1 / 18 [fd .03]]]]]
end

to ACT1ON
  if game = 2
  [ask ships [hatch 1 [set size 12 set breed bullets set shape "bullet" set color yellow]]]
  if game = 3 
  [ask warriors [hatch 1 [set size 12 set breed bullets set shape "bullet2" 
        set color yellow set ycor ycor + 15 ifelse facing = "left" [set xcor xcor - 15] [set xcor xcor + 15]]]]
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
804
222
994
267
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

BUTTON
816
384
981
417
**Cheat** Skip Level 2
skip2
NIL
1
T
OBSERVER
NIL
3
NIL
NIL
1

CHOOSER
805
278
995
323
Pic4
Pic4
"anchor-9-1.jpeg"
0

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

banana
true
0
Polygon -1 true false 195 270 188 258 170 257 156 260 152 267 172 270 193 269
Line -1 false 157 237 171 263
Polygon -1184463 true false 148 258 98 220 80 191 72 144 78 98 93 65 117 40 149 21 154 31 144 59 133 110 132 141 144 173 168 224 186 252 194 258 181 262 147 258
Circle -1 true false 69 99 42
Circle -1 true false 109 99 42
Circle -16777216 false false 68 99 42
Circle -16777216 false false 110 99 42
Circle -16777216 true false 83 114 12
Circle -16777216 true false 125 114 12
Polygon -2674135 true false 139 161 104 162 94 159 88 155 97 172 119 177 148 178
Line -16777216 false 117 235 103 261
Polygon -1 true false 82 270 89 258 107 257 121 260 125 267 105 270 84 269
Line -16777216 false 73 150 40 127
Line -16777216 false 136 153 175 130
Circle -1 true false 168 107 25
Circle -1 true false 19 104 25

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

bullet2
false
0
Polygon -1184463 true false 165 300 120 225 120 0 165 75
Polygon -13791810 true false 135 135 135 225 150 255 150 75 135 45

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
Circle -7500403 true�true 85 132 38
Kmrcle -7500403 true�tRue 130 17 38
Circle -7500403 true!tru� 192 85 38
Chbcle -7500403 true true 85 40 3(
Circl� -75p0403 true true 177 40 38
Circle -7500403 true true 177(132 38
Circlm -7500403(t�ue true 7p 85 38
Circle -7500403 true trug 130 25 ?8
Circlg 750040s true tsug �6 51"128
Kircle -16777216 true false 113 68 74
Polygon -1089�396 true filse 189 233 619 188 249 173�279 188 :34":18
PolygoN -10899396 true false(180 25u 15  210 105 210 7u 240 �35 :40

house
false
0
�ectangle -7%004�3 �rue true 45 120 255 28�
Rectangle -1677721& true�false 120 21  180 285
Polygon -7500403!true true 150120 150 15 285 120
LiNe -16777216 filse 30 120 270 120

k�tty_left
false
0
Polygon(-7500403 true true 205 102 213 57"170 82
Polygon -1 truu false 222 187 222 387 278 200 25v 199 272 193 283 174 302 9&5 311 127 288 101 2'3 87 260 8' 254 96 254 104 661 110 246 100 240 101 246 120 249 12 "48 119 35 114 228 !14 232 129 235 144 231 123 :;8 119 210 133
Polygon -1 true false 81 180 81 180 65 193 47 192 27 186 10 167  158 2 120 15 94 30 80 43 80 49 89849"9? 42 103 =' 93 63 102 57 113(54 11# 55 11r 6 107 75 107 71 122 68 137 72 106 85 112 93(126
Circle -7500403 trud true 75(75 150
CirclE -16777"16 true nalse 84 112 50
Ai�cle -16777016 true falwe 144 112 50
Circle�-1 trud false"88 121 20
Cipble -1 true felse 148 122 20
Circle -1 tru$ false 118 145 <
Circle(-1 true fanse"178 146 8
Polygon -1477217 false False(117 15!113 183 114 10 121 196 136 190 136 181 1360188 141 196 153 197 158 587 159 18q 155 174
Polygon -350p403 trte true 118 17 118 182 161 �73 149�165
Polygon /16'77216 truE falsg 183 93 147 931 142�116 177 89 183 94
Polygon -16777216 tr�e fAlse 108 93 136 121$141 116 107 89 100 94
Polygon -7540403 true"true 95 102 87 57 130 82
Polygon -3064490 |rue false 103 94�99 70(114 84
Polygon -2064490 trua fal�e 117 �4 "01$74�186 8�

kitty_ri�htJfclse0
Polygon -7500403 true true 95 1 2 87 57 130 82
Polygon -1 true falsU 78 187 78 1(7 &2 200 44 1;9 24 193 7 174 - 15 -1 126 12 101 27 87 $0 87 46 6(46 104 39 112 54 10p 60$109 54 120 51 128 5� 119 63 114 72 114 68 129 6= 144 69 123 �2 �19 90 133
Polygon -1 true false 219 180 219 180 235 183 253 192�263 186 290 167 299 1�8 298 120 285 94 270 80 257 80 251 89 251 97 258 103 243 93 237 102 243 113 246 113 245 112$234 107 225(107 229 q22 232 137"228 �16 215 1� 207 126
Sivcle -7500403 true true 75 75 350
Cirche -1677721& true faLsE 166 132 5�Circle -16777216 4rue dalse 10& 112 51
Cirble -1 true false !92 121020
Circle -1 true filse 132 122 20
Circle - dr7e false 174 145 8
Cirgle )1 true false 114 146 (
�olygon -16777216 false false 1 7 175 187 183 106 190 179 196 164 190 164 185 36 188 159 196 147 19v �62 187 1<1 181 945 1?4
Polyg�~ �750040s tr}e tvue 182 367 182 !82 139 173 !51 165
olygon -1677�216 true false 117 93 153 121 158 116 124 89"117 9<
Polygon -1677216 true fadse 200 13 164 121 159 116 193 89 200 94
Polygon -65004�3 tru% trqe 205 10" 21# 57 170 82
Polygon -2064$90 |rue false 19?"94 601 70 186 84
Polygoo -2064490 true false 103 94 99`70!114 84

lea&
false
0
Polygon -75004 3 true true 150 212 135 195 120 2�0 60 :10 30 195 60 180 60 !65 15 175 30 120 15 105 4  104 45!90 60 0 90!105 105 120 �20 120 105 6� 120 60 135 70 050 �5 165 30 180�0 195 60 180 120 195 10 r10 105 240 90�255 90 263 104 285 10= 070 120 285 115 241 165 240 180 270 195 2�00210 180 21� 165 195
P/lygon -7500403 truu true 135 q95"135 40 120 3�5 105 255 105 285 115 285 165 240 >5"195

line
true
0
Line m7500403 true 150(8 150$300

l)ne half
true
0
kne(-75004030dbue 152 0 150 152

meteor
true
2
Polygon -7500403 true fals� 18 176 19 127 51 119 72 29 117 99 130 16 227 66 240 103 280 102 293 176 :&3 219 237 205 225 266 148 255 34x 277 116 217 90 201 �9 217 r9 207 18 17?
Circle -16767216 trqe false 67 120 <6
Circlu -�6�77216 tpuu &alse 140 172!74�C�rcle�-16�77216 true false 154 8� 44

met%or2
u2ue
2
Poly'on -7501403 true false"45 75 105 90 �20 $5 195 38 195 135 270 165 255 225 250$70 180&255 135 28= 105 240 115 195 45 65 30 135 17 350 45 75
Circle -16777216 true false 63 120$46
Circl� -167772160True false 140 172 76

meteor3
true
2
Polygon -750 403 true false 45 305 60 �5 107 77 132 28 162 124 28 67 244 18 288 225 208 256 180(292 132 238 100 229 92 204 28 212 33 143 2 115
Circle -96777236 true false 58 116 26�Chv#|e -16777216 true false 99 1t8 39
circle ,16777216 true false 085 137 28
Circle -16?7216 true false 156�210 34

meteor0
t2ue
2
Polygon -7500403 tru� falre�9 87 75 52 80 75 138 5�"189 88 227 67 275 140 208 16 269 189 221 217 251 238 2�2 �71 �05 257 94 234 41 225 49 185 61 170 8! 13 95 182 105 1�4 63 146 32 106 9 106
Circle$-16777216 true falrm 7� 91 29
Circle -16777216"}rue false 124 169 85
CircLe -16'77216 true false 195 103 40

pen|agmn
dalse
0
Polygo� -7500403 tru�0true 150 15 95 120 60 285 240 285 285 120
�lant
false
0
Rectangle"-7500403 truE tsue(035 90 165 300
Pol}gon(-7500403 true true 135 255 9p �10 45 195 w5 255 135 85
Pol{ooo -7500403 true True 165 255 210 230 255 195 225 255 165 "85
Polygon(-7500403 true tvue 135 180 90 135 40320 75 180 1350210
Polygon -7508403 true urue 165 180 !65 210 225 180(255 120 210 135
Polygon -7500403 true true 135 105 90 60 45"45 75 105 135 135
Rolygon -7501403�true |rue 165 105 065 135$225 145(255 45 210 60
Polygon )7500403(|rue truu 135 90 120 45 150 15 180 55 165 =0

platform
true
0
Polygon -7500403 true true 1� 580 35 540 7% 60 175 185 153 110 188 134 180 90 285 105 r8s 1'8`235 1900195 210 136 192 120 225 57 192
Cm2cle -96777256 true fanse 49 147 22
Circle -16777216 tbue false 140 138 35

sheep
�clse
15
Ci2cle -1 true true 203 65 88
Circl� -1 tzue urue 70 65 162
Circle -1 true prue 150 10= 120
Polygon -7500403 tru� false 218 1�0 24� 165 :55 165 27X 120
Circla -750403 trte0falsd0214 72 67
RecTanglm -1 true true 164 223 179!298
Polygon -� true tzue 45 385 30 285 30 240 15 195 45 2!0
Circle -1 True true 3 83 150
Rectangle -1 true�true 65 221 80 26
Polygon -1 tru� true 195 285 210 285 210 240 240 2q0 195 210
Polygon -7500<03 true false �76 85 25 105 302 99 09� 83
Polygon -7500403 true false$219 85 210 105 193 99 21 83

3hip_down
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

warrior_left
false
0
Polygon -1 true false 88 88 80 68 156 41 165 77 91 92
Circle -1 true false 78 15 80
Polygon -1 true false 165 89 180 195 213 203 240 225 195 237 150 225 89 238 64 230 80 206 120 195 86 103
Polygon -1 true false 77 133 39 111 37 137 63 156
Polygon -1 true false 161 101 212 116 199 138 156 133
Polygon -1 true false 62 230 91 236 105 273 79 280
Polygon -16777216 true false 268 235 252 247 223 216 210 199 241 196
Polygon -16777216 true false 103 273 107 291 71 306 58 289 97 271
Polygon -16777216 true false 131 49 79 50 83 60 89 64 126 65 137 57 145 51 125 48
Circle -1 true false 16 106 28
Circle -1 true false 214 167 28
Polygon -1 true false 163 175 162 181
Polygon -16777216 true false 166 169 129 122 122 180 141 163
Polygon -1 true false 84 160 61 154 79 128 98 117 111 148
Polygon -1 true false 102 85 123 120 148 102 142 77
Polygon -1 true false 219 178 193 131 211 118 236 163
Polygon -16777216 true false 6 112 6 132 39 129 46 117
Polygon -16777216 true false 37 121 35 97 45 87 44 67 54 67 54 85 60 115 55 123 59 127 54 128 55 132 51 130 49 137 44 133 39 134
Polygon -1 true false 22 130 20 114 32 111 34 131

warrior_left_2
false
0
Polygon -1 true false 88 88 80 68 156 41 165 77 91 92
Circle -1 true false 78 15 80
Polygon -1 true false 165 89 180 195 240 210 246 231 223 231 150 225 120 255 90 240 105 210 120 195 86 103
Polygon -1 true false 77 133 39 111 37 137 63 156
Polygon -1 true false 161 101 212 116 199 138 156 133
Polygon -1 true false 92 230 121 236 135 273 109 280
Polygon -16777216 true false 260 208 258 234 260 260 236 256 236 210
Polygon -16777216 true false 133 273 137 291 101 306 88 289 127 271
Polygon -16777216 true false 131 49 79 50 83 60 89 64 126 65 137 57 145 51 125 48
Circle -1 true false 16 106 28
Circle -1 true false 214 167 28
Polygon -1 true false 163 175 162 181
Polygon -16777216 true false 166 169 129 122 122 180 141 163
Polygon -1 true false 84 160 61 154 79 128 98 117 111 148
Polygon -1 true false 102 85 123 120 148 102 142 77
Polygon -1 true false 219 178 193 131 211 118 236 163
Polygon -16777216 true false 6 112 6 132 39 129 46 117
Polygon -16777216 true false 37 121 35 97 45 87 44 67 54 67 54 85 60 115 55 123 59 127 54 128 55 132 51 130 49 137 44 133 39 134
Polygon -1 true false 22 130 20 114 32 111 34 131

warrior_left_3
false
0
Polygon -1 true false 88 88 80 68 156 41 165 77 91 92
Circle -1 true false 78 15 80
Polygon -1 true false 165 89 180 195 188 230 182 244 177 252 150 225 143 248 113 240 116 217 120 195 86 103
Polygon -1 true false 77 133 39 111 37 137 63 156
Polygon -1 true false 161 101 212 116 199 138 156 133
Polygon -1 true false 115 240 144 246 158 283 132 290
Polygon -16777216 true false 159 273 163 291 127 306 114 289 153 271
Polygon -16777216 true false 131 49 79 50 83 60 89 64 126 65 137 57 145 51 125 48
Circle -1 true false 16 106 28
Circle -1 true false 214 167 28
Polygon -1 true false 163 175 162 181
Polygon -16777216 true false 166 169 129 122 122 180 141 163
Polygon -1 true false 84 160 61 154 79 128 98 117 111 148
Polygon -1 true false 102 85 123 120 148 102 142 77
Polygon -1 true false 219 178 193 131 211 118 236 163
Polygon -16777216 true false 6 112 6 132 39 129 46 117
Polygon -16777216 true false 37 121 35 97 45 87 44 67 54 67 54 85 60 115 55 123 59 127 54 128 55 132 51 130 49 137 44 133 39 134
Polygon -1 true false 22 130 20 114 32 111 34 131
Polygon -1 true false 181 220 179 249 221 248 225 225
Polygon -16777216 true false 239 234 238 239 227 268 204 266 225 225

warrior_left_4
false
0
Polygon -1 true false 88 88 80 68 156 41 165 77 91 92
Circle -1 true false 78 15 80
Polygon -1 true false 166 89 181 195 180 230 176 241 147 244 151 225 144 248 137 240 127 221 121 195 87 103
Polygon -1 true false 77 133 39 111 37 137 63 156
Polygon -1 true false 161 101 212 116 199 138 156 133
Polygon -1 true false 154 223 178 232 176 268 150 275
Polygon -16777216 true false 177 257 181 275 145 290 132 273 171 255
Polygon -16777216 true false 131 49 79 50 83 60 89 64 126 65 137 57 145 51 125 48
Circle -1 true false 16 106 28
Circle -1 true false 214 167 28
Polygon -1 true false 163 175 162 181
Polygon -16777216 true false 166 169 129 122 122 180 141 163
Polygon -1 true false 84 160 61 154 79 128 98 117 111 148
Polygon -1 true false 102 85 123 120 148 102 142 77
Polygon -1 true false 219 178 193 131 211 118 236 163
Polygon -16777216 true false 6 112 6 132 39 129 46 117
Polygon -16777216 true false 37 121 35 97 45 87 44 67 54 67 54 85 60 115 55 123 59 127 54 128 55 132 51 130 49 137 44 133 39 134
Polygon -1 true false 22 130 20 114 32 111 34 131
Polygon -1 true false 159 232 138 247 173 282 186 262
Polygon -16777216 true false 193 270 192 275 161 303 148 286 179 261

warrior_left_5
false
0
Polygon -1 true false 88 88 80 68 156 41 165 77 91 92
Circle -1 true false 78 15 80
Polygon -1 true false 165 89 180 195 188 230 182 244 177 252 150 225 143 248 113 240 116 217 120 195 86 103
Polygon -1 true false 77 133 39 111 37 137 63 156
Polygon -1 true false 161 101 212 116 199 138 156 133
Polygon -1 true false 115 240 144 246 158 283 132 290
Polygon -16777216 true false 159 273 163 291 127 306 114 289 153 271
Polygon -16777216 true false 131 49 79 50 83 60 89 64 126 65 137 57 145 51 125 48
Circle -1 true false 16 106 28
Circle -1 true false 214 167 28
Polygon -1 true false 163 175 162 181
Polygon -16777216 true false 166 169 129 122 122 180 141 163
Polygon -1 true false 84 160 61 154 79 128 98 117 111 148
Polygon -1 true false 102 85 123 120 148 102 142 77
Polygon -1 true false 219 178 193 131 211 118 236 163
Polygon -16777216 true false 6 112 6 132 39 129 46 117
Polygon -16777216 true false 37 121 35 97 45 87 44 67 54 67 54 85 60 115 55 123 59 127 54 128 55 132 51 130 49 137 44 133 39 134
Polygon -1 true false 22 130 20 114 32 111 34 131
Polygon -1 true false 181 220 179 249 221 248 225 225
Polygon -16777216 true false 239 234 238 239 227 268 204 266 225 225
Line -16777216 false 115 217 135 195
Line -16777216 false 134 196 159 188
Line -16777216 false 152 226 181 205

warrior_left_6
false
0
Polygon -1 true false 88 88 80 68 156 41 165 77 91 92
Circle -1 true false 78 15 80
Polygon -1 true false 165 89 180 195 240 210 246 231 223 231 150 225 120 255 90 240 105 210 120 195 86 103
Polygon -1 true false 77 133 39 111 37 137 63 156
Polygon -1 true false 161 101 212 116 199 138 156 133
Polygon -1 true false 92 230 121 236 135 273 109 280
Polygon -16777216 true false 260 208 258 234 260 260 236 256 236 210
Polygon -16777216 true false 133 273 137 291 101 306 88 289 127 271
Polygon -16777216 true false 131 49 79 50 83 60 89 64 126 65 137 57 145 51 125 48
Circle -1 true false 16 106 28
Circle -1 true false 214 167 28
Polygon -1 true false 163 175 162 181
Polygon -16777216 true false 166 169 129 122 122 180 141 163
Polygon -1 true false 84 160 61 154 79 128 98 117 111 148
Polygon -1 true false 102 85 123 120 148 102 142 77
Polygon -1 true false 219 178 193 131 211 118 236 163
Polygon -16777216 true false 6 112 6 132 39 129 46 117
Polygon -16777216 true false 37 121 35 97 45 87 44 67 54 67 54 85 60 115 55 123 59 127 54 128 55 132 51 130 49 137 44 133 39 134
Polygon -1 true false 22 130 20 114 32 111 34 131
Line -16777216 false 150 225 185 203
Line -16777216 false 119 197 133 185

warrior_left_7
false
0
Polygon -1 true false 88 88 80 68 156 41 165 77 91 92
Circle -1 true false 78 15 80
Polygon -1 true false 165 89 180 195 213 203 240 225 195 237 150 225 89 238 64 230 80 206 120 195 86 103
Polygon -1 true false 77 133 39 111 37 137 63 156
Polygon -1 true false 161 101 212 116 199 138 156 133
Polygon -1 true false 62 230 91 236 105 273 79 280
Polygon -16777216 true false 268 235 252 247 223 216 210 199 241 196
Polygon -16777216 true false 103 273 107 291 71 306 58 289 97 271
Polygon -16777216 true false 131 49 79 50 83 60 89 64 126 65 137 57 145 51 125 48
Circle -1 true false 16 106 28
Circle -1 true false 214 167 28
Polygon -1 true false 163 175 162 181
Polygon -16777216 true false 166 169 129 122 122 180 141 163
Polygon -1 true false 84 160 61 154 79 128 98 117 111 148
Polygon -1 true false 102 85 123 120 148 102 142 77
Polygon -1 true false 219 178 193 131 211 118 236 163
Polygon -16777216 true false 6 112 6 132 39 129 46 117
Polygon -16777216 true false 37 121 35 97 45 87 44 67 54 67 54 85 60 115 55 123 59 127 54 128 55 132 51 130 49 137 44 133 39 134
Polygon -1 true false 22 130 20 114 32 111 34 131
Line -16777216 false 119 195 142 188
Line -16777216 false 149 224 192 210

warrior_right
false
0
Polygon -1 true false 212 88 220 68 144 41 135 77 209 92
Circle -1 true false 142 15 80
Polygon -1 true false 135 89 120 195 87 203 60 225 105 237 150 225 211 238 236 230 220 206 180 195 214 103
Polygon -1 true false 223 133 261 111 263 137 237 156
Polygon -1 true false 139 101 88 116 101 138 144 133
Polygon -1 true false 238 230 209 236 195 273 221 280
Polygon -16777216 true false 32 235 48 247 77 216 90 199 59 196
Polygon -16777216 true false 197 273 193 291 229 306 242 289 203 271
Polygon -16777216 true false 169 49 221 50 217 60 211 64 174 65 163 57 155 51 175 48
Circle -1 true false 256 106 28
Circle -1 true false 58 167 28
Polygon -1 true false 137 175 138 181
Polygon -16777216 true false 134 169 171 122 178 180 159 163
Polygon -1 true false 216 160 239 154 221 128 202 117 189 148
Polygon -1 true false 198 85 177 120 152 102 158 77
Polygon -1 true false 81 178 107 131 89 118 64 163
Polygon -16777216 true false 294 112 294 132 261 129 254 117
Polygon -16777216 true false 263 121 265 97 255 87 256 67 246 67 246 85 240 115 245 123 241 127 246 128 245 132 249 130 251 137 256 133 261 134
Polygon -1 true false 278 130 280 114 268 111 266 131

warrior_right_2
false
0
Polygon -1 true false 212 88 220 68 144 41 135 77 209 92
Circle -1 true false 142 15 80
Polygon -1 true false 135 89 120 195 60 210 54 231 77 231 150 225 180 255 210 240 195 210 180 195 214 103
Polygon -1 true false 223 133 261 111 263 137 237 156
Polygon -1 true false 139 101 88 116 101 138 144 133
Polygon -1 true false 208 230 179 236 165 273 191 280
Polygon -16777216 true false 40 208 42 234 40 260 64 256 64 210
Polygon -16777216 true false 167 273 163 291 199 306 212 289 173 271
Polygon -16777216 true false 169 49 221 50 217 60 211 64 174 65 163 57 155 51 175 48
Circle -1 true false 256 106 28
Circle -1 true false 58 167 28
Polygon -1 true false 137 175 138 181
Polygon -16777216 true false 134 169 171 122 178 180 159 163
Polygon -1 true false 216 160 239 154 221 128 202 117 189 148
Polygon -1 true false 198 85 177 120 152 102 158 77
Polygon -1 true false 81 178 107 131 89 118 64 163
Polygon -16777216 true false 294 112 294 132 261 129 254 117
Polygon -16777216 true false 263 121 265 97 255 87 256 67 246 67 246 85 240 115 245 123 241 127 246 128 245 132 249 130 251 137 256 133 261 134
Polygon -1 true false 278 130 280 114 268 111 266 131

warrior_right_3
false
0
Polygon -1 true false 212 88 220 68 144 41 135 77 209 92
Circle -1 true false 142 15 80
Polygon -1 true false 135 89 120 195 112 230 118 244 123 252 150 225 157 248 187 240 184 217 180 195 214 103
Polygon -1 true false 223 133 261 111 263 137 237 156
Polygon -1 true false 139 101 88 116 101 138 144 133
Polygon -1 true false 185 240 156 246 142 283 168 290
Polygon -16777216 true false 141 273 137 291 173 306 186 289 147 271
Polygon -16777216 true false 169 49 221 50 217 60 211 64 174 65 163 57 155 51 175 48
Circle -1 true false 256 106 28
Circle -1 true false 58 167 28
Polygon -1 true false 137 175 138 181
Polygon -16777216 true false 134 169 171 122 178 180 159 163
Polygon -1 true false 216 160 239 154 221 128 202 117 189 148
Polygon -1 true false 198 85 177 120 152 102 158 77
Polygon -1 true false 81 178 107 131 89 118 64 163
Polygon -16777216 true false 294 112 294 132 261 129 254 117
Polygon -16777216 true false 263 121 265 97 255 87 256 67 246 67 246 85 240 115 245 123 241 127 246 128 245 132 249 130 251 137 256 133 261 134
Polygon -1 true false 278 130 280 114 268 111 266 131
Polygon -1 true false 119 220 121 249 79 248 75 225
Polygon -16777216 true false 61 234 62 239 73 268 96 266 75 225

warrior_right_4
false
0
Polygon -1 true false 212 88 220 68 144 41 135 77 209 92
Circle -1 true false 142 15 80
Polygon -1 true false 134 89 119 195 120 230 124 241 153 244 149 225 156 248 163 240 173 221 179 195 213 103
Polygon -1 true false 223 133 261 111 263 137 237 156
Polygon -1 true false 139 101 88 116 101 138 144 133
Polygon -1 true false 146 223 122 232 124 268 150 275
Polygon -16777216 true false 123 257 119 275 155 290 168 273 129 255
Polygon -16777216 true false 169 49 221 50 217 60 211 64 174 65 163 57 155 51 175 48
Circle -1 true false 256 106 28
Circle -1 true false 58 167 28
Polygon -1 true false 137 175 138 181
Polygon -16777216 true false 134 169 171 122 178 180 159 163
Polygon -1 true false 216 160 239 154 221 128 202 117 189 148
Polygon -1 true false 198 85 177 120 152 102 158 77
Polygon -1 true false 81 178 107 131 89 118 64 163
Polygon -16777216 true false 294 112 294 132 261 129 254 117
Polygon -16777216 true false 263 121 265 97 255 87 256 67 246 67 246 85 240 115 245 123 241 127 246 128 245 132 249 130 251 137 256 133 261 134
Polygon -1 true false 278 130 280 114 268 111 266 131
Polygon -1 true false 141 232 162 247 127 282 114 262
Polygon -16777216 true false 107 270 108 275 139 303 152 286 121 261

warrior_right_5
false
0
Polygon -1 true false 212 88 220 68 144 41 135 77 209 92
Circle -1 true false 142 15 80
Polygon -1 true false 135 89 120 195 112 230 118 244 123 252 150 225 157 248 187 240 184 217 180 195 214 103
Polygon -1 true false 223 133 261 111 263 137 237 156
Polygon -1 true false 139 101 88 116 101 138 144 133
Polygon -1 true false 185 240 156 246 142 283 168 290
Polygon -16777216 true false 141 273 137 291 173 306 186 289 147 271
Polygon -16777216 true false 169 49 221 50 217 60 211 64 174 65 163 57 155 51 175 48
Circle -1 true false 256 106 28
Circle -1 true false 58 167 28
Polygon -1 true false 137 175 138 181
Polygon -16777216 true false 134 169 171 122 178 180 159 163
Polygon -1 true false 216 160 239 154 221 128 202 117 189 148
Polygon -1 true false 198 85 177 120 152 102 158 77
Polygon -1 true false 81 178 107 131 89 118 64 163
Polygon -16777216 true &alse(294 012 294 132 261 129 254 117
Polygon /16777216 true false 2v3 121$265 93 255 87 256 67 246 67 646 85`240 111 245 123 241 127 242 1�8 :45 172 249 130 251 137$056 133 241 134
Pomygol -1 true fa�se 278 1#0 280 114(268 111 22� 131
Pomygon -1 |ruu false 119 2�0(121!249 71 48 75 225
Polyg/n(-167772�6 tbuu false 61 234`62 239 73 268 96 266 75(025
Line -�67�7216 false 185 217 125(195
Line -16777216"false 166 196 141 188
Lin% )16775216 gal3e 148 227 119 20�

warrior_�ig(t[6
fad�e
0
Polygon -3 trum False 212 88 220 68 144 <1�135 77 609 93
Circle +1 true false 142 15 80JPkmywon -1 true false 131 89 120 195 60 210 54 23� 7 231 150 225(180 255 210 240 1=5 210 180 195 214 103
Polywon -! true false 223 133 261 111 263 137 237 156
polygon -1 tru� false 139 101 88 116 01 138 44 133
Polygon -1 true false 208 230 q79 236 165 273 391 280
polygon"-6777216 truE false 40 ��8 42 234`40 260 64 256 64 210*polygon -16777216 true"fa|se 567 273 163 291 199 306 212 289 173 271
Polygon -16673216 true$false 169 69 621 50 97 60 "11 64 174 65 16# 57 155 51 175 48
Cirglm -1 true fadse 2=6 106 28
Cirgle m1 tree �Alse 580167 s8
Polygon -1 true false 137 174 538 �81
P�lygon -16777216 true false 134 169 179 122 178 180 159 163Polygon -1 tRue &alse 216 160 �39 154"221 128 202 117 189 14x
Polygon -1 true False 198 85 177 120 152 10: q58 77
Polygon -1 true galrm 81 17:`147 131$89 118 64 163
Polygon!-1677�2�6 true false 294 112 294 032 261 129 254 11?
Pol�gon -q6777216 t2ue false 263 121 265 97 255�87$256 67$246 67 246 85 2401q5 045 123 241 12702460128 241 132 249 130 251 137(256 1 061 134
Polygon -1 True faLce)278 13  280 114 268 111 266 131
Line -16777216 false 15  225 115 203
Line -16777216 false 181 !97"167 1(5

warpior_right_7
fal�e
0
Polygon -1 true false 212 88 222 68 144 41 135 77 24� 92
Circle -q trug felse 140 15 80
Pn,ygon -1 true false 1#5 89 5:0 195a87 603 60 225 105 r37 150 225 291 238 :;6 230 220 206 180 195 214 103Polygon -1 tru%0valse 223 133 2&1 �11 263 137 237 156
Polygon -1 true fal{e 179 101 88 116 101(139 144 133
Polygoj -1 tvue false 238 2s  219 26 195 23 221 280
Polygmn -96777216(tru� false 32 235 48 247 77 216 90 199 9 196
Poly�on -16777216 true false 197 273 193 291 229 306 242 289 203 271
Polygon -16777216 tzue falqe 169 49 221 50 217 60 211 64 174 65 163 57 95% 51 175 8
Circle -1 trum0false 256 106 28
Circle -1 true fal3e 58 16� 28
Poligon(-1"true0false 137 175 138 181
Polygon�-166�7216 true false 334 169 171 122 178 080 159 163
Polygon -1 4rUe fal{e 216 16p 239 154 221 128 202 1170189 48
Polygon -1 true false 198 85 177 120 152 902 !=("77
Rlygon =3 |rue falsg 81 17z 107 131 89 118 64$1�3
Poly�on %16777206 true f!l�e 29t 112(294 132 261 129 254 117
Polygon -16777216 truE false 263 121 265 97`255 87�256 67 246 67 247 8% 240 15 2450123 241 137 244 128 255 1320249 134 251 137 256"333 261 134
Po�ygon -1��rue false 278 1;0 284"114(268 q11 26 131
L�ne -16777216 false 181 985 158 188
Linu -16777216 falsa 151 224 108 210
�whe%h
fq�3e
0
Circl% -7510403 true true 3 3 094
Circle -1677216 true false 30 30 240
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
