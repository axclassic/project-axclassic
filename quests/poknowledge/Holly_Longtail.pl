#Holly_Longtail.pl
#Holly Longtail's Replacement Parts


sub EVENT_SAY {
    if($text=~/Hail/i) {
        quest::say("Hello, $name. The preservation of ancestors is a time-honored tradition. It's a task one must handle with painstaking care and precision. Please do not fret for the lives of these specimens. They live in the eternal realm of beauty now. I have quite a large collection of stuffed animals ready to go, but many of them have sustained injuries in their capture. In fact, I wouldn't mind some help to collect some [replacement parts] from creatures around the world.");
    }
    if($text=~/replacement parts/i) {
        quest::say("Grab a Collector's Box from [Merri] before you go. You need to recover an Undead Froglok Tongue, Cockatrice Beak, High Quality Cougarskin, and a Tiny Rockhopper Eye. Seal the box tightly and return it to me. If the contents are in sufficient and usable condition, I may have a reward for you.");
    }
    if($text=~/Merri/i) {
        quest::say("Curator Merri is the founder of the museum in the Selia district of New Tanaan. She is a true visionary and a wonderful person as well. It is her dream to turn life's love into something truly grand. She also carries with her the Collector's Boxes. If you need one, be sure to ask her for it.");
    }
}


sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount, 28076 => 1)) {
        #Collection of Taxidermy
        quest::emote("opens the box and carefully inspects its contents. 'These will do. Please accept this as a show of my appreciation. Now if you'll excuse me I have much work left to do.");
        quest::summonitem(28237);#Fine Antique Ring
    }
    else {
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
}
## Angelox: this spawn needs to be verified, the original NPC is de-popped before respaw, else zone crashes
#sub EVENT_SPAWN {
#my $x = $npc->GetX();
#my $y = $npc->GetY();
#my $z = $npc->GetZ();
#my $h = $npc->GetHeading();
#quest::spawn2(202020,0,0,$x - 10,$y,$z,$h);
#}
#END of FILE Zone:poknowledge Holly_Longtail 
