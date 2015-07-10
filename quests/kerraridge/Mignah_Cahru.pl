sub EVENT_SAY { 
my $Slate = quest::saylink("Slate", 1);
if($text=~/Hail/i){
quest::say("Hello. $name. I am Mignah. a humble acrylia specialist. If you have a form of acrylia that merchants will not buy please hand it to me and I will pay you whatever it may be worth or are you here for Acrylia $Slate."); 
}
  elsif ($text=~/Slate/i){
    quest::emote("pulls a smoldering piece of forged acrylia from a nearby oven and, before you can react, presses your hand into the still soft metal.");
    quest::say("This may hurt a bit, but it'll heal.");
    quest::emote("etches your name and the date into the slate and plunges it into a bucket of water before placing it into your stinging palm. ");
    # Acrylia Slate
    quest::summonitem("2876");
  }
  }
#END of FILE Zone:kerraridge  ID:74276 -- Mignah_Cahru 

