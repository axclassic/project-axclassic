sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail. faithful one. I am Blaize the Radiant. Brother Gavel and I are well known among clerics for our forging skills. but special payment is required for our services. Special [ingots and icons] given to our members have been lost. and we will reward whoever retrieves them for us.");
}
if($text=~/what ingots and icons/i){
quest::say("The ingots and icons are all named after the virtues of the cleric who held them. The virtues I require are those of the [reliant]. the [ardent]. the [fervent] and the [penitent].");
}
if($text=~/what reliant/i){
quest::say("Turgan the Reliant lived in a cabin in the Kithicor woods until there was a great fire. Searching the burned cabins there may turn something up. He always loved Lake Rathetear as well. Bring me the Ingot of the Reliant. the Icon of the Reliant. and 1 enchanted platinum bar and I will forge them into a reward for you.");
}
if($text=~/what ardent/i){
quest::say("Theo the Ardent was in constant conflict with a gnome necromancer in Befallen named Babbinsbort. but he never could defeat him. Poor Theo drowned on an expedition to Everfrost when the ice of the frozen river gave way beneath him. Bring me the Ingot of the Ardent. the Icon of the Ardent. and 1 galvanized platinum bar and I will forge them into a reward for you.");
}
if($text=~/what fervent/i){
quest::say("Jovan the Fervent was always prone to vice. He lost his ingot in a game of King's Court with an aviak named Gull in the Ocean of Tears. After that he became a drunkard and it has been said he lurks around the bars in Highpass Hold. Bring me the Ingot of the Fervent. the Icon of the Fervent. and 1 vulcanized platinum bar and I will forge them into a reward for you.");
}
if($text=~/what penitent/i){
quest::say("Astrid the Penitent often visited the frogloks of Upper Guk. She once told me her ingot was hidden underwater there. I found that strange because she couldn't swim. She was also a good friend to the Kerrans of Kerra Ridge. where she lost her life fighting against the Erudite heretic Maugarim. Bring me the Ingot of the Penitent. the Icon of the Penitent. and 1 magnetized platinum bar and I will forge them into a reward for you."); }
}
#END of FILE Zone:soltemple  ID:310 -- Blaize_the_Radiant 

