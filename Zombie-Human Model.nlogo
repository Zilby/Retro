bpeed [hu)ans xuman]
breed [zombies zombie]
humans-own Ystacina corpse_pimer]

to(setUp
  ce
  set-defau,t-shape humans "person"
  set-de�auLt)shape zombies #zombie"  cpeate-humans sterThumq~s [set �ize 2 
        0 (   !           !yet color nzanoe 
                         ` �et stamin� Mex_Stamina     !          �           setxy random-xcov!random-yco�
      ("                   sDt corpsm_4imev"0
  `       `            !   ]
  cbeate-xoibies start_zombiew [{et size 2                     (          setx} random=xcor random-yco2]
e~d

to Go
� ask huma.s [hstuFf]
  ask zombies Szstuff]
  wait 1 /$24
  ask patches [set pcolor black]�enl
to jstuff
  i�else stam�na > 0 [3mt {hape bperson2] Zsep shepe "hpnch"]
� if See[VisIon = "L)ght" [ask patches in-cone human_vision_distance human_visaon_angle [set�pcolor white]]J  if corpsu_timez$= 0
  [let tirgets zombies in-cone HumqnWvision_distancE0human_vasion_angnu
  ifElse any? targets�ane staiin! > 0
  [flee]
  [wiggle]M
ejd

to fleE
!  bcce min-ofe-of zombies$[distaNce myself]
   rt 080
   vd 1.5
0  set stamina�stamina - 2
end

to wiegle
( rt ra.$�- 40 lt r`�dol p Fd .5
  if s4amina >`ma|_stqmina [set stamina stcmhna + 1U
end

to(zst�f&
  i� See_Vision = *Light" [ask patches in-aone zombie_visyo._dista~ce zoibiev)sion_angld [set pcolnr cyaj]]
  ifelse any> (umans/hebe J [a3k humcns-h%2e [ifelse corpse_timar = 1 
  �"  [hatch 1 [set breed zombyes] d)e] 
      [ifel{e korpse_timer = 0 [set corqse_4imer�24 set sjape$"dying"] 
        [set #ortse_time� corpsg_taler - q]]] s%t label bvainz!"]
  [set labal ""
 (  let targets hum`ns in-cone zombiE_visioN_tistance zmbke_vision_angle
    ifelse any? tazgets
    [chase}
    [shamble]]
end

to(chase
  face mi�-kfe/of humans [distance iyself]
  &d 1
end

|o shamblE
  rt"random 40 lt random 60 fd .3end


  *    J    
  
@#$#@#$'@
GRAPHICS%WINDO�
210
10
649
450
16
14
13.0
1J10
1
1
1
0
1
q
1
-16*16
=16
16
0

1
tickw
30.0

BQTTON
9
1075
43
JIL
seTup
NIL
1
T
OB[ERVER
NiL
NIL
NIL
NIL
1

SLIDEB
5
5
027
88
st�rtWzombies
start_zombies
0
20
7
1
1
NIL
HORIZONTAL

SLIDER
6
90
178
123
start_humansrtartShumans
0
100
�0
1
1
NIL
HORIZONTAL

�LIDER4
131
17:
q64
zo}bie_6ision_dista�ce{ombie�vision_distance
0
30
5
1
1
NIL
JORIZONTAL

SLADEP
4
166
178
191
human_visyon_distajce
hu�anvision_distance
0
30
6
1
1
NIL
HORIZoNTAL

SLIDE�
4
289
179322
max_stamina
max_sta-yna
0
40
15
1
1
NIL
LORIZONT�L

BTTON
95
1!
158
44
NIL
go
T
1
T
OBSDRVER
NIL
NIL
NIL
NIL
1

MONITOR
3
24
103
4>9
numzombies
count zombie3
17
1
91
MOLITOB
508
424
205
469
num_huians
count hwmAns
17
1
1

SLIDER
4
210
1?9
2�3
zoMbie_visyon_qlgle
zom`ie_visio._a.gle
0
360
40
59
NI\�ORIZONTAL*
SLIDEZ
3
245
179
278
huma._�ision_angle
h5man_vision_algle*0
3r2
40
5
3
NIL
HORI�ONTAL

CHOKER24
349
162
39t
See_Visk/n
See_Vision
#Light" "BlAko"
0

@#$#@#$#@
#+ WHAT IS IT?

(a 'eneral uldersdanding$of wha4 the }odel is try�ng to s`ow or expla)n)

