sub EVENT_SAY {
my $learn = quest::saylink("learn", 1);
my $curse = quest::saylink("curse", 1);
my $shades = quest::saylink("shades", 1);
my $release = quest::saylink("release", 1);
my $darkened = quest::saylink("darkened", 1);
  if ($text=~/hail/i) {
    quest::say("Welcome, friend. Come dance by our warm fire or have a seat and $learn a little bit about the ways of the spiritist.");
  }
  if ($text=~/learn/i) {
    quest::say("We are those in tune with the spirits that surround us. Ancestral spirits with knowledge of the ancients dance around us by this very fire. They guide is through the darkness. Protect us from pain. But a terrible $curse has befallen the spirits of this thicket, and so it is my duty to train these young Dar Khura in order to aid in the battle that lies ahead.");
  }
  if ($text=~/curse/i) {
    quest::say("The spirits are corrupted by foul magic. The souls of our ancestors have been twisted into an abomination known as $shades. The corpses of long passed friends and relatives walk through the night seeking to destroy the living. We must destroy the corrupted remains of their old bodies and allow the spirits to roam free once more. Will you help us [release the souls] of our kindred spirits?");
  }
  if ($text=~/shades/i) {
    quest::say("The shades are a deeper form of corruption of the spirit. I can sense great anguish in the spirits that have been twisted into such a creation. Their horror burns my heart so deeply that I cannot bear it. I would not normally ask another to place themselves in danger, but it is important that the souls are released from these shadowed prisons of torture and darkness. Please help us $release the souls of our ancestral spirits.");
  }
  if ($text=~/release/i) {
    quest::say("I am relieved that you have accepted this dangerous task. I can feel the strength of the spirit within you. There are many kindred spirits aiding us in this battle. If you are in tune with the spiritual realm, you will find that your rituals of magic will result in aid from our spiritual allies. Return to me with the $darkened jawbones of the lesser shades so that I may release the spirit once more.");
  }
  if ($text=~/darkened/i) {
    quest::say("The jawbones will aid me in tuning to the essence of the corrupted spirits. When you return to me with them, you are enabling me to place the lost soul to rest. I am able to release four of these spirits at one time in much the same way I am training these four young trainees. It is best to bring me four of them at one time if you are able.");
    quest::say("Always pay attention to your surroundings. There are many opponents that will ambush you while you are out in the field. It is wise to take companions with you when venturing far.");
    quest::say"I am in need of Rotting Jawbones, Sharp Toothed Jawbones and Thick Jawbones. Please bring them to me four at a time.");
  }
  if($text=~/loda/i){
    quest::say("Loda Kai left Shar Vahl many years ago. He had set off for the distant city of Katta Castellum just north of the tenebrous mountains. We have not seen him since, but the brigands wear his family emblem. $Kedra Kai has banished himself from our city in shame.");
  }
  if($text=~/kedra/i){
    quest::say("He stands vigil at the crossroads of the trading routes. Kedra has sworn to destroy the brigands and his brother before returning to Shar Vahl. There are many skeletal brigands within the thicket. If you are able to acquire their rotting jawbones, please bring them to me. I will try to learn what I can from the magic within them.");
  }
}

sub EVENT_ITEM {
my $text1 = quest::saylink("Loda", 1);
    if (plugin::check_handin(\%itemcount, 30872 == 1)) {
     quest::say"Thank you for your aid $name. I will place this spirit to peaceful rest and give these remains a proper burial. It is a shame you could only return with one. It takes four of these to make a real difference. Nevertheless your efforts are appreciated. Thank you."); 
     }
    elsif (plugin::check_handin(\%itemcount, 30872 == 2)) {
     quest::say"Thank you for your aid $name. I will place this spirit to peaceful rest and give these remains a proper burial. It is a shame you could only return with two. It takes four of these to make a real difference. Nevertheless your efforts are appreciated. Thank you."); 
     }
    elsif (plugin::check_handin(\%itemcount, 30872 == 3)) {
     quest::say"Thank you for your aid $name. I will place this spirit to peaceful rest and give these remains a proper burial. It is a shame you could only return with three. It takes four of these to make a real difference. Nevertheless your efforts are appreciated. Thank you."); 
     }
    elsif (plugin::check_handin(\%itemcount, 30872 => 4)) {
     quest::say("I can see that you have a brave heart. You have rescued many of the fallen spirits with little regard to your own welfare. Such selfless acts should not go unrewarded. Please take these gloves and wear them with pride. It is a symbol of rebirth.");
     quest::faction(132,10); # +Guardians of Shar Vahl
     quest::exp(1000);
     quest::ding();
     quest::summonitem(30879);
     }
    elsif(plugin::check_handin(\%itemcount, 30873 => 4)){
     quest::say("Thank you for bringing these to me $name.");
     quest::emote(' closes her eyes and meditates over the jawbones for a moment.');
     quest::say("I can sense the mark of the [$text1 Kai] within these jawbones. This is a horror, for Loda Kai was once a member of my people. I do not know how he came about these strange magical forces but it can not be good news. Please wear these sleeves for protection. This new discovery worries me deeply.");
     quest::summonitem(30877);
     quest::faction(132,10); # +Guardians of Shar Vahl
     quest::exp(1500);
     quest::ding();
     }
    elsif(plugin::check_handin(\%itemcount, 30874 => 4)){
     quest::say("Thank you for your aid $name. I will place this spirit to peaceful rest and give these remains a proper burial. Take these boots and wear them with pride. It is a symbol of rebirth.");
     quest::summonitem(30881);
     quest::faction(132,10); # +Guardians of Shar Vahl
     quest::exp(2000);
     quest::ding();
     }
    elsif(plugin::check_handin(\%itemcount, 30875 => 4)){
     quest::say("Thank you for your aid $name. I will place this spirit to peaceful rest and give these remains a proper burial. Take these leggings and wear them with pride. It is a symbol of rebirth.");
     quest::summonitem(30880);
     quest::faction(132,10); # +Guardians of Shar Vahl
     quest::exp(2500);
     quest::ding();
     }
    else {
    quest::say("I don't want these items, $name. You can have them back.");
    plugin::return_items(\%itemcount);
  }
}

# EOF zone: shadeweaver ID: 165130 NPC: Spiritist_Karina

