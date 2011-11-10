 sub EVENT_SAY { 
if($text=~/Hail/i){
	quest::say("Hello, $name.  Would you like to [pop], [depop], or [repop] the zone?"); 
	}

if($text=~/\bpop\b/i){
	quest::spawn_condition(lakerathe, 2,1); #gnolls are 2
	quest::spawn_condition(lakerathe, 1,1); #undead are 1
	quest::say("popping!");
	}
if($text=~/\bdepop\b/i){
	quest::spawn_condition(lakerathe,2,0);
	quest::spawn_condition(lakerathe,1,0);
	quest::say("depopping!");
	}
if($text=~/\brepop\b/i){
	quest::spawn_condition(lakerathe,1,0);
	quest::spawn_condition(lakerathe,2,0);
	quest::spawn_condition(lakerathe,1,1);
	quest::spawn_condition(lakerathe,2,1);
	quest::say("repopping!");
	}
}
