Scriptname FPPUnequipAmmo extends ReferenceAlias  

Event OnObjectUnequipped(Form akBaseObject, ObjectReference akReference)
	Actor act = self.GetActorRef()
	if (!act.WornHasKeyword(VendorItemArrow))
		return
	endif
	
	Weapon wpn = akBaseObject as Weapon
	
	if (wpn)
		int wpntype = wpn.GetWeaponType()
		if (wpntype == 7 || wpntype == 9) ; bow & crossbow
			Ammo eqammo = self.getAmmo()
			if (eqammo)
				act.UnEquipItem(eqammo)
			endif
		endif
	else
		int handledwpntype = act.GetEquippedItemType(0)
		if (handledwpntype == 7 || handledwpntype == 9)
			Ammo eqammo = self.getAmmo()
			if (eqammo)
				act.UnEquipItem(eqammo)
			endif
		endif
	endif
EndEvent

Ammo Function getAmmo()
	int i = 0
	Actor act = self.GetActorRef()
	int listSize = FPPAmmoList.GetSize()
	
	while (i < listSize)
		Ammo arrow = FPPAmmoList.GetAt(i) as Ammo
		if (act.IsEquipped(arrow))
			return arrow
		endif
		i += 1
	endwhile

	return None
EndFunction

Keyword Property VendorItemArrow  Auto  
FormList Property FPPAmmoList  Auto  
