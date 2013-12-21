#######################
## Revised by Aardil ##
##    12-20-2013     ##
## Added Hot links   ##
## Made bot enabled  ##
## Dialogue Changes  ##
##  For Ax Classic   ##
#######################
sub EVENT_SAY {
my $familiar = quest::saylink("familiar", 1);
my $intelligence = quest::saylink("intelligence", 1);
my $alone = quest::saylink("alone", 1);
my $interest = quest::saylink("interest", 1);
my $Ranger = quest::saylink("Ranger", 1);
my $Paladin = quest::saylink("Paladin", 1);
my $Shadowknight = quest::saylink("Shadowknight", 1);
my $Beastlord = quest::saylink("Beastlord", 1);
my $Bard = quest::saylink("Bard", 1);
my $Wizard = quest::saylink("Wizard", 1);
my $Magician = quest::saylink("Magician", 1);
my $Necromancer = quest::saylink("Necromancer", 1);
my $Enchanter = quest::saylink("Enchanter", 1);
my $Cleric = quest::saylink("Cleric", 1);
my $Shaman = quest::saylink("Shaman", 1);
my $Druid = quest::saylink("Druid", 1);
my $Warrior = quest::saylink("Warrior", 1);
my $Rogue = quest::saylink("Rogue", 1);
my $Monk = quest::saylink("Monk", 1);
 if($text=~/Hail/i) {
   quest::say("Hello, my name is Seana Marsinger. I am here representing my loyalty to the League of Antonican Bards. It matters not to me whether you support the League or loathe it; propaganda is not my objective. Everyone must find their own truths in this life path. So says Quellious. To business then, are you $familiar with the Plane of Hate?");
 }
 if($text=~/familiar/i) {
   quest::say("Good, I need someone that has a bit of an eye for how things should look up there. My brother and I have been studying Innoruuk and his intricate dealings for years. Being raised in New Tanaan may lend us certain neutrality towards all people, yet the values our parents have instilled in us do not allow us to let him go unwatched. In fact, I have begun to believe that my paranoia may prove useful not only to the League, but to the Citizens of Tranquility and New Tanaan itself as well. We have received a simple piece of $intelligence that may conceivably upset the entire balance of the Pantheon and have most dire repercussions here in Norrath.");
 }
 if($text=~/intelligence/i) {
   quest::say("An old friend of our father's in Qeynos, Jusean Evanesque, has been very busy sorting out the information that is coming to him in droves. The first clue came from Kardin Nillic in Gunthak, and then in bits and pieces from many travelers moving through Qeynos. Piracy on the seas has grown, and somehow the Broken Skull Clan has gained power that should have been out of their grasp. Our informants there say that it can only come from Innoruuk. I am afraid that the Plane itself has shifted with this power. I do not believe that we will be able to uncover all that we need $alone in time to warn people of the dangers.");
 }
 if($text=~/alone/i) {
   quest::say("Our parents are back in Qeynos assisting Jusean with all that needs to be verified and ensuring that the League's network contacts are all still viable. They will need to stay there in case we must get the word out quickly. I do not believe that any of the residents of Tanaan would approve of our little quest, and would view it as biased. Thus we are here alone. Does this type of project $interest you?");
 }
 if($text=~/interest/i) {
   quest::say("Do you want to collect the reward for a $Ranger, $Paladin, $Shadowknight, $Beastlord, $Bard, $Wizard, $Magician, $Necromancer or $Enchanter, $Cleric, $Shaman, $Druid, $Warrior, $Rogue or $Monk?");
   }
 if(($text=~/Ranger/i)||($text=~/Paladin/i)||($text=~/Shadowknight/i)||($text=~/Beastlord/i)||($text=~/Bard/i)||($text=~/Wizard/i)||($text=~/Magician/i)||($text=~/Necromancer/i)||($text=~/Enchanter/i)) {
   quest::say("Please speak to my brother, Stefan, for further information. He will be your primary contact for any tasks you perform for us in Innoruuk's realm. The League of Antonican Bards and I commend you for your efforts.");
 }
   if(($text=~/Warrior/i)||($text=~/Rogue/i)||($text=~/Monk/i)) {
   quest::say("I believe it is safest if you study those who have similar interests as yourself. Travel to the Plane of Hate and observe the ghasts, scorn banshees, and haunted chests. They seem to share some qualities of your art and lie in the least dangerous areas. My interaction with these creatures has been mostly at a distance, and I am not as familiar with them as I would like. If you survive long enough to uncover some sort of minor signet that verifies you have been studying these creatures, and truly wish to aid with this cause, bring it to me along with some abhorrent powder and a jacinth. I can craft you protective item and may have some further work for you to do.");
 }
   if($text=~/work/i) {
     quest::say("Wonderful. Return to the plane and continue your studies of the tactical demons. With the new information you have brought I believe we have a good framework of reference for the lower rankings of these beings, however there is a higher echelon of power that I will need to be familiar with. Seek out the Teir`Dal champions and warlords of hate, as well as the agents and assassins. All of these creatures should be within your area of study, but take care! Make sure to keep your protection with you at all times. Some of them should have a Etched Soldier's Crest symbolizing their rank; bring me this crest and some Kiraikuei flesh, along with your Gem of War. If you succeed in this task you are more valuable than I could have imagined, and I may need your skill with the next level of reconnaissance.");
 }
   if($text=~/another/i) {
     quest::say("In my personal studies I have heard rumor that there is an archaic tome that contains some of Innoruuk's darkest secrets. I cannot ask you to uncover this tome, I am not even certain that it exist. The fabled tome is the Dissertation of Dark War. If it does indeed exist and you manage to find it, you are far grander than I. The tome that I do seek will most likely lie in the hands of one of Innoruuk's own assassins or guards, and they seldom seem to cease training. It is possible the Prince of Hate himself holds the tome close. Find me the Dissertation of Dark War; return it to me with your Gem of Contention and your work will help us greatly.");
 }
 if($text=~/help/i) {
     quest::say("As my personal studies continue, I have heard rumor that there are three more archaic tomes that contain some of Innoruuk's darkest secrets. I cannot ask you to uncover all three, I am not even certain that they exist. The fabled writings are the Texts on Pain, Writ of Agony, and Tactical Hatred. If they do indeed exist and you manage to find them, you are far grander than I. It is possible the Prince of Hate himself holds the tomes close. Find me the Texts on Pain, Writ of Agony, and Tactical Hatred, return them to me with your Gem of Victory and your work is finished");
 }
 if(($text=~/Cleric/i)||($text=~/Shaman/i)||($text=~/Druid/i)) {
     quest::say("I believe it is safest if you study those who have similar interests as yourself. Travel to the Plane of Hate and observe those that call themselves clerics of hate and spite golems. My interaction with these creatures has been mostly at a distance, and I am not as familiar with them as I would like. If you survive long enough to uncover a minor signet that shows you have indeed studied the priests, and truly wish to aid with this cause, bring it to me along with some vampire dust and a diamond. I can craft you protective item and may have some further work for you to do.");
 } 
 if($text=~/more/i) {
     quest::say("Wonderful. Return to the plane and continue your studies of the priestly demons. With the new information you have brought I believe we have a good framework of reference for the lower rankings of these beings, however there is another echelon of power that I will need to be familiar with. Seek out the vengeance golems, and the higher priests of hate, the vicars, templars, and high priests. Make sure to keep your protection with you at all times. Some of the priests should have a Etched Priest's Crest symbolizing their rank; bring me this crest and some Vengeance Dust from the golems, along with your Gem of Faith. If you succeed in this task you are more valuable than I could have imagined, and I may need your skill with the next level of reconnaissance errand.");
 }
   if($text=~/task/i) {
     quest::say("In my personal studies I have heard rumor that there is a archaic tome that contain some of Innoruuk's darkest secrets. I cannot ask you to uncover this tome, I am not even certain that it exists. The fabled writing is the Tome of Dark Healing. If it does indeed exist and you manage to find it, you are far grander than I. The tome that I do seek will most likely lie in the hands of one of Innoruuk's own priests, and they seldom seem to leave their studies. It is possible the Prince of Hate himself holds the tome close. Find me the Tome of Dark Healing; return it to me with your Gem of Piety and your work will help us greatly.");
   }
   if($text=~/able/i) {
     quest::say("as my personal studies continue, I have heard rumor that there are three more archaic tomes that contain some of Innoruuk's darkest secrets. I cannot ask you to uncover all three, I am not even certain that they exist. The fabled writings are the Teachings of Innoruuk, Book of the Dead, and Applications of Suffering. If they do indeed exist and you manage to find them, you are far grander than I. The tome that I do seek will most likely lie in the hands of one of Innoruuk's own priests, and they seldom seem to leave their studies. It is possible the Prince of Hate himself holds the tomes close. Find me the Teachings of Innoruuk, Book of the Dead, and Applications of Suffering return them to me with your Gem of Transcendence and your work is finished.");
   }
}

  sub EVENT_ITEM {
my $work = quest::saylink("work", 1);
my $another = quest::saylink("another", 1);
my $help = quest::saylink("help", 1);
my $more = quest::saylink("more", 1);
my $task = quest::saylink("task", 1);
my $able = quest::saylink("able", 1);
  if (plugin::check_handin(\%itemcount, 54062 => 1, 10053 => 1, 54048 => 1)) { #melee 1
    quest::summonitem(54033); #gem of war
	quest::emote('inspects the items closely before transforming them into a small glimmering jewel.');
    quest::say("That should help a bit. My studies are coming along rather well, although it is still far too early to decipher what is going on for certain. Do you wish to venture further into the plane and do some more $work for me?"); #need real text
     quest::ding(); quest::exp(60000);
  }
  if (plugin::check_handin(\%itemcount, 54050 => 1, 54049 => 1, 54033 => 1)) { #melee 2
    quest::summonitem(54034); #gem of contention
    quest::say("Splendid work! I must get to this at once. Should you venture to the Plane of Hatred again, I have a $another task that needs to be completed."); #need real text
     quest::ding(); quest::exp(60000);
  }
  if (plugin::check_handin(\%itemcount, 54051 => 1, 54034 => 1)) { #melee 3
    quest::summonitem(54035); #gem of victory
    quest::emote("grasps the book most carefully, while the cover seems so shift and move of its own will. Thank you very much for your continued assistance.");
    quest::say("What a truly beautiful book, even as it pulls at you as though it could inspire evil in all.");
	quest::emote('Stefan turns and places the book carefully in a box covered in protective symbols.');
	quest::say("I have much work to do informing the League and our city of our latest developments. All though there is one more bit of information that you might be able to $help me with.");
	quest::ding(); quest::exp(60000);
	 }
  if (plugin::check_handin(\%itemcount, 54035 => 1, 54058 => 1, 54060 => 1, 54056 => 1)) { #melee 4
    quest::summonitem(54039);
     quest::ding(); quest::exp(60000);
  }
  if (plugin::check_handin(\%itemcount, 54040 => 1, 16537 => 1, 10037 => 1)) { #priest 1
    quest::summonitem(54027); #gem of faith
    quest::say("That should help a bit. My studies are coming along rather well, although it is still far too early to decipher what is going on for certain. Do you wish to venture further into the plane and do some $more work for me?");
     quest::ding(); quest::exp(60000);
  }
  if (plugin::check_handin(\%itemcount, 54042 => 1, 54041 => 1, 54027 => 1)) { #priest 2
    quest::summonitem(54028); #gem of piety
    quest::say("Splendid work! Should you venture to the Plane of Hatred again, I have a another $task that needs to be completed."); #need real text
     quest::ding(); quest::exp(60000);
  }
  if (plugin::check_handin(\%itemcount, 54043 => 1, 54028 => 1)) { #priest 3
    quest::summonitem(54029); #gem of transcendence
    quest::emote("grasps the book most carefully, while the cover seems so shift and move of its own will. Thank you very much for your continued assistance."); # need real text
    quest::say("What a truly beautiful book, even as it pulls at you as though it could inspire evil in all.");
	quest::emote('Stefan turns and places the book carefully in a box covered in protective symbols.');
	quest::say("I have much work to do informing the League and our city of our latest developments. All though there is one more bit of information that you might be $able to help me with.");
	quest::ding(); quest::exp(60000);
  }
    if (plugin::check_handin(\%itemcount, 54029 => 1, 54059 => 1, 54061 => 1, 54057 => 1)) { #priest 4
    quest::summonitem(54039);
     quest::ding(); quest::exp(60000);
  }
}
 