#######################
## Revised by Aardil ##
##    12-20-2013     ##
## Added Hot links   ##
## Made bot enabled  ##
## Dialogue Changes  ##
##  For Ax Classic   ##
#######################
sub EVENT_SAY {
my $interested = quest::saylink("interested", 1);
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
  if($text =~ /Hail/i) {
   quest::say("Salutations, my name is Stefan Marsinger. My sister Seana and I are here on a mission for the League of Antonican Bards. Are you $interested in assisting us in our task?");
 }
  if($text=~/interested/i) {
    quest::say("Do you want to collect the reward for a $Ranger, $Paladin, $Shadowknight, $Beastlord, $Bard, $Wizard, $Magician, $Necromancer, $Enchanter, $Cleric, $Shaman, $Druid, $Warrior, $Rogue or $Monk?");
 }
  if(($text=~/Ranger/i)||($text=~/Paladin/i)||($text=~/Shadowknight/i)||($text=~/Beastlord/i)||($text=~/Bard/i)) {
    quest::say("I believe it is safest if you study those who have similar interests as yourself. Travel to the Plane of Hate and observe the ghasts, scorn banshees, and haunted chests. They seem to share some qualities of your art and lie in the least dangerous areas. My interaction with these creatures has been mostly at a distance, and I am not as familiar with them as I would like. If you survive long enough to uncover some sort of minor signet that verifies you have been studying these creatures, and truly wish to aid with this cause, bring it to me along with some abhorrent powder and a jacinth. I can craft you protective item and may have some further work for you to do.");
 }
  if(($text=~/Wizard/i)||($text=~/Magician/i)||($text=~/Necromancer/i)||($text=~/Enchanter/i)) {
    quest::say("I believe it is safest if you study those who have similar interests as yourself. Travel to the Plane of Hate and observe the revenant, the ashenbone drake, and the loathing lich. They seem to be the main practitioners of your art in the least dangerous area. My interaction with these creatures has been mostly at a distance, and I am not as familiar with them as I would like. If you survive long enough to uncover some type of signet that proves you have been studying these creatures, and truly wish to aid with this cause, bring it to me along with some vampire dust and a diamond. I can craft you a protective item and may have some further work for you to do.");
 }
  if(($text=~/Cleric/i)||($text=~/Shaman/i)||($text=~/Druid/i)||($text=~/Warrior/i)||($text=~/Rogue/i)||($text=~/Monk/i)) {
    quest::say("Please speak to my sister, Seana, for further information. She will be your primary contact for any tasks you perform for us in Innoruuk's realm. The League of Antonican Bards and I commend you for your efforts.");
 }
 if ($text=~/work/i) {
    quest::say("Wonderful. Return to the plane and continue your studies of the demons of magic. With the new information you have brought I believe we have a good framework of reference for the lower rankings of these beings, however there is another echelon of power that I will need to be familiar with. Seek out the minions of magic that seem to take Dark Elven form. These would be the sages, warlocks, and sorcerers. All of these creatures should be within your area of study, but take care! You may even find some that follow your particular discipline if that makes you more comfortable. Make sure to keep your protection with you at all times. Some of them should have a kind of Etched Sorcerer's Crest symbolizing their rank; bring me this crest and some Hatebone Drake bones, along with your Gem of Sorcery. If you succeed in this task you are more valuable than I could have imagined, and I may need your skill with the next level of reconnaissance.");
 }
 if ($text=~/another/i) {
    quest::say("In my personal studies I have heard rumor that there is an archaic tome that contain some of Innoruuk's darkest secrets. I cannot ask you to find this tome, I am not even certain that it exists. The Concordance of Black Magic is the fabled tome. If it does indeed exist and you manage to find it, you are far grander than I. The tome that I do seek will most likely lie in the hands of one of Innoruuk's own advisors, and they seldom seem to leave their studies. It is possible the Prince of Hate himself holds the tome close. Find me the Concordance of Black Magic; return it to me with your Gem of Enchantment and your work will help us greatly.");
 }
  if ($text=~/help/i) {
    quest::say("As I have continued my studies I have heard rumor that there are three more archaic tomes that contain some of Innoruuk's darkest secrets. I cannot ask you to uncover these last three, I am not even certain that they exist. The Teachings of Innoruuk, Book of the Dead, and Applications of Suffering are the fabled tomes. If they do indeed exist and you manage to find them, you are far grander than I. The tomes that I do seek will most likely lie in the hands of one of Innoruuk's own advisors, and they seldom seem to leave their studies. It is possible the Prince of Hate himself holds the tomes close. Find me the Book of the Dead, Applications of Suffering, Teaching of Innoruuk along with your Gem of Enchantment, return them to me and your work is finished.");
 }
  if ($text=~/more/i) {
    quest::say("Wonderful. Return to the plane and continue your studies of the hybrid demons. With the new information you have brought I believe we have a good framework of reference for the lower rankings of these beings, however there is a higher echelon of power that I will need to be familiar with. Seek out the Teir`Dal knights and grave lords of hate. All of these creatures should be within your area of study, but take care! Make sure to keep your protection with you at all times. Some of them should have a kind of Etched Knight's Crest symbolizing their rank; bring me this crest and some Ghast Fingerbones, along with your Gem of Courage. If you succeed in this task you are more valuable than I could have imagined, and I may need your skill with next level of reconnaissance.");
 }
 if ($text=~/task/i) {
    quest::say("In my personal studies I have heard rumor that there is an archaic tome that contain some of Innoruuk's darkest secrets. I cannot ask you to find this tome, I am not even certain that it exists. The Compendium of Classic Torture. If it does indeed exist and you manage to find it, you are far grander than I. The tome that I do seek will most likely lie in the hands of one of Innoruuk's own confidantes, and they seldom seem to show their faces. It is possible the Prince of Hate himself holds the tomes close. Find me the Compendium of Classic Torture; return it to me with your Gem of Daring and your work will help us greatly.");
 } 
  if ($text=~/able/i) {
    quest::say("As I have continued my studies I have heard rumor that there are three more archaic tomes that contain some of Innoruuk's darkest secrets. I cannot ask you to uncover these last three, I am not even certain that they exist. The fabled tomes are the Texts on Pain, Writ of Agony, and Tactical Hatred. If they do indeed exist and you manage to find them, you are far grander than I. The tomes that I do seek will most likely lie in the hands of one of Innoruuk's own confidantes, and they seldom seem to show their faces. It is possible the Prince of Hate himself holds the tomes close. Find me the Texts on Pain, Writ of Agony, and Tactical Hatred; return it to me with your Gem of Heroism and your work is finished.");
 }
}

  sub EVENT_ITEM {
my $work = quest::saylink("work", 1);
my $another = quest::saylink("another", 1);
my $help = quest::saylink("help", 1);
my $more = quest::saylink("more", 1);
my $task = quest::saylink("task", 1);
my $able = quest::saylink("able", 1);
  if (plugin::check_handin(\%itemcount, 10037 => 1, 54044 => 1, 16537 => 1)) { #caster 1
    quest::summonitem(54036); #gem of sorcery
    quest::emote('inspects the items closely before transforming them into a small glimmering jewel.');
	quest::say("That should help a bit. My studies are coming along rather well, although it is still far too early to decipher what is going on for certain. Do you wish to venture further into the plane and do some more $work for me?");
    quest::ding(); quest::exp(60000);
  }
  if (plugin::check_handin(\%itemcount, 54036 => 1, 54045 => 1, 54046 => 1)) { #caster 2
    quest::summonitem(54037); #gem of enchantment
    quest::say("Very interesting, I must get to this at once. I am sure the bones will prove most valuable in learning of the drakes as well. Take this with you once more; the protective properties are even more powerful now. Are you up $another task?");
    quest::ding(); quest::exp(60000);
  }
  if (plugin::check_handin(\%itemcount, 54037 => 1, 54047 => 1)) { #caster 3
    quest::summonitem(54038); #gem of conquest
    quest::emote("grasps the book most carefully, while the cover seems so shift and move of its own will. Thank you very much for your continued assistance.");
    quest::say("What a truly beautiful book, even as it pulls at you as though it could inspire evil in all.");
	quest::emote('Seana turns and places the book carefully in a box covered in protective symbols.');
	quest::say("I have much work to do informing the League and our city of our latest developments. All though there is one more bit of information that you might be able to $help me with.");
	quest::ding(); quest::exp(60000);
  }
  if (plugin::check_handin(\%itemcount, 54038 => 1, 54059 => 1, 54057 => 1, 54061 => 1)) { #caster 4
    quest::summonitem(54039); #glimmering gem
    quest::ding(); quest::exp(60000);
	quest::say("Thank you very much for all of your assistance. Please rest, I must inform the League and our city of these developments.");
   }  
  if (plugin::check_handin(\%itemcount, 10053 => 1, 54052 => 1, 54062 => 1)) { #hybrid 1
    quest::summonitem(54030); #gem of courage
    quest::emote("inspects the items closely before transforming them into a small glimmering jewel. 'That should help a bit. My studies are coming along rather well, although it is still far too early to decipher what is going on for certain. Do you wish to venture further into the plane and do some $more work for me?");
    quest::ding(); quest::exp(60000);
  }
  if (plugin::check_handin(\%itemcount, 54030 => 1, 54053 => 1, 54054 => 1)) { #hybrid 2
    quest::summonitem(54031); #gem of daring
    quest::say("Very interesting, I must get to this at once. I am sure the bones will prove most valuable in learning of the drakes as well. Take this with you once more; the protective properties are even more powerful now. Are you up to a another $task?");
    quest::ding(); quest::exp(60000);
  }
  if (plugin::check_handin(\%itemcount, 54031 => 1, 54055 => 1)) { #hybrid 3
    quest::summonitem(54032); #gem of heroism
    quest::emote("grasps the book most carefully, while the cover seems so shift and move of its own will. Thank you very much for your continued assistance.");
    quest::say("What a truly beautiful book, even as it pulls at you as though it could inspire evil in all.");
	quest::emote('Seana turns and places the book carefully in a box covered in protective symbols.');
	quest::say("I have much work to do informing the League and our city of our latest developments. All though there is one more bit of information that you might be $able to help me with.");
	quest::ding(); quest::exp(60000);  
  }
  if (plugin::check_handin(\%itemcount, 54058 => 1, 54060 => 1, 54056 => 1, 54032 => 1)) { #hybrid 4
    quest::summonitem(54039); #glimmering gem
    quest::ding(); quest::exp(60000);
	quest::say("Thank you very much for all of your assistance. Please rest, I must inform the League and our city of these developments.");
  }
}