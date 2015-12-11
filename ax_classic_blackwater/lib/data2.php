<?php
#
#Asram: Compiled with the following query:  
#SELECT CONCAT(zoneidnumber, ' => \'',short_name,'\',') As Solution from zone order by short_name;

#Asram: Had to add 0 at the top of the array to account for when all zones in starting_items apply (the null value)
#
$startzones = array (

0 => 'n/a',
279 => 'abysmal',
154 => 'acrylia',
71 => 'airplane',
55 => 'akanon',
179 => 'akheva',
317 => 'anguish',
369 => 'arcstone',
77 => 'arena',
180 => 'arena2',
995 => 'arttest',
406 => 'ashengate',
418 => 'atiiki',
283 => 'barindu',
422 => 'barren',
151 => 'bazaar',
36 => 'befallen',
411 => 'befallenb',
16 => 'beholder',
17 => 'blackburrow',
428 => 'blacksail',
301 => 'bloodfields',
445 => 'bloodmoon',
209 => 'bothunder',
337 => 'broodlands',
423 => 'buriedsea',
87 => 'burningwood',
68 => 'butcher',
106 => 'cabeast',
82 => 'cabwest',
70 => 'cauldron',
303 => 'causeway',
48 => 'cazicthule',
304 => 'chambersa',
305 => 'chambersb',
306 => 'chambersc',
307 => 'chambersd',
308 => 'chamberse',
309 => 'chambersf',
105 => 'charasis',
103 => 'chardok',
277 => 'chardokb',
90 => 'citymist',
117 => 'cobaltscar',
200 => 'codecay',
408 => 'commonlands',
21 => 'commons',
394 => 'crescent',
58 => 'crushbone',
449 => 'cryptofshade',
121 => 'crystal',
446 => 'crystallos',
26 => 'cshome',
104 => 'dalnir',
174 => 'dawnshroud',
427 => 'deadbone',
341 => 'delvea',
342 => 'delveb',
373 => 'devastationa',
372 => 'devastion',
405 => 'direwind',
442 => 'dragonscale',
336 => 'dranik',
328 => 'dranikcatacombsa',
329 => 'dranikcatacombsb',
330 => 'dranikcatacombsc',
318 => 'dranikhollowsa',
319 => 'dranikhollowsb',
320 => 'dranikhollowsc',
331 => 'draniksewersa',
332 => 'draniksewersb',
333 => 'draniksewersc',
302 => 'draniksscar',
86 => 'dreadlands',
81 => 'droga',
225 => 'dulak',
15 => 'eastkarana',
116 => 'eastwastes',
153 => 'echo',
22 => 'ecommons',
378 => 'elddar',
379 => 'elddara',
94 => 'emeraldjungle',
24 => 'erudnext',
23 => 'erudnint',
98 => 'erudsxing',
30 => 'everfrost',
72 => 'fearplane',
47 => 'feerrott',
61 => 'felwithea',
62 => 'felwitheb',
284 => 'ferubi',
78 => 'fieldofbone',
84 => 'firiona',
385 => 'freeportacademy',
388 => 'freeportarena',
389 => 'freeportcityhall',
382 => 'freeporteast',
391 => 'freeporthall',
387 => 'freeportmilitia',
384 => 'freeportsewers',
386 => 'freeporttemple',
390 => 'freeporttheater',
383 => 'freeportwest',
10 => 'freporte',
8 => 'freportn',
9 => 'freportw',
92 => 'frontiermtns',
402 => 'frostcrypt',
111 => 'frozenshadow',
157 => 'fungusgrove',
54 => 'gfaydark',
118 => 'greatdivide',
163 => 'griegsend',
167 => 'grimling',
52 => 'grobb',
127 => 'growthplane',
447 => 'guardian',
345 => 'guildhall',
344 => 'guildlobby',
229 => 'guka',
234 => 'gukb',
66 => 'gukbottom',
239 => 'gukc',
244 => 'gukd',
249 => 'guke',
254 => 'gukf',
259 => 'gukg',
264 => 'gukh',
65 => 'guktop',
224 => 'gunthak',
440 => 'gyrospireb',
441 => 'gyrospirez',
29 => 'halas',
335 => 'harbingers',
76 => 'hateplane',
186 => 'hateplaneb',
228 => 'hatesfury',
6 => 'highkeep',
5 => 'highpass',
407 => 'highpasshold',
412 => 'highpasskeep',
444 => 'hillsofshade',
211 => 'hohonora',
220 => 'hohonorb',
39 => 'hole',
166 => 'hollowshade',
110 => 'iceclad',
400 => 'icefall',
294 => 'ikkinz',
296 => 'inktuta',
46 => 'innothule',
413 => 'innothuleb',
181 => 'jaggedpine',
424 => 'jardelshook',
113 => 'kael',
88 => 'kaesora',
60 => 'kaladima',
67 => 'kaladimb',
102 => 'karnor',
160 => 'katta',
416 => 'kattacastrum',
64 => 'kedge',
74 => 'kerraridge',
410 => 'kithforest',
20 => 'kithicor',
293 => 'kodtaz',
97 => 'kurn',
85 => 'lakeofillomen',
51 => 'lakerathe',
27 => 'lavastorm',
169 => 'letalis',
57 => 'lfaydark',
184 => 'load',
185 => 'load2',
443 => 'lopingplains',
173 => 'maiden',
429 => 'maidensgrave',
437 => 'mansion',
436 => 'mechanotus',
397 => 'mesa',
232 => 'mira',
237 => 'mirb',
242 => 'mirc',
247 => 'mird',
252 => 'mire',
257 => 'mirf',
262 => 'mirg',
267 => 'mirh',
271 => 'miri',
275 => 'mirj',
126 => 'mischiefplane',
59 => 'mistmoore',
33 => 'misty',
415 => 'mistythicket',
233 => 'mmca',
238 => 'mmcb',
243 => 'mmcc',
248 => 'mmcd',
253 => 'mmce',
258 => 'mmcf',
263 => 'mmcg',
268 => 'mmch',
272 => 'mmci',
276 => 'mmcj',
425 => 'monkeyrock',
395 => 'moors',
168 => 'mseru',
227 => 'nadox',
44 => 'najena',
280 => 'natimbi',
123 => 'necropolis',
182 => 'nedaria',
25 => 'nektulos',
40 => 'neriaka',
41 => 'neriakb',
42 => 'neriakc',
161 => 'netherbian',
152 => 'nexus',
221 => 'nightmareb',
13 => 'northkarana',
392 => 'northro',
34 => 'nro',
107 => 'nurga',
37 => 'oasis',
409 => 'oceanoftears',
49 => 'oggok',
69 => 'oot',
93 => 'overthere',
75 => 'paineel',
156 => 'paludal',
18 => 'paw',
73 => 'permafrost',
215 => 'poair',
205 => 'podisease',
218 => 'poeartha',
222 => 'poearthb',
217 => 'pofire',
206 => 'poinnovation',
201 => 'pojustice',
202 => 'poknowledge',
204 => 'ponightmare',
210 => 'postorms',
214 => 'potactics',
219 => 'potimea',
223 => 'potimeb',
207 => 'potorment',
203 => 'potranquility',
208 => 'povalor',
213 => 'powar',
216 => 'powater',
316 => 'provinggrounds',
45 => 'qcat',
12 => 'qey2hh1',
1 => 'qeynos',
2 => 'qeynos2',
4 => 'qeytoqrg',
281 => 'qinimi',
3 => 'qrg',
295 => 'qvic',
299 => 'qvicb',
374 => 'rage',
375 => 'ragea',
50 => 'rathemtn',
430 => 'redfeather',
370 => 'relic',
334 => 'riftseekers',
19 => 'rivervale',
282 => 'riwwi',
398 => 'roost',
230 => 'ruja',
235 => 'rujb',
240 => 'rujc',
245 => 'rujd',
250 => 'ruje',
255 => 'rujf',
260 => 'rujg',
265 => 'rujh',
269 => 'ruji',
273 => 'rujj',
11 => 'runnyeye',
175 => 'scarlet',
89 => 'sebilis',
165 => 'shadeweaver',
150 => 'shadowhaven',
187 => 'shadowrest',
155 => 'sharvahl',
435 => 'shipmvm',
431 => 'shipmvp',
432 => 'shipmvu',
433 => 'shippvu',
434 => 'shipuvu',
439 => 'shipworkshop',
420 => 'silyssar',
125 => 'sirens',
91 => 'skyfire',
371 => 'skylance',
114 => 'skyshrine',
128 => 'sleeper',
288 => 'sncrematory',
286 => 'snlair',
287 => 'snplant',
285 => 'snpool',
31 => 'soldunga',
32 => 'soldungb',
278 => 'soldungc',
212 => 'solrotower',
80 => 'soltemple',
421 => 'solteris',
14 => 'southkarana',
393 => 'southro',
35 => 'sro',
159 => 'sseru',
162 => 'ssratemple',
438 => 'steamfactory',
56 => 'steamfont',
448 => 'steamfontmts',
399 => 'steppes',
338 => 'stillmoona',
339 => 'stillmoonb',
100 => 'stonebrunt',
396 => 'stonehive',
426 => 'suncrest',
403 => 'sunderock',
83 => 'swampofnohope',
298 => 'tacvi',
231 => 'taka',
236 => 'takb',
241 => 'takc',
246 => 'takd',
251 => 'take',
256 => 'takf',
261 => 'takg',
266 => 'takh',
270 => 'taki',
376 => 'takishruins',
377 => 'takishruinsa',
274 => 'takj',
124 => 'templeveeshan',
172 => 'tenebrous',
417 => 'thalassius',
380 => 'theater',
381 => 'theatera',
164 => 'thedeep',
171 => 'thegrey',
1645 => 'thenest',
1632 => 'thundercrest',
115 => 'thurgadina',
129 => 'thurgadinb',
96 => 'timorous',
289 => 'tipt',
226 => 'torgiran',
38 => 'tox',
414 => 'toxxulia',
95 => 'trakanon',
183 => 'tutorial',
188 => 'tutoriala',
189 => 'tutorialb',
170 => 'twilight',
297 => 'txevu',
176 => 'umbral',
63 => 'unrest',
292 => 'uqua',
401 => 'valdeholm',
108 => 'veeshan',
109 => 'veksar',
112 => 'velketor',
404 => 'vergalid',
158 => 'vexthal',
290 => 'vxed',
119 => 'wakening',
300 => 'wallofslaughter',
101 => 'warrens',
79 => 'warslikswood',
120 => 'westwastes',
291 => 'yxtta',
419 => 'zhisza'
);
?>