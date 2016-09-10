/turf/simulated/floor/diona
	name = "biomass flooring"
	icon_state = "diona"

/turf/simulated/floor/diona/attackby()
	return
/turf/simulated/floor/with_grille
	blocks_air = 1
	icon_state = "with_grille"
	var/strict_typecheck = 1
	var/tmp/border_type = /obj/structure/window
	var/id = null //for tint

	New()
		var/tint = border_type == /obj/structure/window/reinforced/polarized
		icon_state = "plating"
		..()
		spawn(5)
			var/type = /turf/simulated/floor
			if(strict_typecheck) type = src.type
			new /obj/structure/grille(src)
			var/obj/structure/window/reinforced/W = null
			for(var/dir in cardinal)
				if(!istype(get_step(src,dir), type))
					W = new border_type(src)
					W.dir = dir
					if(src.id && tint)
						W:id = src.id
			blocks_air = 0

/turf/simulated/floor/with_grille/reinforced
	icon_state = "with_grille_reinforced"
	border_type = /obj/structure/window/reinforced

/turf/simulated/floor/with_grille/tinted
	icon_state = "with_grille_tinted"
	border_type = /obj/structure/window/reinforced/polarized

/turf/simulated/shuttle
	name = "shuttle"
	icon = 'icons/turf/shuttle.dmi'
	thermal_conductivity = 0.05
	heat_capacity = 0
	layer = 2

/turf/simulated/shuttle/wall
	name = "wall"
	icon_state = "wall1"
	opacity = 1
	density = 1
	blocks_air = 1

/turf/simulated/shuttle/floor
	name = "floor"
	icon_state = "floor"

/turf/simulated/shuttle/plating
	name = "plating"
	icon = 'icons/turf/floors.dmi'
	icon_state = "plating"

/turf/simulated/shuttle/plating/skipjack //Skipjack plating
	oxygen = 0
	nitrogen = MOLES_N2STANDARD + MOLES_O2STANDARD

/turf/simulated/shuttle/floor4 // Added this floor tile so that I have a seperate turf to check in the shuttle -- Polymorph
	name = "Brig floor"        // Also added it into the 2x3 brig area of the shuttle.
	icon_state = "floor4"

/turf/simulated/shuttle/floor4/skipjack //skipjack floors
	name = "skipjack floor"
	oxygen = 0
	nitrogen = MOLES_N2STANDARD + MOLES_O2STANDARD


