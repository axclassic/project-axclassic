####Fabled Depoper###
### Romell 6-9-09

sub EVENT_AGGRO
{
	if($ulevel <= 34)
{
	quest::shout("We shall meet again $name! When you are a worthy opponent!!");
	quest::depop;
	}
}