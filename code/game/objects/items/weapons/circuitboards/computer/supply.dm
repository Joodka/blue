#ifndef T_BOARD
#error T_BOARD macro is not defined but we need it!
#endif

/obj/item/weapon/circuitboard/order/supply
	name = T_BOARD("supply control console")
	build_path = /obj/machinery/computer/order/supply
	origin_tech = list(TECH_DATA = 3)
	var/contraband_enabled = 0

/obj/item/weapon/circuitboard/order/supply/construct(var/obj/machinery/computer/order/supply/SC)
	if (..(SC))
		SC.can_order_contraband = contraband_enabled

/obj/item/weapon/circuitboard/order/supply/deconstruct(var/obj/machinery/computer/order/supply/SC)
	if (..(SC))
		contraband_enabled = SC.can_order_contraband

/obj/item/weapon/circuitboard/order/supply/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I,/obj/item/device/multitool))
		var/catastasis = src.contraband_enabled
		var/opposite_catastasis
		if(catastasis)
			opposite_catastasis = "STANDARD"
			catastasis = "BROAD"
		else
			opposite_catastasis = "BROAD"
			catastasis = "STANDARD"

		if(alert("Current receiver spectrum is set to: [catastasis]","Multitool-Circuitboard interface","Switch to [opposite_catastasis]","Cancel") != "Cancel")
			src.contraband_enabled = !src.contraband_enabled
		else
			return
	return
