sub EVENT_SAY {
my $caller = quest::saylink("caller", 1);
my $fooled = quest::saylink("fooled", 1);
    if($text=~/hail/i) {
    quest::emote(' looks side to side before speaking');
    quest::say("Tell me, what is your business? You here about the $caller?");
  }
	if($text=~/caller/i) {
    quest::say("The dark spiritcaller. The one that is upsetting the balance of things here. I should not be speaking to your kind. It will put me in great danger. Near here, you will find a creature that is able to call spirits to its aid. It may look harmless at first, but do not be $fooled.");
  }
    if($text=~/fooled/i) {
	quest::say("You will need to be very patient and brave to overcome this beast. You will find it this very moment if you make haste. I must leave soon so you must best this creature alone.");
	quest::spawn2(300094,0,0,571.6,-313.3,127.4,191.9);
	quest::spawn2(300093,0,0,571.6,-331.7,128.5,209.6);
	quest::spawn2(300092,0,0,571.6,-292.1,128.5,187.2);
	quest::depop();
  }
 } 