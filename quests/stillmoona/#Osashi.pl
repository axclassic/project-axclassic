sub EVENT_SAY {
my $Perseverance = quest::saylink("Perseverance", 1);
my $ready = quest::saylink("ready", 1);
  if($text=~/Hail/i) {
    quest::say("Greeting explorer, what brings you to our fine Temple? Could you be here for the Test of $Perseverance?");
  }
  if($text=~/Perseverance/i) {
    quest::say("Then prepare yourself and tell me when you are $ready the you shall begin the trial.");
	quest::spawn2(338167);
	quest::signalwith(338167,421,0);
  }
  if($text=~/ready/i) {
    quest::say ("And so it begins.");
	quest::signalwith(338167,422,0);
	quest::depop();
  }
 } 