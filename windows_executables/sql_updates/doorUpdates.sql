##Required SQL; 
ALTER TABLE `ax_classic`.`doors` ADD COLUMN `keyitem2` INTEGER NOT NULL DEFAULT 0 AFTER `keyitem`;


##Optional changes; 
## Charasis
UPDATE doors SET keyitem2=17274,nokeyring=1 WHERE zone regexp "char" AND keyitem>1;

##FrozenShadow
UPDATE doors SET keyitem2=20039,nokeyring=1 WHERE zone regexp "frozen" AND keyitem>1;
