# Angelox's EQ Bots
#Gunthak healer
sub EVENT_SAY { 
 if($class eq 'Cleric'){quest::say("Sorry, I can't help a cleric");}
 elsif($class eq 'Shaman'){
 quest::say("Sorry, I can't help a Shaman");}
 elsif($class eq 'Necromancer'){
 quest::say("Sorry, I can't help a Necro");}
 elsif($class eq 'Wizard'){
 quest::say("Sorry, I can't help a Wizard");}
 elsif($class eq 'Magician'){
 quest::say("Sorry, I can't help a Magician");}
 elsif($class eq 'Enchanter'){
 quest::say("Sorry, I can't help a Enchanter");}
 elsif($class eq 'Beastlord'){
 quest::say("Sorry, I can't help a Beastlord");}
 elsif($text=~/follow/i){
quest::clear_proximity();
quest::say("Following");
quest::follow($userid); }
 elsif($text=~/quit/i){
 quest::say("Ok, good-bye!");
 quest::delglobal("sandy");
 quest::setglobal("sandy","3","3","F");
 $sandy=undef;
 quest::delglobal("$name");
 quest::setglobal("$name","2","3","F");
 quest::clear_proximity();
 quest::depop();}
elsif($text=~/hail/i){
quest::say("I'm ready $name, do you need to know the [commands]?");}
elsif($text=~/commands/i){
quest::say("If you target and say [follow], then I will follow you,");
quest::say("If you target and say [stop], then I will stop, but don't go to far away, else you'll loose me,");
quest::say("If you target and say [quit], I will go away,");
quest::say("I can [heal] you with celestial healing, and I have [temperance] for buffs,");
quest::say("You have to trarget me for my attention.");
quest::say("Don't forget to tell me to [quit] when you're done.");}
elsif($text=~/heal/i){
 quest::say("Casting celestial healing ...");
 quest::settimer("cheal1",5);}
elsif($text=~/temp/i){
quest::say("Casting temperance ...");
quest::settimer("temp1",15);}
elsif($text=~/stop/i){
 quest::clear_proximity();
 quest::depop();
 my $a = 224236;
 my $x = $npc->GetX();
 my $y = $npc->GetY();
 my $z = $npc->GetZ(); 
quest::spawn2($a,1,0,$x,$y,$z,$h);
quest::say("Ok, don't stray too far!");}
}

sub EVENT_SPAWN{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 120, $x + 120, $y - 120, $y + 120);}

sub EVENT_EXIT{
	quest::depop();
	quest::delglobal("sandy");
	quest::setglobal("sandy","3","3","F");
	$sandy=undef;
	quest::delglobal("$name");
	quest::setglobal("$name","2","3","F");}

sub EVENT_TIMER
{
    if ($timer eq "cheal1"){
        quest::stoptimer("cheal1");
        $npc->CastSpell(1444,$userid);}
    elsif ($timer eq "temp1"){
        quest::stoptimer("temp1");
        $npc->CastSpell(3692,$userid);}
}

sub EVENT_DEATH{
	quest::delglobal("sandy");
	quest::setglobal("sandy","3","3","F");
	$sandy=undef;
	quest::delglobal("$name");
	quest::setglobal("$name","2","3","F"); }

