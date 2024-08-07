# beginning of the main portion of the enchanter epic quest - staff of the serpent


sub EVENT_SAY {
my $masters = quest::saylink("masters", 1);
my $Modani = quest::saylink("Modani", 1);
my $Mizzle = quest::saylink("Mizzle", 1);
my $Nadia = quest::saylink("Nadia", 1);
my $Polzin = quest::saylink("Polzin", 1);
  if ($text=~/jeb/i) {
    quest::say("Yes, I am. Use your most enlightened magic to seek the truth of what is around you. When that is done, you will know what you seek.");
  }
  if ($text=~/sack/i) {
    quest::say("Take this sack and combine the items I requested in it. Then return it to me.");
   quest::summonitem(17861);
  }
  if ($text=~/serpent/i) {
    quest::say("The first truly powerful enchanter, Krilan Pedin, crafted the Serpent years ago. He trained his students to carry on the trade in a five-step process. Each student then became a $master and chose one of their own students to pass the legacy on to. Four others and I, myself, are current practitioners of the crafting.");
  }
  if ($text=~/masters/i) {
    quest::say("YThe Masters are enchanters who have reached the plateau of understanding. Their names are $Modani Qu'Loni, $Mizzle Gepple, $Nadia Starfeast, and $Polzin Mrid. All are master crafters in their own right.");
  }
  if ($text=~/enchantment/i) {
    quest::say("The masters are enchanters who have reached the plateau of understanding. Their names are Modani Qu'Loni, Mizzle Gepple, Nadia Starfeast, and Polzin Mrid. All are master crafters in their own right.");
  }
  if ($text=~/Modani/i) {
    quest::say("Modani is a master of illusions. You should seek him out first. Keep a careful eye out for him - he is never in his true form. The last time I spoke to him, he seemed very excited about his voyage to the elven outpost. You may or may not find more clues about his location there.");
  }
  if ($text=~/Mizzle/i) {
    quest::say("Mizzle is a gnome who has mastered the use of enlightened magic. Go to him once you have spoken to Modani. Mizzle is not one to travel, so you should not have to look far from his home to find him.");
  }
  if ($text=~/Nadia/i) {
    quest::say("The mistress of charm, Nadia is very beautiful. She, too, traveled with her relatives to the new land. I just recently received a letter from her. She says more and more pilgrims and explorers are arriving every day, and that the outpost is well defended now.");
  }
  if ($text=~/Polzin/i) {
    quest::say("Master of the Phantasms - he is the last one you will seek out. Hmm...Polzin is native to Erudin, however, after the incident near Paineel, no one has heard from him. I hope that he is well.");
  }
  }
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 10603 => 1)) {
    quest::say("I see that you have what I was waiting for. Stofo does do excellent work. It seems that you are to start on a long journey. Take this seal and it will guide you on your next step. Seek out the masters of enchantment. In time we will craft the Serpent for you. When you have collected the four parts of the staff, you must combine them in a bundle for me.");
    quest::summonitem(10604);
  }
  elsif (plugin::check_handin(\%itemcount, 10639 => 1)) {
    quest::say("The path you trod was long and hard. Now you are worthy to bear the Serpent. Use it well.");
    quest::faction(342,30);
    quest::summonitem(10650);
    quest::ding(); quest::exp(350000);
    quest::shout2("Denizens of The Rathe. Please join me in congratulating $name for earning the Enchanter Epic: Staff of the Serpent!");
    if($class ne 'Enchanter') {
        quest::shout2("...probably for a Bot since $name is a $class");
    }
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

# EOF Zone: bruningwood ID: 87065 NPC: a_sarnak_imitator

