sub EVENT_SAY {
my $new = quest::saylink("new", 1);
my $before = quest::saylink("before", 1);
  if($text=~/Hail/i) {
    quest::say("Hail $name, I am Zol Master Shargnol, Necromancer Guildmaster of the Guktan Army.");
    quest::say("Are you $new to the area? Or have I seen you $before?");
    }
  if($text=~/new/i) {
	quest::say("Well then I welcome you to our new home $name. I feel we can make this place our own while we plan the invaison and recapturing of our dear old Gutka.");
	quset::say("Do you have something for me?");
	}
  if($text=~/before/i) {
	quest::say("Welcome back, young Zol. I hope your training is going well. Unfortunately I have been unable to keep up to date on your progress, but should you need advanced training in any individual skills, I am here to help you with that. As well, I am here to guide you through your growth as a Rogue in the Guktan Army. With the skills that you learn here, you will be better prepared to serve the Army.");
  }
  }
  
sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 51634 => 1) && $class eq "Necromancer") { 
  quest::say("I welcome you $name to the order of Zol, followers of our father Innoruuk");
  quest::say("Take this Robe and wear it with pride! May it protect you as you grow young Zol.");  
  quest::summonitem(119877);
  quest::ding();
  quest::exp(1000);
  }
  	else {
	quest::say("I cant use this.");
    plugin::return_items(\%itemcount); 
}
}