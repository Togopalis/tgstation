/mob/living/simple_animal/hostile/poison/snake
	name = "snake"
	desc = "A slithery snake. These legless reptiles are the bane of mice and adventurers alike."
	icon_state = "snake"
	icon_living = "snake"
	icon_dead = "snake_dead"
	speak_emote = list("hisses")
	health = 20
	maxHealth = 20
	faction = list("cat")
	attacktext = "bites"
	melee_damage_lower = 5
	melee_damage_upper = 6
	response_help  = "pets"
	response_disarm = "shoos"
	response_harm   = "steps on"
	ventcrawler = VENTCRAWLER_ALWAYS
	density = FALSE
	pass_flags = PASSTABLE | PASSMOB
	mob_size = MOB_SIZE_SMALL
	gold_core_spawnable = FRIENDLY_SPAWN
	obj_damage = 0
	environment_smash = ENVIRONMENT_SMASH_NONE
	var/static/list/edibles = typecacheof(list(/mob/living/simple_animal/butterfly, /mob/living/simple_animal/cockroach, /mob/living/simple_animal/mouse))

/mob/living/simple_animal/hostile/poison/snake/CanAttack(atom/the_target)
	if(see_invisible < the_target.invisibility)
		return FALSE
	if(is_type_in_typecache(the_target,edibles))
		return TRUE
	return FALSE

/mob/living/simple_animal/hostile/poison/snake/AttackingTarget()
	if(is_type_in_typecache(target,edibles))
		visible_message("[name] consumes [target] in a single gulp", "<span class='notice'>You consume [target] in a single gulp</span>")
		QDEL_NULL(target) //Nom
		adjustBruteLoss(-2)
		return TRUE
	else
		return ..()
