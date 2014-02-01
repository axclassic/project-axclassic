######################################
## NPC: Hager-Sureshot              ##
## Zone: Surefall Glade (qrg)       ##
## Ranger Guildmaster note turnin   ##
## Revised by caved for AXClassic   ##
## EQWorld Server     18-12-2010    ##
######################################
sub EVENT_SAY {
my $abide = quest::saylink("abide", 1);
my $mammoth = quest::saylink("Mammoth", 1);
my $tunare = quest::saylink("Tunare", 1);
my $talym = quest::saylink("Talym", 1);
my $bounty = quest::saylink("bounty", 1);
  if ($text=~/hail/i) {
    $client->Message(14,"Greetings, $name. Feel free to rest here in Surefall Glade. Just be sure you do no hunting whilst here. If so, then you shall pay the punishment of death. I trust you will $abide by the laws ?");
  }
  if ($text =~/abide/i ) {
    $client->Message(14,"That is wise. Your health, for now, is assured. A plague of hunters has infested our land heavily in recent weeks. The word is out that $mammoth still lives. Hunters have flocked here in search of a trophy or profit and glory. Instead, they find the deadly accuracy of my arrows.");
  }
  if ($text =~/mammoth/i) {
    $client->Message(14,"Mammoth is the great bear of the caves. $tunare has blessed our home with Mammoth's presence. It is said that when the great bear dies, so too shall the Jaggedpine. He would be quite a trophy to some hunter. And quite profitable to a poacher. Even the infamous $talym Shoontar has tried his hand at the hunt.");
  }
  if ($text =~/tunare/i) {
    $client->Message(14,"Tunare is the Mother of All. It is through Her will that we protect this land and its many creatures.");
  }
  if ($text =~/talym/i) {
    $client->Message(14,"Talym Shoontar is a poacher. He has eluded us for quite some time. He has organized parties of poachers to plague our forest as well as others. He hails from Halas, but I have heard he now calls the Plains of Karana home. I have placed a bounty upon his head. Do you wish to collect the $bounty ?");
  }
  if ($text =~/bounty/i ) {
    $client->Message(14,"That's the spirit!! Spoken like a true Protector of the Pine! Last I heard, Talym Shoontar was hunting in the Plains of Karana. He has also been spotted running to and from Qeynos. No doubt he is selling hides to some merchant. End his life of hunting. Bring me his head to collect the bounty .");
  }
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18709 => 1)) {
    $client->Message(14,"Welcome, we are the Protectors of the Pine. Wear this tunic of our guild, and help us defend our great and beautiful woods. Go to Errin Pinewhisper, he will help train you and teach you the power of the woods.");
    quest::summonitem(13509);
    quest::ding(); quest::exp(100);
    quest::faction(265,10); # Protectors of Pine
    quest::faction(159,10); # Jaggedpine Treefolk
    quest::faction(279,-30); # Sabertooths of Blackburrow
    quest::faction(135,10); # Guards of Qeynos
  }
  elsif (plugin::check_handin(\%itemcount,13913=>1)) {
    $client->Message(14,"His days of hunting are over. In the name of the Protectors of the Pine, I offer you this reward. If you are unable to make use of it, you may sell it. I suggest you hold onto it. If you are a ranger it will come in handy.");
    quest::summonitem(17804);
    quest::givecash(0,11,8,4);
    quest::ding(); quest::exp(1000);
    quest::faction(265,10); # Protectors of Pine
    quest::faction(159,10); # Jaggedpine Treefolk
    quest::faction(279,-30); # Sabertooths of Blackurrow
    quest::faction(135,10); # Guards of Qeynos
  }
   else {
    $client->Message(14,"$name, I don't need this. Take it back."); #return bogus items
    plugin::return_items(\%itemcount);
    plugin::try_tome_handins(\%itemcount, $class, 'Ranger');
    return 1;
  }
}