## LOW/HIGH  LEVEL MOBS
## NURGA
## Angelox

sub EVENT_SPAWN {

if ($ulevel >=45){                                    #High
 quest::spawn_condition(nurga,7,0);
 quest::spawn_condition(nurga,8,1);

}else{						     #Low
 quest::spawn_condition(nurga,7,1);
 quest::spawn_condition(nurga,8,0);
  }
}

