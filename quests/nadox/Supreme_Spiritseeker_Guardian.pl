sub EVENT_SPAWN {
 $x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 40, $x + 40, $y - 40, $y + 40);
	}
sub EVENT_ENTER {
my $council = quest::saylink("council", 1);
     quest::say("Halt! Do you seek $council from the Supreme Spiritseeker?");
	} 
sub EVENT_SAY {
    if($text=~/council/i && defined $qglobals{"EpicBox"} == 1) {
     quest::say("Very well I will grant you entrance and summon him.");
	 quest::depopall(227132);
     quest::depopall(227133);
     quest::depopall(227134);
     quest::depopall(227135);
     quest::depopall(227136);
     quest::depopall(227137);
     quest::depopall(227138);
   quest::spawn2(227147,0,0,-544.2,-381.2,27.9,127.3);
   quest::spawn2(227119,0,0,-537.1,-435.3,4,127.6);
   quest::spawn2(227140,0,0,-559.6,-584,4,216.6);
   quest::spawn2(227140,0,0,-510,-584,4,214.5);
   quest::spawn2(227140,0,0,-561,-489,4,221.9);
   quest::spawn2(227143,0,0,-510,-488,4,8);
   quest::spawn2(227142,0,0,-493.1,-422.7,4,126.5);
   quest::spawn2(227142,0,0,-554.5,-424,4,125.1);
   quest::spawn2(227140,0,0,-583.9,-348,15,128.1);
   quest::spawn2(227140,0,0,-486.7,-342,15,124);
   quest::depopall(227144);
  }
 }

