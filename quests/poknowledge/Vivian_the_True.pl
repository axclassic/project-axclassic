## Vivian the True

my @task_list = ();

sub EVENT_SAY {
  if(quest::istaskactive(138)) { #New Beginnings
    quest::say("You fought alongside Arias in the Mines of Gloomingdeep! He's alive then! Thank the gods! Thank the gods and thank you, stranger! Please let me repay your kind news with my hospitality. I can help you establish yourself here in the Plane of Knowledge. Really, it's the least I can do.");
  }
  else {
    if ($text=~/hail/i) {
       quest::say("Welcome to the Plane of Knowledge, or New Tanaan. All are welcome here, so please feel free to explore. Our home here is a safe haven to those who seek knowledge of all sorts, and many find themselves setting off upon new adventures based on what they find here. No harmful magics may be used, nor weapons. Our fair city also acts as a hub of sorts into Norrath and other destinations. Are you [new to the world]?");
    }
    if($text=~/new to the world/i) {
      if($class eq "Beastlord") {
        push (@task_list, 200); #Tomes of Knowledge (Beastlord)
      }
      if($class eq "Rogue") {
        push (@task_list, 201); #Tomes of Knowledge (Rogue)
        push (@task_list, 202); #Training Day
      }
      push (@task_list, 208); #Errands for Castlen
      push (@task_list, 209); #Common Cents
      quest::taskselector(@task_list);
      @task_list = ();
    }
  }
}

sub EVENT_ITEM {
    my $stuff = (\%itemcount);
    my $yes = 2;
    foreach my $k (keys(%{$stuff})) {
       next if($k == 0);
       $yes = 1;
    }
    if($yes == 1) {
        quest::say("I don't need this $name. Take it back.");
       plugin::return_items(\%itemcount);
    }
    if($platinum != 0 || $gold !=0 || $silver != 0 || $copper != 0) {
       quest::say("Thanks for the coin!");
    }
}