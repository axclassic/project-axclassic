######################################
## NPC: Gerael_Woodone              ##
## Zone: Surefall Glade (qrg        ##
## Quest: Nitrates and the Assassin ##
## Revised by caved for AXClassic   ##
## EQWorld Server     15-12-2010    ##
######################################
sub EVENT_SAY {
my $deliver = quest::saylink("deliver", 1);
my $jale = quest::saylink("Jayle", 1);
my $unkempt = quest::saylink("unkempt", 1);

   if ($text=~/Hail/i){
       $client->Message(14,"It is good to meet you, $name. You, my friend, are an adventurer. The rugged look of you testifies to that. Let me know if you plan to adventure in the Plains of Karana. I have need of a person such as yourself to $deliver a flask. Do you want to hear the story of $jale Phlintoes?");
   }
   if ($text=~/deliver/i){
       $client->Message(14,"That is splendid! I thought I would have to take the long journey to the western Plains of Karana myself. Here you are, my friend. Take this flask of nitrates to a woman named Linaya Sowlin. It will help her crops grow stronger. You will find her farm alongside the road to Highpass Hold. She should pay you well for the delivery. Farewell...");
       quest::summonitem("13945","1"); 
   }
   if ($text=~/jale /i) {
       $client->Message(14,"Jale Phlintoes was trained in the ways of the Jaggedpine Treefolk since his birth. He was only eight when his parents were killed by poachers. Young Jale would have had his throat slit also if he were not off fishing at the lake. Unfortunate. The now orphaned Jale was brought up by us druids. After many conflicts with our council, he ran off to start his own sect known as the $unkempt druids, somewhere in the nearby lands. For his terrorist activities his head now brings a high price.");
   }
   if ($text=~/unkempt/i) {
       $client->Message(14,"The Unkempt Druids are a radical splinter group of druids. Their beliefs have been contorted by the mad druid Jale Phlintoes. It is he who engineers and coordinates the druids' transgressions. From setting lumbermills aflame to murdering any man who dares to wear a bearhide. They must be stopped!! Citizens must learn to understand Tunare's will, not fear it!");
   }

}
sub EVENT_ITEM {
   if (plugin::check_handin(\%itemcount,18911=>1)) {
      $client->Message(14,"Oh my!! Our Qeynos Ambassador, Gash, is in danger. Please take the note over to Captain Tillin of the Qeynos Guard then find Gash and inform him that they are trying to kill him. Go!!");
      quest::faction(265,10);
      quest::faction(159,10);
      quest::faction(267,10);
      quest::faction(347,-30);
      quest::faction(135,10);
      quest::givecash(int(rand(10)),int(rand(10)),int(rand(10)),int(rand(10)));
      quest::summonitem(18912);
   }
   elsif (plugin::check_handin(\%itemcount,12141=>1)) {
      $client->Message(14,"So the Unkempt Druids are alive and well. We shall keep a watchful eye out as should you. Take this for your bravery and defense of the Jaggedpine.");
      quest::faction(265,10);
      quest::faction(159,10);
      quest::faction(267,10);
      quest::faction(347,-30);
      quest::faction(135,10);
      quest::givecash(int(rand(10)),int(rand(10)),int(rand(10)),int(rand(10)));
  }
  else {
    $client->Message(14,"$name, I don't need this. Take it back."); #return bogus items
    plugin::return_items(\%itemcount);
    return 1;
  }
}


