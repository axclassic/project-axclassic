
sub EVENT_SAY {

  if($text=~/hail/i){
	quest::say("Hail, $name. Are you here for the [hunt]?");
  }

  if($text=~/hunt/i){
    if (!quest::istaskenabled(13)) {
      quest::enabletask(13);
        }
    if (!quest::istaskactive(13)) {
      quest::taskselector(13);
    }
  }

}