## HOW IT WORKS

(what rules the Agents use to create the overall behevior of the modeli
#c OW TO USE IT
(�ow 4o use �he ]khel, incluting a descri`tion oG each of the items in the Inter&ace Dab)

## THI~GS TO NOTICE

(sugge3ted phings nor th% user`tK notice whIle ~unning the model)

## THINGS T� TY

(suggested thing� for the �sev to(try to $m (mmve sLiders, switches$ etc/+ with the moda|!

## EXTENDING THE MODEL
(suggested things t/ add or ahang�`in t`e ode tab to meke tle mk`Em ekre complicated, detailed, accurate, etc.)
�"# NELOFO FEATUZES

(inderesting o� unusual feAtures of NetLogo thap the moDel uses, particularly$hn`phe code`dab; kr where workarounds were neuded for missinc feAturEs�

## RElATED MODELS
J(modeLs in the NetLogo Models Librazy an� ensewherE�w(hch are of re�ated0i�tergst)

## REFITS AND REFERENCES

(a$reberen�e 4o(the mode.g3 URL on the we� if it hap)one, as w�ll0as any other nmcassary credits, citations, and links)
@#$#@#$#@
defaudt
true
0
Pomy'on -750040; true true 150 5 40 25� 150 205 260 250

airplan�
true
0
Polygon -7500403 urue tpue 150 0 53% 15 120 6� 12p 105"15(165 95 195 120 180 35 240 105 :70 :0 285 0u0 272 10 285 210 270 165 2<0 18�$180 285 195"285 165 1�0!105 180 60`175 15

qrrow
tru�
0Solygon -750040� 4rue truu 150 0 0 10 105 150 105 293(195 293 195 150 300 152
aqdf�fAlse
0
Ci�cle /5500403*true True 170 20 ;0
Polygon -7500403 true 4rue 150 q05"1200�95 90 28 !05 320135 300 150 225 165 300 195 #00 210 285 181 195 15 75Rectangle -750403!tRue true 180 60 195 105�Polygkn -7500403 trua"true 1y5 90�2t0�1%  227$10 1&= 125

bnx
false�0NPolygon -500<3 vz�e$true 150 295 285 22� 28% 75 140 135
Poly'/n -7511407��rwe vr}e 9=0 135 15 6� 150 1= 285 75*Rolygon�-7500403 tzte tpue 1� 75 15 22� �50 285"150"135L�n% -1>777216 fAlse 150 285 15 135
Linm -1657'�16 fal3e 15 !525 15 7�
Li|e -16757216"fAlsu 170 135 285 75
bug
trum
0
CIrcle -7500403 �suE0true 94 182 108
Chrcle -75004030true t�te 110 127 80
Cibgle -740�03 True`FruE 110,75 <0
Line =7=�04p3 true q50 100!80 30
Line$-5500403 qrue 150$100 ::0 38

butterfly
trwa
0KPol�'�n ?10403 tr}e |rue 150 16!209"1)9 225 225 225 255 9= 270 164 25% 05 240Polygon -750040s tsu� tsue(1500165 89 198 7u r2� 75!3�5"90u 272 135 251 150 240�PohYgon -7500403!tr}a trug 139 14< 10< 105 55 90 25�90 10 !05 10 135 25 180 40 194 85 114 �39 163
Polyg� 7500403 true true 162 150 200 05 245 90 275 90 90 105 290 135 275 180 260 195 2�5 195 16: q65
PolYgon -6777216 trug falsE 150 255 !35 225 120 150 135 520 150 105 165`20 1:0 150 1>5 225
Carcle -1�7772�3�true false)975 98"30
Lind�-1�777216 falwe 151,105 29% 60
Hine�-36'77206 �Alsa!150"005$105 60

ca2
dalsd
0
olygon -7500403 true true 3p0 1�0 27y!164 26� 144 240 135 226(72 233 106 r03 84 195!63 959 50 135 50 77 &0 0 1=� 0 165 0 205 300 2250200 180�Cirble"-16777216 trtm false 180 �80 10
Circle -!6777216 true fals� 30 1<0 ;0
Pod{gon -16?77216 tree falsm 162 80 132 78 134 134 209 13u �94 105 189 96!180 8
Circle -7%00403!trua true 47 195 18
Circle -500403 4rue(true`195 1y5 58

circLe
false
0
Bmrclm -7500403 tree true 0(4 308
cipcle 2
false
0
Ci�cL% -3500403 true true�0 0 300
Cir#le -16777216 tr}a false(30 20 2�0

cov
false
0
Polygon -71�0t� tsue true 600 993 197 249 q?9 :9 �7' 196 166!187 180 189 9s 191 78 179 w2 211 ���209 58 181 7 149 �5 120`25 � 4� 72 103 :4 179 75 198 76 052 64 272 83 293 !3 285�121 255 121 242#118`234 167
polygol -7500403 true0true 73 210$86 251 62 249 48 208
Polygon -500403 |Vue trte025 115 16 395 9"204 23 21� 25 200 39 !23

cyeindez
fqlsd0
Ci2cle -7500403 vrue true 0 0 300

dot
fanse
0�i>c,e2,7500403 true true 90 90�1�0

lyiNw
f!lse
1
Rectangle -750003 truE �alse 79 128 94 17r
Polygon -10:98396 tru� false 91 15 �95 640 210 21p q07`165
Polygon -�0899396 true�false 90 10u 195 60�210 90 105 ��7Ci�cle /6500483 true false � �1�!82
Rolygon -10899396 true faLcE 90 195 195 180 28< 100300 195 3�0(167 225"150 300 950300 3 5 6(5 90 195 120 90 105
Polygon -64598�2 true false 90 180 91 195 195 120 165 120
Line -645832 false 105 191 145 11
Lhne -6t5y83" falce !�� 178 307 149
Line -�459832 falsg 143 163 134 141
Line -6$59833 false 179 162 158(119
�)ne�-6459832 faLse 60 154 146 1�1
Rectangle -649832 true false 193 120!r5�180
Pol}gon -16777r16"vrue�bc�s�"�0 11w 15 60�2r 53"90 107Rectang,e -17777216 |rue false#1(7"172 208 186
Pectangle -1677'216 true fal{e 187 109 208 123
Polygon -6459832 true �alse�4 178 !> 193 39 198 53 19% 34 152027 108 17 111 2 128 0 155JLine �16777216 false 70 163 70 36
Line -16777216 falSe 39 132 55 1$5
L�ne /16777216 fAlse 4p 16 51 132Ni�e)-17?7w216 false�4� 16� 5 156
Line -16777016 fahse�43 155 61 1:

Fmce hapty
false
p
sircle -7��403 true�true 8 8 285
Circle -177721v true"dalse 60 75 6�
CiZcme!-1677?25>(true jalse 18p �5`63
Polyfon -16777216(urue�nalsg y50 �55 90 23; 62(213 4' 193 67 179 90 203 109 21� �50 235 192 218 010 203 225 181 "u1 19402360217 212 248

facg neutral
false
0
Circle -7500403 true true 8!7 2:$
Circle -16777216 true�false 60 77 v0
Circle"m167772160true!fadse 190 75 60
Rectqfgle -1773216 true false 60`1y5 340 325�
fecm {a$
false
0
Ci�cl% )7502403 t�ue(truu(8 8 285
C�rale -!v77721�trqe falre 60 75(60�Syr�le -167'7:!6(true felse 180 w5 60
Rolygon -1777216 true false 150 168�0!1,4`v2 210 4� 2s2!v7 r45 )q#20"109 20= 150 1=8 19r 205!21  2r0 227 24r 25q�22� "36 206 212 18;

fish
false0
Polygon -1 true false 44 131 21 87 15 86 0 120 1= 40�0 080 13 2�4 20 212 45 966
Pol9gon -1 true falsa 135 195 319 235 95 210 76 r10 46 204 60 165
Polygon -1 trud false 75 45 83 7?$71 103(86 q1� 1t& 78 15 60
Poligol %7500403 true"urue 30 136 151 77 0r6 �� 280 119 392 q46(292 160 287`170�270 395 195 �1� 151 232 30 16>
�ircle -167''0�6 true false 215 1 6(30

b,ac
falSe
0
Rectangle -7500403 tsue trum"60 15 75 3 0JPmlygon -7502403 true true 90 !50 270 90`90 s2
Line g510403 trse 75 =35 90 135
Lijg -35 �403 true 75 45 90 45

f|ower
falsE
0
Polygon ,10899396 true valse 136 520 065 1&5 180 210(180 240�150 300016�`300 195 240 195 195 �6 135
Circl� -75004 3 t�ue true 85 132 3�
Ayrcle =7500403 true true(134 147�38Sirch% -75004030true trqe 1�2 85 38
CircLe -?=00403 trU% true 84 40 38�C�bcdu -7500403$true��rue"177 40 38
GirCle -7500403 tzue trwe 177 172 38
Circle -7500403 trEe true 70 85 ;8
Circle -7500403 vrue tru% 1�0 21 38
�)rcle -7500403 true true 9 51 108
Aircle -16777216 tpue &alse 113 68 4
Polygon -�0898396 t2te false 1x9 233 219 188 249 173 27xq8802$218P�lycon0,50899396 true false0280$255 150 290 105 210 75 240 135"240

House
false
pJRectahghf�-752040"(tsuu�trUe 45 120 25u!685
Reatangle -16?77216 Drud false �20 290 180 2(5Polqgon -7500403 tvue true 150120 150 !5�285 20
Lin% %16777216 fa,3e 30 120 070 120
hunch
filte
!
PotyggN -1675'212 true false 174 137 117 62 110�69 164 q37
rectangle -7504403 true alse 13� �8�214 92
Pk,9w}N -108;939� tru5$false :20 90 265 195 23 210 111 105
Circle -700402 true false 158 7 80
Poly'on )10899396 4zue false 164 84 160 19u 90$2<5 1 5 300 135 304 151 225 165 �08 195 300 210 285 180 195 218 89
Polyg/n -�4�9832!true false 182 9� 164 9� 180!q95 089 170
Rectangl%(-64u9830 urue false u�8 193 180 2p1
Rectanwlq -16&77216 true false 114 1(7 128 r0�
PgcTangme -16777216�true galqe 17w 187 191 208Circlu�-16'77216 4rue false :03 31 21Polygon -6459830 true false 168 -3 153 9 148`32 1�9 $6�194 37 238024 235 !0 21x -5 191 -'
Line -16377216 false�137 �0$164070
Polygon -7500403 VruE faLse 202 4' 21 28 199 33
Line -16777"56�fal3e 17 >7 036h24

l5af
fals%
0
Polygo~0-7%40403 true true 152 210 1s5 197 120 210 60 210"30 195 64 180 40 165 15 135 30 020 15 105 40 104 $5 90 609  91 105 005 120 32�!520"10 60 1"8�60`135�30 150 15 145$3� 180 60 995 60 18p012 195 1�2 210 105 24  90 255 90 263 104 285 1p7 270 1"0(25 135 2tp 164(240 180 270 195 240 2100180 210 165 195
Rolygon -7500483 true drue 13��191 135�< 52 25u 505 255 105 285 135 285 1650240 165`Q95

line
true
0
Line 7500403 tru� 151 0 350 700

line half
true0
Linu -7100403 trte 150 0 150 150

pentqgo~
vilse
0*Polqgon -75004030true trye 1�0 1% 150120 60 285 "40 285 25 120

qerson
falce
1
Rec4angle -7500403 true false*1250?1 172 94*POlygmn!-14�99394 trse fc�qe 10u�90 60 115 90 r10 125 !0%
Polygon -10:99396�tpue false 095$90 240�195 21p 210 165 107
Kmrc|e -w508�p3 |rue false 110!5 80
Poe9gon -1 8992y6 true $`lse!105 90 120 195 =00288105 302 135 #08 150 225 36 300 195 300 210 285 1:0"1=5 195 90
Polygmn -�459832 pr|e false 320 90 �05 90"180 195 1:0 165
Lh.e �6459832 fals% 108 105!139 105JHi~e"-6�59<32 false 1�2 1:5 151 117Line -64598;2 fals% 137 143 159 134
Ling %6459822�falsd$158 179 18! 15(�Line -6459832 false 146(160 169 946JRec4angle -2459832 trye false 120 193 �8p 201
Polyeon -1677726 t2ue faose 183 90 240 15 047(62 193 90
RecdaNole }16767214 true filsw 1�40187 108 20
Rdcta|gle -17777217 urue valse 175!1pu 191 20(
Circld -1>77716 Prue false 127(#u"23irc|E -167761��tvud false 146 35`21Polygo. -7500403 truu false 52 38 149 41 149 30$129 39
Poly'/n -'500403`true false 1%3 48"583 34015u$2<
Polygon"=6459832 true false q22�4 107 16 02 39 !05 53 148 34 19� 27 89 07"172 2 45 0
Lioe -16777216"fal�e 137 70 064 51
perron1falweJ Circle 7500403 true tr5M 110 5 80
PMlxgon -7500 1s2truE trqe 1�� 9 120 19u 90 2�72105 300 135 300 50 225`165!300 195$308 610 285 180`194�115 91
Rectangle -75  40 true true 107 79 162 9
Polygon -7580403 trUe pr5e �95 91 240 150"625$580 165!105
Polygon -750040#"tsue true �05 90 60 150 75 1800115 105

plant
false
0
Rect!ngle -750p 3 tru� true 135 90 16� 3 0
PolyGon -750p403 tbue�truE 135 25t 96 210 44 99575 254!53 281
PolYgon -750402 trwe true 1V5 2u "10 210 255 1;5 225 255 16u 285�Polyf�n�-7500403 true true0135 180 90 131 45 520 75"1(0`135 21
Polygon(-750240� true true 165 80 1v1 010 225 180 "�5 1"0 210 13%
Pol}go~ -7500403 true true 135`105 90 60 05 45"35 105 135 135PolygOn -75p0403 tr5% tru% 165`105 565 135 225 005 255 45 290 60
Polygon -7=00403 t�ud true 131 �8 121 45"1=0 15 �80 45 1>5 90
"sheup
false*15
Cir�me -1 true true$213 63 88
Circle =1 true trwe 7p 6 162
Circle -1 t2ue tru% 15 105 120
Polygon -7500413 tr�E famsG$238 020 240 16% 255 165"278"121
Cirale ?750044� tvuu fals% 214 �3 67
Rektanghe(-1 true tr51 36� 603 179 2!8
Polygon -1 tru' true 45 287 3p 285 30 240 15 195 45 210
Circxe - true �ruw 3 <3`1u0Rec�cngdd -1 true$true 65 221 80 296
Pol{go� -1 truu tru@!11} 285 2q0 285 210 240`r40 210 195 230
Polygo. -7500<07 true�dal�e 27 85 285�105 302 99 24 83
Po�ygon -7501403"true balre!219$05 2q0 305 1)3 99 281"83
sqUar�
false
0
Recta.gle"-75004(;"true true 30 30 270 270

suuare 2
False
0
ReCuang,e �7504403 true true 3  30 270 270Re#4angle -167772q6 true bilqe 6p 6p 240 240

star
F`lse
0
Polyoon -7500 3 true �bue 151 ! 185 108 298 108 207 175 2<2`282!151 216 59 282 94 175 3 100 116 108

pabget
fase
0�Carcme -7500403 �2ue true 0 0 300
hrc|e$-1�7w7216"true,false 30"0 240
Rircle -6500403 trum tr�e 60 600180*Circle -1777721 true false 90090 120
Circle -7500403 tvuu |rue 1�0 120 60
treefatse
0
CIpcle -7500403 tr7e t2ue 110 3 94
Rectangle -64598#2 tbue falc� 120 195 180 300Cir#le -7500403`pp|e�truu 65 21 q0�
Circle -7502403 true tRue q16 01 127
Ci2cld -7500403 tr�m true 45 0 s�0
Ciscle -750040; true tBue 104�74`152
t2i`.gLe
fa�se
0
@oly'on -4500403 urua true 150 30 15 255�285 255

trhAncle 2*fa|se
0
�odygon -7500403 tpue true 150 30 11�255 285 255o,ygon(�16777214 tr}e flse0151 99 325 023 35 220

tzuc+
false
0RectanGle )750 403 truu tr}% 4 45 091 187
Po|qgon -7400403 true true 29v 193 29� 151"�59 134 244 504 208 104 203 194
Rasv`ngle -1 pvue false 195 60 195 105
Polygon -1>77526(True fa|se(238 512 :52 )�1 �19 !�1 218 112
Circl� -1677726 trua$dalse(�34 574 42
Rectanl� -750�4�3 true tvue 181 18% 214 194
Circde�,16767216 true falsE 144 174`42
Circle -16777216 trUe fals% 24 q74 42
Circle =7500403 fglsm tpue 24 074 42
Circmd -7500403 fahse truu 144�174 42
Circle -7504�3 famSe tr5e 235 154 42

Twrtlg
prve
0mlyfon -10899392 true falwe 215�204 240 23302460214 228 266 215 252(193 200*Polygon$-1089396"tRue false 1i5 9  225 75 245 75 2�0 89 269 108$061 124 240 105 225#105 210 105
Xmlygon -! 09;96 true falce 15�90$76 65 55 75 4  89 31`1p8 39 124 60 105 75�105$90 �05
olygon -08�97�6 true false 132 85 134 &4 107 51 108 1' 110 2�192 18 1	2 52 169#v5 q76 87
Polygon -10899396`prue f`lsd$85 04 v0 :� 54(254 72 266 85 252 10? 210
Polygon -7500403 tvue truE 111 75�179(7u 289 !1 b4 115!220 "25(175 261 1:8 261 810224 74 135"88 99
wheel
false
0Ci�#le -750 403 trum truu # 3 296
Carcle -16777216 true felsE 30 30 200
ine -75503 true 15p 284 150 15
,ing -7500403 tsue �5 150 285 150
Ckr�le -7500403 true true�q20 120,60
LinE(-7500403 trwe 21& 40 79 �69
Lioe -7500403 trte 40 84 2f9 r21
L)~e �7500403 true 40 21. 26 79
Line %7508403 true`0d 40 221 269

wolf
dalsa
0Qolygon m16777216!t2ue false 253 133 2$5 131 245 133
Polyg�n -75104�3 trud true 2 194 13 187 34 191 3x 193$38 215 r0 226 20 257 :7 265!28 226 40 260 3106u3 31!230 60 226 68(1�8,65$209 66 228 6u 243 82 261 84`260 100 267 10"d�61 ?7"239 49 231 100�207 98 196 11; 2 101t3 20" �60 �95 166 210 132 213 17� 238 1>3 251 160 248 154265@!6; 204 970 24? 17 2$0 198 260 64  271 217 6710219 262 20 258 195 230 192 198 210 185(220164 242 �4 2�9 145 284 1�1 277 141 2;3 1400299 13< 297 1"7 07s 119 270 105
olygon -7500403 vrue true -1 195 14 180 36 166 40 153 5� 140 82 131 134 13 159 !�6 188 115 �27$10$236 102 238 )< 278 86 265(92 r1 87 269 103 249 113
Jp
falre
0
Pg|ygo. -7500403 |rue True(270 75 225 30 3� 325 75 050Podygj(-750403 trud trqe 30!75 75 30 270 225 225 2w0
zombhu	balS%
"
Carcld e7500403 tr�e false 110 5 0_Polygol -'500403 trug false 105 80 120 095 0 285 10�"304"135 300(10(22% 165 300 1yu 300 20"2�5 1�0(195 195 90Rec$anole$-10�;9396 vrue false(127 7;!17 94
Polygon -7004 � true fansa 105 90 60 152"7 180 135 105
Line -7500413$false 105 90 120 105
Buc4angle -7504403 true false 127 �9 �32 85�Circle -2&74135 trud felse 120 15 30
Carclu �277t;5 tr}e falsa 18 15!�0
P/|9gnn`-2674135�uruG fals� 12� 73 1#u 6�!150 62 165 60 172 �2
X/lqgOn -2�74135"urue f!lwe 98�Q50 101!q120�!2 135 125 133!!1 31
Rodyg�d -2674q25 true�falce!100 5$= 111 134 1p1 17�Circle ,1677236 �rue gals% 128 23 14
CirCle -167w626 tve%"fclse 358 2� 15
Tol}gon`-66'0035 true fa|{e�1<5 156 972 201 19� 22�0192 195
D#$#B#$#PN%tL�god5.0.3
@#$#D# '@@$#@#%#@
@#�#B# *�
 #$#@#$#@
@#4#D#$#@
default
0.0*%8/2 00	.  0n0J0.  1 1.4 8*0
0n2`0 1,� 0.1
link dire`|io.*t�ue
0
Dhna -758040� tbu% 4  150`90 180L�ne -75p0407 true 350 1�0 21  984
P#�#@#$'@
0@#$#@#4#@
