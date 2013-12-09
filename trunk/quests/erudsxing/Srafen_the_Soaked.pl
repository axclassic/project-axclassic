sub EVENT_SPAWN {
  quest::settimer("depop",600);
}

sub EVENT_SAY {
my $here = quest::saylink("here", 1);
my $wait = quest::saylink("wait", 1);
my $us = quest::saylink("us", 1);
my $wait = quest::saylink("wait", 1);
my $else = quest::saylink("else", 1);
  if($text=~/hail/i) {
   quest::say("Why hello there! Ahh, it's good to see a new face down $here. So you've come to $wait with $us eh? That is splendid! It's been getting very boring lately.");
  }
  if($text=~/here/i) {
   quest::say("Oh! Well this is where $we wait. It's not much for looks but if you're lucky, a pretty fish will swim by. Oh, and once Dillon said he saw one of those fish women, a mermaid, he called it! Although, I'm not so sure of his state of mind, hehehe. He's been waiting here much longer than I.");
  }
  if($text=~/us/i) {
   quest::say("Well, there's me, Srafen. I've been down here for, can't quite remember, a number of years, I guess. If my wife saw the condition my clothes are in, she'd whack me, I'm sure, heheh. Although I'd bet she's long since dead, probably. Then there's Dillon. He says he's been here since those people up top in Erud blew that big hole in the ground. Not sure what happened but I guess it was a long time ago. Hmmmm, who $else?");
   quest::signalwith(98009,199);
  }
  if($text=~/wait/i) {
   quest::say("We've been waiting quite some time, really. I have been here the least amount of time, but that doesn't help keep the boredom away, heheh. What are we waiting for, you ask? HehehHAahahah! What are we waiting for?? Heheheh, what a silly question! It's quite obvious if you take the time to think about it. Heh. Ummm.. I'm really not sure.");
  }
  if($text=~/else/i) {
   quest::say("Ahh, yes, there's also a really old guy I've only seen a couple times, name's Froham. Whew, he is really old, and not much of a talker. Mostly mumbles from time to time. Dillon says he's been here since Erud first took his people across the sea. Not sure who this Erud feller is but Froham isn't in the best of shape, so it must have been a LONG time ago. Froham did mention there's one other guy but we've never seen him.");
   quest::say("He apparently had something to do with the Combine Empire, no idea what that is though.");
   quest::spawn2(98051,0,0,4215.0,-1610.0,-287.3,0.0);
  }
  if($text=~/illusion/i) {
    quest::say("Awww, well that's too bad. Although illusions and real people don't seem to be much different at times, so, please stay and keep Dillon and me company. We could use it, right Dillon?");
    quest::say("Hey Dillon, why don't you tell us again about what happened up top? You know, where they blew that big hole into the ground.");
    quest::signalwith(98051,299,650);
  }
}

sub EVENT_SIGNAL {
  if ($signal == 199) {
   quest::emote("looks around frantically a moment then laughs");
   quest::doanim(12);
   quest::say("Ohhh, them! Hehehe! This is a friend of mine come to wait with us. Isn't that exciting, Dillon? And it's not just an illusion, I don't think! Say, are you [an illusion], shaman?");
  }
  if ($signal == 298) {
    quest::spawn2(98047,0,0,4220.0,-1610.0,-287.3,0.0);
  }
  if ($signal == 299) {
    quest::spawn2(8117,0,0,4219.4,-1586.2,-292.7,128.1);
  }
  if ($signal == 300) {
    quest::spawn2(98050,0,0,4201.3,-1599.1,-292.7,70.5);
  }
  if ($signal == 250) {
    quest::signalwith(98050,500);
  }
  if ($signal == 399) {
    quest::depop();
  }
}
