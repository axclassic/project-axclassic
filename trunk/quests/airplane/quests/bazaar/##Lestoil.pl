## Angelox Bazaar Vendors :)

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 90, $x + 90, $y - 90, $y + 90);
}

sub EVENT_ENTER
{
	$npc->SetAppearance(1);
	my $random_result = int(rand(100));
	if ($random_result<=15){
	quest::shout("Lambent Bard  gear For sale!");
	}else{
	#Do Nothing
 }
}

sub EVENT_SIGNAL {
    my $random_result = int(rand(100));
    if($random_result<=10){
    quest::shout("Lambent  for sale at Red Dragon!");
    }else{
    #say nothing
 }
}
